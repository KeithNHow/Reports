namespace KeithHow.Reports;

using Microsoft.Sales.Customer;

pageextension 53800 KNHCustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}