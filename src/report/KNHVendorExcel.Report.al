report 53803 KNHVendorExcel
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Excel;
    ExcelLayoutMultipleDataSheets = true;
    MaximumDatasetSize = 1000000;

    dataset
    {
        dataitem(DataItemName; Vendor)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", Name;

            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            dataitem(VendLedgEntry; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = field("No.");
                DataItemTableView = sorting("Entry No.") order(descending);
                RequestFilterFields = "Vendor No.", "Document Type", "Date Filter";

                column(Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(Document_Type; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(Document_Date; "Document Date")
                {
                    IncludeCaption = true;
                }
            }
            dataitem(Dimension1; "Dimension Value")
            {
                DataItemLink = Code = field("Global Dimension 1 Code");

                column(Dimension_Code; "Dimension Code")
                {
                    IncludeCaption = true;
                }
                column("Code"; Code)
                {
                    IncludeCaption = true;
                }
                column(Name; Name)
                {
                    IncludeCaption = true;
                }
            }
            dataitem(Dimension2; "Dimension Value")
            {
                DataItemLink = Code = field("Global Dimension 2 Code");

                column(DimensionCode; "Dimension Code")
                {
                    IncludeCaption = true;
                }
                column(CodeValue; Code)
                {
                    IncludeCaption = true;
                }
                column(CodeName; Name)
                {
                    IncludeCaption = true;
                }
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Vendor Report';
        AboutText = 'Purpose of this report to export details about vendors for analysis.';
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Option 1';
                    RunObject = page "Vendor List";
                }
            }
        }
    }

    rendering
    {
        layout(Excel)
        {
            Type = Excel;
            LayoutFile = './src/report/xlsx/KNHVendorExcel.xlsx';
            Caption = 'Vendor';
            Summary = 'Built in Layout for Vendors';
        }
    }

    labels
    {
        DataRetrieved = 'Data Retrieved';
    }
}
