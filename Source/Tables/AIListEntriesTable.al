table 50101 "AI List Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the code of the AI setup.';
            TableRelation = "AI Setup".Code;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the description of the AI setup.';
            FieldClass = FlowField;
            CalcFormula = lookup("AI Setup".Description where(Code = field(Code)));
            Editable = false;
        }
        field(3; "AI Implementation"; Enum "AI Implementation")
        {
            Caption = 'AI Implementation';
            ToolTip = 'Specifies the AI implementation to be used.';
            FieldClass = FlowField;
            CalcFormula = lookup("AI Setup"."AI Implementation" where(Code = field(Code)));
            Editable = false;
        }
        field(4; Status; Enum "AI Agent Status")
        {
            Caption = 'Status';
            ToolTip = 'Specifies the status of the AI setup.';
            Editable = false;
            InitValue = "Not Activated";
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