/*
    Customized in BC AL Journey #13
*/
namespace AardvarkLabs;
using Microsoft.Sales.Customer;
table 50001 ARDWarrantyClaim
{
    Caption = 'WarrantyClaim';
    DataClassification = CustomerContent;
    DataCaptionFields = "WarrantyClaimNo.", "CustomerNo.";
    
    fields
    {
        field(1; "WarrantyClaimNo."; Integer)
        {
            Caption = 'Warranty Claim No.';
            ToolTip = 'Warranty Claim Number';
            AutoIncrement = true;
        }
        field(2; "CustomerNo."; Code[20])
        {
            Caption = 'Customer No.';
            ToolTip = 'Associated Customer Number';
            /*
                Customized in BC AL Journey #20
            */
            trigger OnLookup()
            var
                Customer: Record Customer;
                CustomerLookup: Page "Customer Lookup";
            begin
                //Set the filter to only show customers that are not blocked
                Customer.SetFilter(Blocked, '%1', Enum::"Customer Blocked"::" ");

                //Open the Customer Lookup page and set the filter to the selected customer
                if Page.RunModal(page::"Customer Lookup", Customer) <> Action::LookupOK then exit;
                
                //Find the selected customer
                CustomerLookup.SetSelectionFilter(Customer);
                Customer.FindFirst();
                //Set the CustomerNo. field to the selected customer
                Rec."CustomerNo." := Customer."No.";
            end;
        }
        field(3; Details; Text[255])
        {
            Caption = 'Details';
            ToolTip = 'Warranty claim details';
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            ToolTip = 'Warranty Claim Date';
        }
        field(5; Resolved; Boolean)
        {
            Caption = 'Resolved';
            ToolTip = 'Indicate if the Claim has been resolved';
            trigger OnValidate()
            begin
                if Rec.Resolved then
                    Rec.ResolvedDate := CurrentDateTime;
            end;
        }
        field(6; ResolvedDate; DateTime)
        {
            Caption = 'Resolved Date';
            ToolTip = 'Date the claim was resolved';
        }
    }
    keys
    {
        key(PK; "WarrantyClaimNo.","CustomerNo.")
        {
            Clustered = true;
        }
    }

    /*
        Customized in BC AL Journey #19
    */
    trigger OnInsert()
    begin
        Rec.Date := DT2Date(CurrentDateTime);
    end;

    trigger OnModify()
    begin
        if Rec.Date = 0D then
            Rec.Date := DT2Date(CurrentDateTime);
    end;

    trigger OnDelete()
    begin
        if Rec.Resolved then
            error('Cannot delete a resolved warranty claim');
    end;

    trigger OnRename()
    begin
        error('Cannot rename a warranty claim');
    end;
}
