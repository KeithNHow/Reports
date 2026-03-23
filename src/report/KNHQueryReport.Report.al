namespace KNHReports;
using Microsoft.Sales.Receivables;
using System.Utilities;

report 54405 "KNH Query Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelQueryReport;

    dataset
    {
        dataitem(CLE; Integer)
        {
            column(A1; CustLedgerEntriesQuery.Entry_No)
            { }
            column(B1; CustLedgerEntriesQuery.Transaction_No)
            { }
            column(C1; CustLedgerEntriesQuery.Customer_No)
            { }
            column(D1; CustLedgerEntriesQuery.Posting_Date)
            { }

            trigger OnPreDataItem()
            begin
                this.CustLedgerEntriesQuery.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not this.CustledgerEntriesQuery.Read() then
                    CurrReport.Break();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        AboutTitle = 'Awesome report';
        AboutText = 'This is an awesome report. Use it to be awesome';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }

    rendering
    {
        layout(ExcelQueryReport)
        {
            Type = Excel;
            LayoutFile = './src/report/xlsx/QueryReport.xlsx';
        }
    }

    var
        CustledgerEntriesQuery: Query "Cust. Ledger Entries";
}