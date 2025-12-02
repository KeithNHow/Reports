//This file contains the table extension.

namespace Reports.Reports;

using Microsoft.Purchases.Vendor;

tableextension 54401 KNHVendor extends Vendor
{
    fields
    {
        field(53800; "KNHName 3"; Text[100])
        {
            Caption = 'Name 3';
            DataClassification = CustomerContent;
        }
    }
}
