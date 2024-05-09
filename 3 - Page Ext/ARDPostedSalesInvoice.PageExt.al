namespace AardvarkLabs;
using Microsoft.Sales.History;

pageextension 50003 ARDPostedSalesInvoice extends "Posted Sales Invoice"
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
