namespace KNHReports;
using Microsoft.Sales.Customer;
using Microsoft.Foundation.Comment;

report 54407 "KNH Customer Comment"
{
    ApplicationArea = Basic, Suite;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Customer Comment';
    DefaultRenderingLayout = ExcelLayout;
    //ExcelLayoutMultipleDataSheets = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Balance (LCY)", "Customer Posting Group";
            DataItemTableView = sorting("No.");
            column(Customer_Number; "No.")
            {
                IncludeCaption = true;
            }
            column(Customer_Name; Name)
            {
                IncludeCaption = true;
            }
            column(Customer_Balance; Balance)
            {
                IncludeCaption = true;
            }
            dataitem(CustomerComment; "Comment Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "No." = field("No.");
                DataItemTableView = where("Table Name" = filter(Customer));
                RequestFilterFields = Date;

                column(Comment_Date; Date)
                {
                    IncludeCaption = true;
                }
                column(Comment; Comment)
                {
                    IncludeCaption = true;
                }
            }
        }
    }

    requestpage
    {
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
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = '.\src\report\xlsx\KNHCustomerComment.xlsx';
        }
    }
}
