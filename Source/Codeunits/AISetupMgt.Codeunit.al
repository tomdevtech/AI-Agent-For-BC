codeunit 50103 "AI Setup Mgt"
{
    procedure UpdateStatus(Code: Code[20]; NewStatus: Enum "AI Agent Status")
    var
        AISetup: Record "AI Setup";
    begin
        if AISetup.Get(Code) then begin
            AISetup.Status := NewStatus;
            AISetup.Modify();
        end;
    end;
}