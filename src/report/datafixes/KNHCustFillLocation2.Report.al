report 54410 "KNH Cust Fill Location 2"
{
    Caption = 'Customer Fill Location 2';
    UsageCategory = Tasks;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Customer Fill Location 2';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnAfterGetRecord()
            begin
                this.ReportCustomer.Get(Customer."No.");
                if this.ReportCustomer."Location Code" = ToLocationCode then
                    this.ReportCustomer."Location Code" := '';
                this.ReportCustomer.Modify();

            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("Location Code"; ToLocationCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Location Code';
                        Lookup = true; //Species if a page field has a lookup
                        TableRelation = Location;
                        ToolTip = 'Specifies the value of the Location Code field.';
                    }
                }
            }
        }
    }

    var
        ReportCustomer: Record Customer;
        ToLocationCode: Code[10];
}