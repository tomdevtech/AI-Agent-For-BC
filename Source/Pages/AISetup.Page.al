page 50100 "AI Setup"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "AI Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("AI Implementation"; Rec."AI Implementation")
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Username"; Rec."Username")
                {
                }
                field("Password"; Rec."Password")
                {
                }
                field("API Key"; Rec."API Key")
                {
                }
                field("System Role Prompt"; Rec."System Role Prompt")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }
}