codeunit 50100 "Copilot Implementation" implements IAImplementation
{
    procedure SetSystemRolePrompt(var AISetup: Record "AI Setup"; SystemRolePrompt: Text)
    begin

    end;

    procedure SendRequest(AISetup: Record "AI Setup"; JsonRequest: JsonObject): JsonObject
    begin

    end;

    procedure BuildRequest(AISetup: Record "AI Setup"; UserPrompt: Text): JsonObject
    begin

    end;

    procedure ProcessResponse(Response: JsonObject): Text
    begin

    end;
}