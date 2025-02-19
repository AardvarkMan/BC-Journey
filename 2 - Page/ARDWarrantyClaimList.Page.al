namespace AardvarkLabs.BCJourney;

using AardvarkLabs;

page 50004 ARDWarrantyClaimList
{
    ApplicationArea = All;
    Caption = 'Warranty Claim List';
    PageType = List;
    SourceTable = ARDWarrantyClaim;
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("WarrantyClaimNo."; Rec."WarrantyClaimNo.")
                {
                }
                field("CustomerNo."; Rec."CustomerNo.")
                {
                }
                field(Details; Rec.Details)
                {
                }
                field("Date"; Rec."Date")
                {
                }
                field(Resolved; Rec.Resolved)
                {
                }
                field(ResolvedDate; Rec.ResolvedDate)
                {
                }
            }
        }
    }
}
