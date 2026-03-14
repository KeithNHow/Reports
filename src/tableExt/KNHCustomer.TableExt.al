//<summary>
/// This table extension adds a custom field to the Customer table. The field is used by the CustomerExcel report.
//</summary>
tableextension 54400 KNHCustomer extends Customer
{
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(53800; "KNH MyField"; Integer)
        {
            Caption = 'MyField';
            DataClassification = ToBeClassified;
        }
    }
}
