namespace AardvarkLabs;
using Microsoft.Sales.History;

tableextension 50002 ARDSalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {
        field(50000; ARD_WarrantyExpDate; Date)
        {
            Caption = 'Warranty Exp Date';
            ToolTip = 'Warranty Expiration Date';
            DataClassification = CustomerContent;
        }
    }
}
