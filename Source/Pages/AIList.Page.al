page 50101 "AI Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AI List Entries";

    layout
    {
        area(Content)
        {
            repeater(Repeater)
            {
                field(Code; Rec.Code)
                {
                    TableRelation = "AI Setup".Code;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("AI Implementation"; Rec."AI Implementation")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Change Status")
            {
                Caption = 'Change Status';
                Image = Start;

                trigger OnAction()
                var
                    AISetupMgt: Codeunit "AI Setup Mgt";
                begin
                    AISetupMgt.UpdateStatus(Rec.Code, Rec.Status);
                end;
            }
        }
    }
}