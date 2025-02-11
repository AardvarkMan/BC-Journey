namespace AardvarkLabs.BCJourney;

using Microsoft.HumanResources.Employee;

pageextension 50005 ARD_Employee extends "Employee Card"
{
    layout
    {
        addafter(General)
        {
            group(ARD_Image)
            {
                usercontrol(Ard_WebCam; Ard_WebCamControl)
                {
                    ApplicationArea = All;
                    trigger OnControlAddInReady()
                    begin
                        CurrPage.Ard_WebCam.InitializeControl('');
                    end;
                }
            }
        }
    }
}
