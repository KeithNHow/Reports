// This file contains the report definition.

report 53801 "KNHItemLedgerEntryAnalysis"
{
    ApplicationArea = All;
    Caption = 'Item Ledger Entry Analysis';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "KNHItemLedgerEntryAnalysis.rdlc";
    UseRequestPage = true;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(EntryType; "Entry Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(IncludeLogo; gvIncludeLogo)
            {
            }
            column(CompanyInfo_Picture; CompanyInformation.Picture)
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(IncludeLogo; gvIncludeLogo)
                    {
                        Caption = 'Include Company Logo';
                        ApplicationArea = All;
                        ToolTip = 'IncludeLogo';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    rendering
    {
        layout("KNHItemLedgerEntryAnalysis.rdlc")
        {
            Type = RDLC;
            LayoutFile = './src/report/rdlc/KNHItemLedgerEntryAnalysis.rdlc';
            Caption = 'Item Ledger Entry Analysis';
        }
    }
    labels
    {
        PageNo = 'Page';
        BCReportName = 'Item Ledger Entry Analysis';
    }

    trigger OnPreReport()
    begin
        if gvincludeLogo then begin
            CompanyInformation.Get();  //Get Company Information record           
            CompanyInformation.CalcFields(Picture);  //Retrieve company logo
        end;
    end;

    var
        CompanyInformation: Record "Company Information";
        gvIncludeLogo: Boolean;
}
