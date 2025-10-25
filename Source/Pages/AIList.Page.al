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
                }
                field(Description; Rec.Description)
                {
                }
                field("AI Implementation"; Rec."AI Implementation")
                {
                }
                field(Status; Rec.Status)
                {
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

            action(OpenPromptPage)
            {
                Caption = 'Open Prompt Page';
                Image = Comment;

                trigger OnAction()
                begin
                    Page.Run(50102);
                end;
            }
        }
    }
}