/// <summary>
/// Report Excel (ID 50302).
/// </summary>
report 53800 "KNHCustomerExcel"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Customer Excel';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "KNHCustomerExcel.xlsx";
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Cust_Name; Name)
            {
                IncludeCaption = true;
            }
            column(Cust_Address; Address)
            {
                IncludeCaption = true;
            }
            column(Cust_City; City)
            {
                IncludeCaption = true;
            }
            column(Cust_PostCode; "Post Code")
            {
                IncludeCaption = true;
            }
            column(Cust_PhoneNo; "Phone No.")
            {
                IncludeCaption = true;
            }
            column(Cust_SalespersonCode; "Salesperson Code")
            {
                IncludeCaption = true;
            }
            column(Cust_Balance; Balance)
            {
                IncludeCaption = true;
            }
            column(Cust_CurrencyCode; "Currency Code")
            {
                IncludeCaption = true;
            }
            column(Cust_LanguageCode; "Language Code")
            {
                IncludeCaption = true;
            }

            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                column(CLE_PostingDate; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(CLE_DocumentDate; "Document Date")
                {
                    IncludeCaption = true;
                }
                column(CLE_DocumentType; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                    IncludeCaption = true;
                }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
    rendering
    {
        layout("KNHCustomerExcel.xlsx")
        {
            Type = Excel;
            LayoutFile = './src/report/xlsx/KNHCustomerExcel.xlsx';
            Caption = 'Standard Customer Layout (Excel)';
            Summary = 'The Standard Customer Layout (Excel) provides a detailed layout.';
        }
    }
}
