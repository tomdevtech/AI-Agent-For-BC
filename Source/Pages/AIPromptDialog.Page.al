page 50102 "AI Prompt Dialog"
{
    Caption = 'AI Prompt Dialog';
    ApplicationArea = All;
    UsageCategory = Tasks;
    PageType = PromptDialog;
    SourceTable = "AI Prompt Storage";
    Extensible = false;
    SourceTableTemporary = true;
    DelayedInsert = true;
    Editable = true;



    layout
    {
        area(Content)
        {
            group("AI Model")
            {
                Caption = 'AI Model';
                field("AI Setup"; Rec."AI Setup")
                {
                    ApplicationArea = All;
                    Caption = 'AI Setup';
                    ToolTip = 'Select the AI setup to use for this prompt.';
                    TableRelation = "AI Setup".Code;
                }
            }
            group(Input)
            {
                Caption = 'User Input';
                field("User Input"; Rec."User Input")
                {
                    ApplicationArea = All;
                    Caption = 'User Input';
                    ToolTip = 'Enter your prompt for the AI model.';
                    MultiLine = true;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}