//60059 KNH 30/08/2023
pageextension 54400 "KNH General Ledger Setup" extends "General Ledger Setup"
{
    actions
    {
        addafter("Change Payment &Tolerance")
        {
            action(DataUpdates)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Data Updates';
                Image = Task;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Codeunit "KNH Data Updates";
                ToolTip = 'Run this program to update various different types of data.';
            }
        }
    }
}