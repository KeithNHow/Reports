report 53803 KNHVendorExcel
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = VendorExcelLayout;
    ExcelLayoutMultipleDataSheets = true;
    MaximumDatasetSize = 1000000;
    Caption = 'Vendor Excel';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", Name;
            column(Vend_No; "No.")
            {
                IncludeCaption = true;
            }
            column(Vend_Name; Name)
            {
                IncludeCaption = true;
            }
        }
        dataitem(VendLedgEntry; "Vendor Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") order(descending);
            RequestFilterFields = "Vendor No.", "Document Type", "Date Filter";
            column(VLE_DocNo_; "Document No.")
            {
                IncludeCaption = true;
            }
            column(VLE_DocType; "Document Type")
            {
                IncludeCaption = true;
            }
            column(VLE_No; "Vendor No.")
            {
                IncludeCaption = true;
            }
            column(VLE_Desc; Description)
            {
                IncludeCaption = true;
            }
            column(VLE_Amount; Amount)
            {
                IncludeCaption = true;
            }
            column(VLE_PostDate; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(VLE_DocDate; "Document Date")
            {
                IncludeCaption = true;
            }
            column(VLE_Dept; "Global Dimension 1 Code")
            {
                IncludeCaption = true;
            }
            column(VLE_CustGroup; "Global Dimension 2 Code")
            {
                IncludeCaption = true;
            }
        }
        dataitem(Dimension; "Dimension")
        {
            column(Dim_Code; Code)
            {
                IncludeCaption = true;
            }
            column(Dim_Name; Name)
            {
                IncludeCaption = true;
            }
        }
        dataitem(DimensionValue; "Dimension Value")
        {
            column(DV_DimCode; "Dimension Code")
            {
                IncludeCaption = true;
            }
            column(DV_Code; Code)
            {
                IncludeCaption = true;
            }
            column(DV_Name; Name)
            {
                IncludeCaption = true;
            }
        }
    }

    requestpage
    {
        SaveValues = true;
        AboutTitle = 'Vendor Report';
        AboutText = 'Purpose of this report to export details about vendors for analysis.';

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
        layout(VendorExcelLayout)
        {
            Type = Excel;
            LayoutFile = './src/report/xlsx/KNHVendorExcel.xlsx';
            Caption = 'Vendor Excel';
            Summary = 'Built in Layout for Vendors';
        }
    }

    labels
    {
        DataRetrieved = 'Data Retrieved';
    }
}
