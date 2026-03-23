namespace KNHReports;
using Microsoft.Purchases.Vendor;

report 54408 "KNH Vendor Lead Time"
{
    Caption = 'Update Vendor Lead Time';
    UsageCategory = Tasks;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Update Vendor Lead Time';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            trigger OnAfterGetRecord()
            begin
                this.ReportVendor.Get(Vendor."No.");
                this.ReportVendor.Validate("Lead Time Calculation", this.ToLeadTimeCalculation);
                this.ReportVendor.Modify();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(LeadTimeCalculation; ToLeadTimeCalculation)
                    {
                        ApplicationArea = All;
                        Caption = 'Lead Time Calculation';
                        ToolTip = 'Specifies the value of the Lead Time Calculation field.';
                    }
                }
            }
        }
    }

    var
        ReportVendor: Record Vendor;
        ToLeadTimeCalculation: DateFormula;
}