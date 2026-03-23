///<summary>
/// The KNHCustomerSalesList report extension enhances the existing "Customer - Top 10 List" report by adding additional fields and functionality. It introduces new columns for the customer's GLN and a custom field called "KNH MyField". Additionally, it calculates the net weight of sales for each customer, with an option to display the weight in pounds. This extension allows users to gain deeper insights into their top customers by providing more detailed information and customizable options on the request page.
///</summary>
namespace KNHReports;
using Microsoft.Sales.Reports;

reportextension 54400 KNHCustomerSalesList extends "Customer - Top 10 List"
{
    dataset
    {
        add(Integer)
        {
            column(KNHCustomer_GLN; Customer.GLN)
            {
            }
            column(KNHCustomer_MyField; Customer."KNH MyField")
            {
            }
        }

        add(Customer)
        {
            column(KNHnetWeight; netWeight)
            {
            }
        }

        modify(Customer)
        {
            trigger OnBeforeAfterGetRecord()
            begin
                if weightInPounds then
                    netWeight := netWeight * 2.2
                else
                    netWeight := netWeight;
            end;
        }
    }

    requestpage
    {
        layout
        {
            addafter(Show)
            {
                field(KNHCustomer_MyField; Customer."KNH MyField")
                {
                    ToolTip = 'Specifies the value of the KNH MyField field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        netWeight: Decimal;
        WeightInPounds: Boolean;
}
