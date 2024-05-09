namespace AardvarkLabs;
using Microsoft.Sales.Document;

tableextension 50001 ARDSalesHeader extends "Sales Header"
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
