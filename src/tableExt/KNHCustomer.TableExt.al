//This file contains the table extension.

tableextension 54400 "KNHCustomer" extends Customer
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
