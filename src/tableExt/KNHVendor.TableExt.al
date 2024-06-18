namespace Reports.Reports;

using Microsoft.Purchases.Vendor;

tableextension 53801 KNHVendor extends Vendor
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
