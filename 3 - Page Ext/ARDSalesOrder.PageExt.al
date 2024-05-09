namespace AardvarkLabs;
using Microsoft.Sales.Document;

pageextension 50001 ARDSalesOrder extends "Sales Order"
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
