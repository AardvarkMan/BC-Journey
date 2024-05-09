namespace AardvarkLabs;
using Microsoft.Sales.Document;

pageextension 50002 ARDSalesQuote extends "Sales Quote"
{
    layout
    {
        addafter("Document Date")
        {
            field(ARD_WarrantyExpDate; Rec.ARD_WarrantyExpDate)
            {
                ApplicationArea = All;
            }
        }
    }
}
