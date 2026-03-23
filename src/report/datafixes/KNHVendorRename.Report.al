namespace KNHReports;
using Microsoft.Purchases.Vendor;

report 54409 "KNH Vendor Rename"
{
    Caption = 'Rename Vendors';
    UsageCategory = Tasks;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Rename Vendors';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            trigger OnAfterGetRecord()
            begin
                this.ReportVendor.Get(Vendor."No.");
                Evaluate(this.ReportVendorNo, this.ReportVendor."No.");
                this.ReportVendorNo2 := CopyStr(Text.InsStr(this.ReportVendorNo, 'V', 1), 1, 20);
                this.ReportVendor.Rename(this.ReportVendorNo2);
                this.Counter += 1;
            end;
        }
    }
    trigger OnInitReport()
    begin
        Clear(this.Counter);
    end;

    trigger OnPostReport()
    begin
        Message(this.CountMsg, this.counter);
    end;

    var
        ReportVendor: Record Vendor;
        ReportVendorNo: Text[20];
        ReportVendorNo2: Code[20];
        Counter: Integer;
        CountMsg: Label 'Records Processed %1', Comment = '%1 = Record Counter';
}