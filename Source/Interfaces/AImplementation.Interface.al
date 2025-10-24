interface IAImplementation
{
    /// <summary>
    /// Sets the system role prompt.
    /// </summary>
    /// <param name="SystemRolePrompt"></param>
    procedure SetSystemRolePrompt(SystemRolePrompt: Text);

    /// <summary>
    /// Sends the request.
    /// </summary>
    procedure SendRequest(JsonRequest: JsonObject): JsonObject;

    /// <summary>
    /// Builds the request.
    /// </summary>
    /// <returns></returns>
    procedure BuildRequest(UserPrompt: Text): JsonObject;

    /// <summary>
    /// Processes the response.
    /// </summary>
    /// <param name="Response"></param>
    /// <returns></returns>
    procedure ProcessResponse(Response: JsonObject): Text;
}