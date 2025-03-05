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
            }
        }
    }

    var
        Settings: Record ARD_Settings;
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

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        Message('Card: OnNextRecord: Steps: %1', Steps);
        exit(Steps);
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
}
