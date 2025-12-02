// This file contains the code for the page extension.

namespace KeithHow.Reports;

using Microsoft.Sales.Customer;

pageextension 54400 KNHCustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}