///<summary>
/// This table extension adds a custom field to the Vendor table. The field is used in the VendorExcel report.
///</summary>

namespace Reports.Reports;
using Microsoft.Purchases.Vendor;

tableextension 54401 KNHVendor extends Vendor
{
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(53800; "KNHName 3"; Text[100])
        {
            Caption = 'Name 3';
            DataClassification = CustomerContent;
        }
    }
}
