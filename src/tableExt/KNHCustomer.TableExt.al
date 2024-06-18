/// <summary>
/// TableExtension KNH Customer (ID 53800) extends Record Customer.
/// </summary>
tableextension 53800 "KNHCustomer" extends Customer
{
    fields
    {
        field(53800; "KNH MyField"; Integer)
        {
            Caption = 'MyField';
            DataClassification = ToBeClassified;
        }
    }
}
