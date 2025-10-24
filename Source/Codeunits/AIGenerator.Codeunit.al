codeunit 50106 "AI Generator"
{
    Access = Public;

    /// <summary>
    /// Generates AI response based on user input and AI setup.
    /// </summary>
    /// <param name="AISetupCode">Code of the AI Setup to use</param>
    /// <param name="UserInput">User's prompt/input text</param>
    /// <returns>Generated response from AI</returns>
    procedure GenerateResponse(AISetupCode: Code[20]; UserInput: Text): Text
    var
        AISetup: Record "AI Setup";
        AIFacade: Codeunit "AI Facade";
        JsonRequest: JsonObject;
        JsonResponse: JsonObject;
        GeneratedText: Text;
    begin
        // Validate input
        if AISetupCode = '' then
            Error('AI Setup Code cannot be empty.');

        if UserInput = '' then
            Error('User input cannot be empty.');

        // Get AI Setup
        if not AISetup.Get(AISetupCode) then
            Error('AI Setup with code %1 not found.', AISetupCode);

        // Check if AI Setup is active
        if AISetup.Status <> AISetup.Status::Active then
            Error('AI Setup %1 is not activated. Current status: %2', AISetupCode, AISetup.Status);

        // Generate response using AI Facade
        JsonRequest := AIFacade.BuildRequest(AISetup, AISetup."AI Implementation", UserInput);
        JsonResponse := AIFacade.SendRequest(AISetup, AISetup."AI Implementation", JsonRequest);
        GeneratedText := AIFacade.ProcessResponse(AISetup."AI Implementation", JsonResponse);

        exit(GeneratedText);
    end;
}