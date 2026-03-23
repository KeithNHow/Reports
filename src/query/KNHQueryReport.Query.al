namespace KNHReport;
using Microsoft.Sales.Receivables;

query 54400 "KNH Query Report"
{
    QueryType = Normal;

    elements
    {
        dataitem(CLE; "Cust. Ledger Entry")
        {
            column(Entry_No; "Entry No.")
            {

            }
            column(Transaction_No; "Transaction No.")
            {

            }
            column(Customer_No; "Customer No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}