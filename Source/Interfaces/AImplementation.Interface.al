interface IAImplementation
{
    /// <summary>
    /// Initializes the implementation.
    /// </summary>
    procedure InitializeImplementation();

    /// <summary>
    /// Sets the system role prompt.
    /// </summary>
    /// <param name="SystemRolePrompt"></param>
    procedure SetSystemRolePrompt(SystemRolePrompt: Text);

    /// <summary>
    /// Sets the user prompt.
    /// </summary>
    /// <param name="UserPrompt"></param>
    procedure SetUserPrompt(UserPrompt: Text);

    /// <summary>
    /// Sends the request.
    /// </summary>
    procedure SendRequest();
}