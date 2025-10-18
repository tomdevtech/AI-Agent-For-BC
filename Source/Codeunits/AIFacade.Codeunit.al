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
    /// Initializes the AI implementation.
    /// </summary>
    /// <param name="ImplementationType"></param>
    procedure InitializeImplementation(ImplementationType: Enum "AI Implementation");
    begin
        GetImplementation(ImplementationType).InitializeImplementation();
    end;

    /// <summary>
    /// Sets the system role prompt.
    /// </summary>
    /// <param name="ImplementationType"></param>
    /// <param name="SystemRolePrompt"></param>
    procedure SetSystemRolePrompt(ImplementationType: Enum "AI Implementation"; SystemRolePrompt: Text);
    begin
        GetImplementation(ImplementationType).SetSystemRolePrompt(SystemRolePrompt);
    end;

    /// <summary>
    /// Sets the user prompt.
    /// </summary>
    /// <param name="ImplementationType"></param>
    /// <param name="UserPrompt"></param>
    procedure SetUserPrompt(ImplementationType: Enum "AI Implementation"; UserPrompt: Text);
    begin
        GetImplementation(ImplementationType).SetUserPrompt(UserPrompt);
    end;

    /// <summary>
    /// Sends the request.
    /// </summary>
    /// <param name="ImplementationType"></param>
    procedure SendRequest(ImplementationType: Enum "AI Implementation");
    begin
        GetImplementation(ImplementationType).SendRequest();
    end;

    /// <summary>
    /// Builds the request.
    /// </summary>
    /// <param name="ImplementationType"></param>
    /// <returns></returns>
    procedure BuildRequest(ImplementationType: Enum "AI Implementation"): JsonObject
    begin
        exit(GetImplementation(ImplementationType).BuildRequest());
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