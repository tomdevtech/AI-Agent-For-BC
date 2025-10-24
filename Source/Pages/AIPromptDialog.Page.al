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
        area(Prompt)
        {
            field("AI Setup"; Rec."AI Setup")
            {
                ApplicationArea = All;
                Caption = 'AI Setup';
                ToolTip = 'Select the AI setup to use for this prompt.';
                TableRelation = "AI Setup".Code;
            }
            field("User Input"; Rec."Prompt")
            {
                ApplicationArea = All;
                Caption = 'User Input';
                ToolTip = 'Enter your prompt for the AI model.';
                MultiLine = true;
            }
        }
        area(Content)
        {
            field(Response; Rec."Prompt")
            {
                ApplicationArea = All;
                Caption = 'Response';
                ToolTip = 'Displays the response from the AI model.';
                MultiLine = true;
            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Generate';
                ToolTip = 'Generate content based on the provided prompt.';

                trigger OnAction()
                begin
                    GenerateReponse();
                end;
            }
            systemaction(OK)
            {
                Caption = 'Keep it';
                ToolTip = 'Saves the response proposed by API AI Agent.';
            }
            systemaction(Cancel)
            {
                Caption = 'Discard it';
                ToolTip = 'Discard the response proposed by API AI Agent.';
            }
            systemaction(Regenerate)
            {
                Caption = 'Regenerate';
                ToolTip = 'Regenerate the response proposed by API AI Agent.';
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

    local procedure GenerateReponse()
    var
        AIGenerator: Codeunit "AI Generator";
    begin
        Rec.Prompt := AIGenerator.GenerateResponse(Rec."AI Setup", Rec.Prompt);
        Rec.Modify();
    end;
}