codeunit 50104 "AI Facade"
{
    Access = Internal;

    /// <summary>
    /// Gets the AI implementation based on the selected type.
    /// </summary>
    /// <param name="ImplementationType"></param>
    /// <returns></returns>
    procedure GetImplementation(ImplementationType: Enum "AI Implementation"): Interface IAImplementation
    begin
        exit(ImplementationType);
    end;

    /// <summary>
    /// Sets the system role prompt.
    /// </summary>
    /// <param name="AISetup"></param>
    /// <param name="ImplementationType"></param>
    /// <param name="SystemRolePrompt"></param>
    procedure SetSystemRolePrompt(AISetup: Record "AI Setup"; ImplementationType: Enum "AI Implementation"; SystemRolePrompt: Text);
    begin
        GetImplementation(ImplementationType).SetSystemRolePrompt(AISetup, SystemRolePrompt);
    end;

    /// <summary>
    /// Sends the request.
    /// </summary>
    /// <param name="AISetup"></param>
    /// <param name="ImplementationType"></param>
    /// <param name="JsonRequest"></param>
    /// <returns></returns>
    /// <returns></returns>
    procedure SendRequest(AISetup: Record "AI Setup"; ImplementationType: Enum "AI Implementation"; JsonRequest: JsonObject): JsonObject;
    begin
        exit(GetImplementation(ImplementationType).SendRequest(AISetup, JsonRequest));
    end;

    /// <summary>
    /// Builds the request.
    /// </summary>
    /// <param name="AISetup"></param>
    /// <param name="ImplementationType"></param>
    /// <param name="UserPrompt"></param>
    /// <returns></returns>
    procedure BuildRequest(AISetup: Record "AI Setup"; ImplementationType: Enum "AI Implementation"; UserPrompt: Text): JsonObject
    begin
        exit(GetImplementation(ImplementationType).BuildRequest(AISetup, UserPrompt));
    end;

    /// <summary>
    /// Processes the response.
    /// </summary>
    /// <param name="ImplementationType"></param>
    /// <param name="Response"></param>
    /// <returns></returns>
    procedure ProcessResponse(ImplementationType: Enum "AI Implementation"; Response: JsonObject): Text
    begin
        exit(GetImplementation(ImplementationType).ProcessResponse(Response));
    end;
}