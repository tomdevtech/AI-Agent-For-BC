codeunit 50103 "AI Setup Mgt"
{
    procedure UpdateStatus(Code: Code[20]; var NewStatus: Enum "AI Agent Status")
    var
        AISetup: Record "AI Setup";
    begin
        if AISetup.Get(Code) then begin
            case NewStatus of
                NewStatus::"Not Activated":
                    NewStatus := NewStatus::Active;
                NewStatus::Active:
                    NewStatus := NewStatus::"Not Activated";
            end;

            AISetup.Status := NewStatus;
            AISetup.Modify();
        end;
    end;
}