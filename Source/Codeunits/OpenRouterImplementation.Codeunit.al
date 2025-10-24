codeunit 50102 "OpenRouter Implementation" implements IAImplementation
{

    /// <summary>
    /// Sets the system role prompt.
    /// </summary>
    /// <param name="SystemRolePrompt"></param>
    procedure SetSystemRolePrompt(SystemRolePrompt: Text)
    var
        AISetup: Record "AI Setup";
    begin
        AISetup.SetRange("AI Implementation", AISetup."AI Implementation"::OpenRouter);
        if AISetup.FindFirst() then begin
            AISetup."System Role Prompt" := SystemRolePrompt;
            AISetup.Modify();
        end;
    end;

    /// <summary>
    /// Sends the request.
    /// </summary>
    /// <param name="JsonRequest"></param>
    /// <returns></returns>
    procedure SendRequest(JsonRequest: JsonObject): JsonObject
    var
        HttpClient: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        HttpContent: HttpContent;
        HttpHeaders: HttpHeaders;
        RequestText: Text;
        ResponseText: Text;
        ResponseObject: JsonObject;
        AISetup: Record "AI Setup";
        HTTPHelper: Codeunit "HTTP Helper";
        APIKeyTxt: Label 'Bearer %1', Comment = '%1 = API Key';
    begin
        // Get AI Setup for API configuration
        AISetup.SetRange("AI Implementation", AISetup."AI Implementation"::OpenRouter);
        if not AISetup.FindFirst() then
            Error('OpenRouter AI Setup not found.');

        // Convert JSON request to text
        JsonRequest.WriteTo(RequestText);

        // Setup HTTP content
        HttpContent.WriteFrom(RequestText);
        HttpContent.GetHeaders(HttpHeaders);
        HttpHeaders.Clear();
        HttpHeaders.Add('Content-Type', 'application/json');

        // Setup HTTP request
        HttpRequestMessage.Content := HttpContent;
        HttpRequestMessage.SetRequestUri(AISetup.URL);
        HttpRequestMessage.Method := 'POST';

        // Add authorization header
        HttpRequestMessage.GetHeaders(HttpHeaders);
        HttpHeaders.Add('Authorization', StrSubstNo(APIKeyTxt, AISetup."API Key"));

        // Send request
        if not HttpClient.Send(HttpRequestMessage, HttpResponseMessage) then
            Error('Failed to send request to OpenRouter API.');

        // Validate HTTP response status using HttpHelper
        HTTPHelper.ValidateHttpResponse(HttpResponseMessage);

        // Read response content and return as raw JSON object
        HttpResponseMessage.Content().ReadAs(ResponseText);

        // Return raw response without processing
        if not ResponseObject.ReadFrom(ResponseText) then
            Error('Failed to parse response as JSON.');

        exit(ResponseObject);
    end;

    procedure BuildRequest(UserPrompt: Text): JsonObject
    var
        RequestObject: JsonObject;
        MessagesArray: JsonArray;
        SystemMessage: JsonObject;
        UserMessage: JsonObject;
        AISetup: Record "AI Setup";
    begin
        // Get AI Setup for model configuration
        AISetup.SetRange("AI Implementation", AISetup."AI Implementation"::OpenRouter);
        if AISetup.FindFirst() then;

        // Build the request object for OpenRouter API
        RequestObject.Add('model', AISetup.Model);
        RequestObject.Add('max_tokens', 1000);
        RequestObject.Add('temperature', 0.7);

        // Add system message if available
        if AISetup."System Role Prompt" <> '' then begin
            SystemMessage.Add('role', 'system');
            SystemMessage.Add('content', AISetup."System Role Prompt");
            MessagesArray.Add(SystemMessage);
        end;

        // Add user message
        UserMessage.Add('role', 'user');
        UserMessage.Add('content', UserPrompt);
        MessagesArray.Add(UserMessage);

        RequestObject.Add('messages', MessagesArray);

        exit(RequestObject);
    end;

    procedure ProcessResponse(Response: JsonObject): Text
    var
        ChoicesArray: JsonArray;
        ChoiceObject: JsonObject;
        MessageObject: JsonObject;
        ContentToken: JsonToken;
        ChoiceToken: JsonToken;
        MessageToken: JsonToken;
        ResponseText: Text;
    begin
        // Parse OpenRouter API response structure
        // Expected format: { "choices": [{ "message": { "content": "..." } }] }

        if Response.Get('choices', ContentToken) and ContentToken.IsArray() then begin
            ChoicesArray := ContentToken.AsArray();

            if ChoicesArray.Count() > 0 then begin
                ChoicesArray.Get(0, ChoiceToken);

                if ChoiceToken.IsObject() then begin
                    ChoiceObject := ChoiceToken.AsObject();

                    if ChoiceObject.Get('message', MessageToken) and MessageToken.IsObject() then begin
                        MessageObject := MessageToken.AsObject();

                        if MessageObject.Get('content', ContentToken) and ContentToken.IsValue() then begin
                            ResponseText := ContentToken.AsValue().AsText();
                            exit(ResponseText);
                        end;
                    end;
                end;
            end;
        end;

        // Fallback: Return empty text if parsing fails
        exit('');
    end;
}