///<summary>
/// The KNHCustomerExcel report is designed to provide a detailed layout of customer information in Excel format. It includes various customer details such as name, address, city, phone number, and financial information. The report also includes related customer ledger entries, allowing for a comprehensive view of customer transactions. This report is ideal for users who need to analyze customer data in Excel or share it with stakeholders who prefer Excel format.
///</summary>

namespace KNHReports;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

report 54400 KNHCustomerExcel
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
            column(Cust_MyField; "KNH MyField")
            {
                IncludeCaption = true;
            }

            dataitem(CustLedgerEntry; "Cust. Ledger Entry")
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
