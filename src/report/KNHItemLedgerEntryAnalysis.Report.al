///<summary>
/// This report is designed to analyze item ledger entries, providing insights into inventory movements, posting dates, document numbers, and other relevant details. The report includes options to filter and customize the data displayed, making it a valuable tool for inventory management and analysis. Users can choose to include the company logo in the report, enhancing its presentation for sharing with stakeholders.
///</summary>

report 54401 KNHItemLedgerEntryAnalysis
{
    ApplicationArea = All;
    Caption = 'Item Ledger Entry Analysis';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "KNHItemLedgerEntryAnalysis.rdlc";
    UseRequestPage = true;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(EntryType; "Entry Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(IncludeLogo; gvIncludeLogo)
            {
            }
            column(CompanyInfo_Picture; this.CompanyInformation.Picture)
            {
            }
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
                    field(IncludeLogo; gvIncludeLogo)
                    {
                        Caption = 'Include Company Logo';
                        ApplicationArea = All;
                        ToolTip = 'IncludeLogo';
                    }
                }
            }
        }
    }
    rendering
    {
        layout("KNHItemLedgerEntryAnalysis.rdlc")
        {
            Type = RDLC;
            LayoutFile = './src/report/rdlc/KNHItemLedgerEntryAnalysis.rdlc';
            Caption = 'Item Ledger Entry Analysis';
        }
    }
    labels
    {
        PageNo = 'Page';
        BCReportName = 'Item Ledger Entry Analysis';
    }

    trigger OnPreReport()
    begin
        if gvIncludeLogo then begin
            this.CompanyInformation.Get();
            this.CompanyInformation.CalcFields(Picture);
        end;
    end;

    var
        CompanyInformation: Record "Company Information";
        gvIncludeLogo: Boolean;
}
