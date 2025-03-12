namespace AardvarkLabs.BCJourney;
using Microsoft.Sales.Customer;

page 50005 ARD_TriggerHappy
{
    ApplicationArea = All;
    Caption = 'Trigger Happy';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Territory Code"; Rec."Territory Code")
                {
                    Visible = ShowTerritoryCode;
                }
                field(ARD_CustomerLookup; CustomerLookup)
                {
                    Caption = 'Customer Lookup';
                    ToolTip = 'Lookup Customer';
                    ApplicationArea = All;
                    Lookup = true;


                    trigger onlookup(var Text: Text): Boolean
                    var
                        CustomerRec: Record Customer;
                    begin
                        Message('Card Field: onlookup: Rec: %1, Text: %2', Rec."No.", Text);
                        if Page.RunModal(Page::Ard_TriggerHappyQuery, CustomerRec) = Action::LookupOK then begin
                            CustomerLookup := CustomerRec.Name;
                        end;
                    end;
                }
            }
        }
    }

    var
        Settings: Record ARD_Settings;
        CustomerLookup: Text[50];
        ShowTerritoryCode: Boolean;

    trigger OnInit()
    begin
        Message('Card: OnInit: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
        if Settings.Get() = false then begin
            Settings.Init();
            Settings."ARD_No." := '';
            Settings.ARD_ShowTerritory := true;
            Settings.Insert();
        end;
    end;

    trigger OnOpenPage()
    begin
        Message('Card: OnOpenPage: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
        ShowTerritoryCode := Settings.ARD_ShowTerritory;
    end;

    trigger OnAfterGetRecord()
    begin
        Message('Card: OnAfterGetRecord: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Message('Card: OnAfterGetCurrRecord: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Message('Card: OnNewRecord: Rec: %1, XRec: %2, BelowxRec: %3', Rec."No.", XRec."No.", BelowxRec);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Message('Card: OnInsertRecord: Rec: %1, XRec: %2, BelowxRec: %3', Rec."No.", XRec."No.", BelowxRec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Message('Card: OnModifyRecord: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        Message('Card: OnDeleteRecord: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
    end;

    trigger OnClosePage()
    begin
        Message('Card: OnClosePage: Rec: %1, XRec: %2', Rec."No.", XRec."No.");
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        Message('Card: OnNextRecord: Steps: %1', Steps);
        exit(Steps);
    end;

    /*     trigger OnFindRecord(Which: Text): Boolean
        begin
            Message('Card: OnFindRecord: Which: %1, Rec: %2, XRec: %3', Which, Rec."No.", XRec."No.");
        end; */

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        Message('Card: OnPageBackgroundTaskCompleted: TaskId: %1, Results: %2', TaskId, Results);
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin
        Message('Card: OnPageBackgroundTaskError: TaskId: %1, ErrorCode: %2, ErrorText: %3, ErrorCallStack: %4', TaskId, ErrorCode, ErrorText, ErrorCallStack);
    end;
}
