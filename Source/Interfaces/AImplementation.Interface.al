interface IAImplementation
{
    /// <summary>
    /// Sets the system role prompt for the setup.
    /// </summary>
    /// <param name="AISetup"></param>
    /// <param name="SystemRolePrompt"></param>
    procedure SetSystemRolePrompt(var AISetup: Record "AI Setup"; SystemRolePrompt: Text);

    /// <summary>
    /// Sends the request.
    /// </summary>
    procedure SendRequest(AISetup: Record "AI Setup"; JsonRequest: JsonObject): JsonObject;

    /// <summary>
    /// Builds the request.
    /// </summary>
    /// <returns></returns>
    procedure BuildRequest(AISetup: Record "AI Setup"; UserPrompt: Text): JsonObject;

    /// <summary>
    /// Processes the response.
    /// </summary>
    /// <param name="Response"></param>
    /// <returns></returns>
    procedure ProcessResponse(Response: JsonObject): Text;
}