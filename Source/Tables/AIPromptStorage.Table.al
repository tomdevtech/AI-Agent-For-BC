table 50102 "AI Prompt Storage"
{
    DataClassification = CustomerContent;
    TableType = Temporary;
    Caption = 'AI Prompt Storage';

    fields
    {
        field(1; "AI Setup"; Code[20])
        {
            Caption = 'AI Setup';
            TableRelation = "AI Setup".Code;
        }
        field(2; "User Input"; Text[250])
        {
            Caption = 'User Input';
        }
    }
}