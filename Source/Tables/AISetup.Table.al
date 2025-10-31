table 50100 "AI Setup"
{
    DataClassification = CustomerContent;
    Caption = 'AI Setup';
    DrillDownPageId = "AI Setup";
    LookupPageId = "AI Setup";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the code of the AI setup.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the description of the AI setup.';
        }
        field(3; "AI Implementation"; Enum "AI Implementation")
        {
            Caption = 'AI Implementation';
            ToolTip = 'Specifies the AI implementation to be used.';
        }
        field(4; Model; Text[100])
        {
            Caption = 'Model';
            ToolTip = 'Specifies the model to be used for the AI implementation.';
        }
        field(5; "Username"; Text[100])
        {
            Caption = 'Username';
            ToolTip = 'Specifies the username for the AI implementation.';
        }
        field(6; "Password"; Text[100])
        {
            Caption = 'Password';
            ToolTip = 'Specifies the password for the AI implementation.';
            MaskType = Concealed;
        }
        field(7; "API Key"; Text[250])
        {
            Caption = 'API Key';
            ToolTip = 'Specifies the API key for the AI implementation.';
        }
        field(8; "System Role Prompt"; Text[1024])
        {
            Caption = 'System Role Prompt';
            ToolTip = 'Specifies the system role prompt for the AI implementation.';
        }
        field(9; Status; Enum "AI Agent Status")
        {
            Caption = 'Status';
            ToolTip = 'Specifies the status of the AI setup.';
            Editable = false;
            InitValue = "Not Activated";
        }
        field(10; URL; Text[250])
        {
            Caption = 'URL';
            ToolTip = 'Specifies the URL for the AI implementation.';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }


    trigger OnRename()
    var
        RenameNotAllowedLbl: Label 'Renaming AI Setup records is not allowed.';
    begin
        Error(RenameNotAllowedLbl);
    end;

}