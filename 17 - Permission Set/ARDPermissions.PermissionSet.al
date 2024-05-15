namespace AardvarkLabs;
permissionset 50000 ARD_Permissions
{
    Assignable = true;
    Caption = 'AardvarkLabs Permissions', MaxLength = 30;
    Permissions = table ARD_Warranty=X,
        tabledata ARD_Warranty=RMID,
        page ARD_WarrantyCard=X,
        page ARD_WarrantyList=X;
}