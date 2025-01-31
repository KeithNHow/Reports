namespace KNH.Reports;
using Microsoft.Sales.History;

using Microsoft.Assembly.History;
using Microsoft.Bank.BankAccount;
using Microsoft.CRM.Interaction;
using Microsoft.CRM.Segment;
using Microsoft.CRM.Team;
using Microsoft.Finance.Dimension;
using Microsoft.Foundation.Address;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.UOM;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Inventory.Reports;
using Microsoft.Inventory.Tracking;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Setup;
using Microsoft.Utilities;
using System.Email;
using System.Globalization;
using System.Utilities;

report 53802 "KNHSalesShipment"
{
    Caption = 'Sales - Shipment';
    PreviewMode = PrintLayout;
    DefaultRenderingLayout = "KNHSalesShipment.rdlc";
    WordMergeDataItem = "Sales Shipment Header";

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Shipment';
            column(No_SalesShptHeader; "No.")
            {
            }
            column(DocumentDateCaption; this.DocumentDateCaptionLbl)
            {
            }
            column(PageCaption; this.PageCaptionCap)
            {
            }
            column(HomePageCaption; this.HomePageCaptionLbl)
            {
            }
            column(EmailCaption; this.EmailCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(CompanyInfo2Picture; this.CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; this.CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; this.CompanyInfo3.Picture)
                    {
                    }
                    column(SalesShptCopyText; StrSubstNo(this.Text002, this.CopyText))
                    {
                    }
                    column(ShipToAddr1; this.ShipToAddr[1])
                    {
                    }
                    column(CompanyAddr1; this.CompanyAddr[1])
                    {
                    }
                    column(ShipToAddr2; this.ShipToAddr[2])
                    {
                    }
                    column(CompanyAddr2; this.CompanyAddr[2])
                    {
                    }
                    column(ShipToAddr3; this.ShipToAddr[3])
                    {
                    }
                    column(CompanyAddr3; this.CompanyAddr[3])
                    {
                    }
                    column(ShipToAddr4; this.ShipToAddr[4])
                    {
                    }
                    column(CompanyAddr4; this.CompanyAddr[4])
                    {
                    }
                    column(ShipToAddr5; this.ShipToAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; this.CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; this.ShipToAddr[6])
                    {
                    }
                    column(CompanyInfoVATRegistrationNo; this.CompanyInfo."VAT Registration No.")
                    {
                    }
#pragma warning disable AL0432
                    column(CompanyInfoHomePage; this.CompanyInfo."Home Page")
                    {
                    }
#pragma warning restore AL0432
                    column(CompanyInfoEmail; this.CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoBankName; this.CompanyBankAccount.Name)
                    {
                    }
                    column(CompanyInfoBankAccountNo; this.CompanyBankAccount."Bank Account No.")
                    {
                    }
                    column(SelltoCustNo_SalesShptHeader; "Sales Shipment Header"."Sell-to Customer No.")
                    {
                    }
                    column(ShptHeaderDocDate; Format("Sales Shipment Header"."Document Date"))
                    {
                    }
                    column(SalesPersonText; this.SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; this.SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; this.ReferenceText)
                    {
                    }
                    column(YourReference_SalesShptHeader; "Sales Shipment Header"."Your Reference")
                    {
                    }
                    column(ShipToAddr7; this.ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; this.ShipToAddr[8])
                    {
                    }
                    column(CompanyAddr5; this.CompanyAddr[5])
                    {
                    }
                    column(CompanyInfoBankBranchNo; this.CompanyInfo."Bank Branch No.")
                    {
                    }
                    column(CompanyAddr6; this.CompanyAddr[6])
                    {
                    }
                    column(CompanyAddr7; this.CompanyAddr[7])
                    {
                    }
                    column(CompanyAddr8; this.CompanyAddr[8])
                    {
                    }
                    column(ShipmentDate_SalesShptHeader; Format("Sales Shipment Header"."Shipment Date"))
                    {
                    }
                    column(OutputNo; this.OutputNo)
                    {
                    }
                    column(ItemTrackingAppendixCaption; this.ItemTrackingAppendixCaptionLbl)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; this.CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegistrationNoCaption; this.CompanyInfoVATRegistrationNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCaption; this.CompanyInfoBankNameCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankAccountNoCaption; this.CompanyInfoBankAccountNoCaptionLbl)
                    {
                    }
                    column(SalesShipmentHeaderNoCaption; this.SalesShipmentHeaderNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankBranchNoCaption; this.CompanyInfoBankBranchNoCaptionLbl)
                    {
                    }
                    column(SalesShipmentHeaderShipmentDateCaption; this.SalesShipmentHeaderShipmentDateCaptionLbl)
                    {
                    }
                    column(SelltoCustNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Customer No."))
                    {
                    }
                    column(OrderNoCaption_SalesShptHeader; this.OurDocumentNoLbl)
                    {
                    }
                    column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.")
                    {
                    }
                    column(ExternalDocumentNoCaption_SalesShptHeader; this.PurchaseOrderNoLbl)
                    {
                    }
                    column(ExternalDocumentNo_SalesShptHeader; "Sales Shipment Header"."External Document No.")
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Shipment Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(DimText; this.DimText)
                        {
                        }
                        column(HeaderDimensionsCaption; this.HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not this.DimSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not this.Continue then
                                    CurrReport.Break();

                            Clear(this.DimText);
                            this.Continue := false;
                            repeat
                                this.OldDimText := CopyStr(this.DimText, 1, 75);
                                if this.DimText = '' then
                                    this.DimText := StrSubstNo('%1 - %2', this.DimSetEntry1."Dimension Code", this.DimSetEntry1."Dimension Value Code")
                                else
                                    this.DimText :=
                                      CopyStr(StrSubstNo(
                                        '%1; %2 - %3', this.DimText,
                                        this.DimSetEntry1."Dimension Code", this.DimSetEntry1."Dimension Value Code"), 1, 75);
                                if StrLen(this.DimText) > MaxStrLen(this.OldDimText) then begin
                                    this.DimText := this.OldDimText;
                                    this.Continue := true;
                                    exit;
                                end;
                            until this.DimSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not this.gvShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Shipment Line"; "Sales Shipment Line")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Sales Shipment Header";
                        DataItemTableView = sorting("Document No.", "Line No.");
                        column(Description_SalesShptLine; Description)
                        {
                        }
                        column(ShowInternalInfo; this.gvShowInternalInfo)
                        {
                        }
                        column(ShowCorrectionLines; this.ShowCorrectionLines)
                        {
                        }
                        column(Type_SalesShptLine; Format(Type, 0, 2))
                        {
                        }
                        column(LinNo; this.LinNo)
                        {
                        }
                        column(DocumentNo_SalesShptLine; "Document No.")
                        {
                        }
                        column(AsmHeaderExists; this.AsmHeaderExists)
                        {
                        }
                        column(ItemReferenceNo_Line; "Item Reference No.")
                        {
                        }
                        column(ItemReferenceNo_Line_Lbl; FieldCaption("Item Reference No."))
                        {
                        }
                        column(Qty_SalesShptLine; Quantity)
                        {
                        }
                        column(UnitofMeasure_SalesShptLine; "Unit of Measure")
                        {
                        }
                        column(No_SalesShptLine; "No.")
                        {
                        }
                        column(LineNo_SalesShptLine; "Line No.")
                        {
                        }
                        column(Description_SalesShptLineCaption; FieldCaption(Description))
                        {
                        }
                        column(Quantity_SalesShptLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UnitofMeasure_SalesShptLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(No_SalesShptLineCaption; FieldCaption("No."))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(DimText1; this.DimText)
                            {
                            }
                            column(LineDimensionsCaption; this.LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not this.DimSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not this.Continue then
                                        CurrReport.Break();

                                Clear(this.DimText);
                                this.Continue := false;
                                repeat
                                    this.OldDimText := CopyStr(this.DimText, 1, 75);
                                    if this.DimText = '' then
                                        this.DimText := StrSubstNo('%1 - %2', this.DimSetEntry2."Dimension Code", this.DimSetEntry2."Dimension Value Code")
                                    else
                                        this.DimText :=
                                          CopyStr(StrSubstNo(
                                            '%1; %2 - %3', this.DimText,
                                            this.DimSetEntry2."Dimension Code", this.DimSetEntry2."Dimension Value Code"), 1, 75);
                                    if StrLen(this.DimText) > MaxStrLen(this.OldDimText) then begin
                                        this.DimText := this.OldDimText;
                                        this.Continue := true;
                                        exit;
                                    end;
                                until this.DimSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not this.gvShowInternalInfo then
                                    CurrReport.Break();
                            end;
                        }
                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = sorting(Number);
                            column(PostedAsmLineItemNo; this.BlanksForIndent() + this.PostedAsmLine."No.")
                            {
                            }
                            column(PostedAsmLineDescription; this.BlanksForIndent() + this.PostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineQuantity; this.PostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineUOMCode; this.GetUnitOfMeasureDescr(this.PostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            var
                                ItemTranslation: Record "Item Translation";
                            begin
                                if Number = 1 then
                                    this.PostedAsmLine.FindSet()
                                else
                                    this.PostedAsmLine.Next();

                                if ItemTranslation.Get(this.PostedAsmLine."No.",
                                     this.PostedAsmLine."Variant Code",
                                     "Sales Shipment Header"."Language Code")
                                then
                                    this.PostedAsmLine.Description := ItemTranslation.Description;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not this.DisplayAssemblyInformation then
                                    CurrReport.Break();
                                if not this.AsmHeaderExists then
                                    CurrReport.Break();

                                this.PostedAsmLine.SetRange("Document No.", this.PostedAsmHeader."No.");
                                SetRange(Number, 1, this.PostedAsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            this.LinNo := "Line No.";
                            if not this.ShowCorrectionLines and Correction then
                                CurrReport.Skip();

                            this.DimSetEntry2.SetRange("Dimension Set ID", "Dimension Set ID");
                            if this.DisplayAssemblyInformation then
                                this.AsmHeaderExists := AsmToShipmentExists(this.PostedAsmHeader);
                        end;

                        trigger OnPostDataItem()
                        begin
                            if this.gvShowLotSN then begin
                                this.ItemTrackingDocMgt.SetRetrieveAsmItemTracking(true);
                                this.TrackingSpecCount :=
                                  this.ItemTrackingDocMgt.RetrieveDocumentItemTracking(
                                      this.TempTrackingSpecBuffer, "Sales Shipment Header"."No.", DATABASE::"Sales Shipment Header", 0);
                                this.ItemTrackingDocMgt.SetRetrieveAsmItemTracking(false);
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            this.MoreLines := Find('+');
                            while this.MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) do
                                this.MoreLines := Next(-1) <> 0;
                            if not this.MoreLines then
                                CurrReport.Break();
                            SetRange("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                    }
                    dataitem("Integer"; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        dataitem(Total2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = const(1));
                            column(BilltoCustNo_SalesShipmentHdr; "Sales Shipment Header"."Bill-to Customer No.")
                            {
                            }
                            column(CustAddr1; this.CustAddr[1])
                            {
                            }
                            column(CustAddr2; this.CustAddr[2])
                            {
                            }
                            column(CustAddr3; this.CustAddr[3])
                            {
                            }
                            column(CustAddr4; this.CustAddr[4])
                            {
                            }
                            column(CustAddr5; this.CustAddr[5])
                            {
                            }
                            column(CustAddr6; this.CustAddr[6])
                            {
                            }
                            column(CustAddr7; this.CustAddr[7])
                            {
                            }
                            column(CustAddr8; this.CustAddr[8])
                            {
                            }
                            column(BilltoAddressCaption; this.BilltoAddressCaptionLbl)
                            {
                            }
                            column(BilltoCustNo_SalesShipmentHdrCaption; "Sales Shipment Header".FieldCaption("Bill-to Customer No."))
                            {
                            }
                        }

                        trigger OnPreDataItem()
                        begin
                            if not this.ShowCustAddr then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(ItemTrackingLine; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(TrackingSpecBufferItemNo; this.TempTrackingSpecBuffer."Item No.")
                        {
                        }
                        column(TrackingSpecBufferDescription; this.TempTrackingSpecBuffer.Description)
                        {
                        }
                        column(TrackingSpecBufferLotNo; this.TempTrackingSpecBuffer."Lot No.")
                        {
                        }
                        column(TrackingSpecBufferSerialNo; this.TempTrackingSpecBuffer."Serial No.")
                        {
                        }
                        column(TrackingSpecBufferQty; this.TempTrackingSpecBuffer."Quantity (Base)")
                        {
                        }
                        column(ShowTotal; this.ShowTotal)
                        {
                        }
                        column(ShowGroup; this.ShowGroup)
                        {
                        }
                        column(QuantityCaption; this.QuantityCaptionLbl)
                        {
                        }
                        column(SerialNoCaption; this.SerialNoCaptionLbl)
                        {
                        }
                        column(LotNoCaption; this.LotNoCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; this.DescriptionCaptionLbl)
                        {
                        }
                        column(NoCaption; this.NoCaptionLbl)
                        {
                        }
                        dataitem(TotalItemTracking; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = const(1));
                            column(TotalQuantity; this.TotalQty)
                            {
                            }
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                this.TempTrackingSpecBuffer.FindSet()
                            else
                                this.TempTrackingSpecBuffer.Next();

                            if not this.ShowCorrectionLines and this.TempTrackingSpecBuffer.Correction then
                                CurrReport.Skip();
                            if this.TempTrackingSpecBuffer.Correction then
                                this.TempTrackingSpecBuffer."Quantity (Base)" := -this.TempTrackingSpecBuffer."Quantity (Base)";

                            this.ShowTotal := false;
                            if this.ItemTrackingAppendix.IsStartNewGroup(this.TempTrackingSpecBuffer) then
                                this.ShowTotal := true;

                            this.ShowGroup := false;
                            if (this.TempTrackingSpecBuffer."Source Ref. No." <> this.OldRefNo) or
                               (this.TempTrackingSpecBuffer."Item No." <> this.OldNo)
                            then begin
                                this.OldRefNo := this.TempTrackingSpecBuffer."Source Ref. No.";
                                this.OldNo := this.TempTrackingSpecBuffer."Item No.";
                                this.TotalQty := 0;
                            end else
                                this.ShowGroup := true;
                            this.TotalQty += this.TempTrackingSpecBuffer."Quantity (Base)";
                        end;

                        trigger OnPreDataItem()
                        begin
                            if this.TrackingSpecCount = 0 then
                                CurrReport.Break();
                            SetRange(Number, 1, this.TrackingSpecCount);
                            this.TempTrackingSpecBuffer.SetCurrentKey(
                                "Source ID", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.");
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        // Item Tracking:
                        if this.gvShowLotSN then begin
                            this.TrackingSpecCount := 0;
                            this.OldRefNo := 0;
                            this.ShowGroup := false;
                        end;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        this.CopyText := this.FormatDocument.GetCOPYText();
                        this.OutputNo += 1;
                    end;
                    this.TotalQty := 0;           // Item Tracking
                end;

                trigger OnPostDataItem()
                begin
                    if not this.IsReportInPreviewMode() then
                        CODEUNIT.Run(CODEUNIT::"Sales Shpt.-Printed", "Sales Shipment Header");
                end;

                trigger OnPreDataItem()
                begin
                    this.NoOfLoops := 1 + Abs(this.gvNoOfCopies);
                    this.CopyText := '';
                    SetRange(Number, 1, this.NoOfLoops);
                    this.OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := this.LanguageMgt.GetLanguageIdOrDefault("Language Code");
                CurrReport.FormatRegion := this.LanguageMgt.GetFormatRegionOrDefault("Format Region");
                this.FormatAddr.SetLanguageCode("Language Code");

                this.FormatAddressFields("Sales Shipment Header");
                this.FormatDocumentFields("Sales Shipment Header");

                if not this.CompanyBankAccount.Get("Sales Shipment Header"."Company Bank Account Code") then
                    this.CompanyBankAccount.CopyBankFieldsFromCompanyInfo(this.CompanyInfo);

                this.DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
            end;

            trigger OnPostDataItem()
            begin
                this.OnAfterPostDataItem("Sales Shipment Header");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; gvNoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; gvShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if the document shows internal information.';
                    }
                    field(LogInteraction; gvLogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to log this interaction.';
                    }
                    field("Show Correction Lines"; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(ShowLotSN; gvShowLotSN)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Serial/Lot Number Appendix';
                        ToolTip = 'Specifies if you want to print an appendix to the sales shipment report showing the lot and serial numbers in the shipment.';
                    }
                    field(DisplayAsmInfo; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := gvLogInteraction;
        end;
    }

    rendering
    {
        layout("KNHSalesShipment.rdlc")
        {
            Type = RDLC;
            LayoutFile = './src/report/rdlc/KNHSalesShipment.rdl';
            Caption = 'Standard Sales Shipment (RDLC)';
            Summary = 'The Standard Sales Shipment (RDLC) provides a detailed layout.';
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        this.CompanyInfo.Get();
        this.SalesSetup.Get();
        this.FormatDocument.SetLogoPosition(this.SalesSetup."Logo Position on Documents", this.CompanyInfo1, this.CompanyInfo2, this.CompanyInfo3);

        this.OnAfterInitReport();
    end;

    trigger OnPostReport()
    begin
        if this.gvLogInteraction and not this.IsReportInPreviewMode() then
            if "Sales Shipment Header".FindSet() then
                repeat
                    this.SegManagement.LogDocument(
                      5, "Sales Shipment Header"."No.", 0, 0, DATABASE::Customer, "Sales Shipment Header"."Sell-to Customer No.",
                      "Sales Shipment Header"."Salesperson Code", "Sales Shipment Header"."Campaign No.",
                      "Sales Shipment Header"."Posting Description", '');
                until "Sales Shipment Header".Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            this.InitLogInteraction();
        this.AsmHeaderExists := false;

        this.OnAfterOnPreReport("Sales Shipment Header");
    end;

    var
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyBankAccount: Record "Bank Account";
        SalesSetup: Record "Sales & Receivables Setup";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        RespCenter: Record "Responsibility Center";
        ItemTrackingAppendix: Report "Item Tracking Appendix";
        LanguageMgt: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[20];
        ReferenceText: Text[80];
        MoreLines: Boolean;
        gvNoOfCopies: Integer;
        OutputNo: Integer;
        NoOfLoops: Integer;
        TrackingSpecCount: Integer;
        OldRefNo: Integer;
        OldNo: Code[20];
        CopyText: Text[30];
        ShowCustAddr: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        gvShowInternalInfo: Boolean;
        Continue: Boolean;
        gvLogInteraction: Boolean;
        ShowCorrectionLines: Boolean;
        gvShowLotSN: Boolean;
        ShowTotal: Boolean;
        ShowGroup: Boolean;
        TotalQty: Decimal;
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmHeaderExists: Boolean;
        LinNo: Integer;

#pragma warning disable AA0074
        Text002: Label 'Sales - Shipment %1', Comment = '%1 = Document No.';
#pragma warning restore AA0074
        ItemTrackingAppendixCaptionLbl: Label 'Item Tracking - Appendix';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegistrationNoCaptionLbl: Label 'VAT Registration No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccountNoCaptionLbl: Label 'Account No.';
        SalesShipmentHeaderNoCaptionLbl: Label 'Shipment No.';
        CompanyInfoBankBranchNoCaptionLbl: Label 'Bank Branch No.';
        SalesShipmentHeaderShipmentDateCaptionLbl: Label 'Shipment Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        BilltoAddressCaptionLbl: Label 'Bill-to Address';
        QuantityCaptionLbl: Label 'Quantity';
        SerialNoCaptionLbl: Label 'Serial No.';
        LotNoCaptionLbl: Label 'Lot No.';
        DescriptionCaptionLbl: Label 'Description';
        NoCaptionLbl: Label 'No.';
#pragma warning disable AA0074
#pragma warning disable AA0470
        PageCaptionCap: Label 'Page %1 of %2';
        DocumentDateCaptionLbl: Label 'Document Date';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
#pragma warning restore AA0470
#pragma warning restore AA0074
        OurDocumentNoLbl: Label 'Our Document No.';
        PurchaseOrderNoLbl: Label 'Purchase Order No.';

    protected var
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";

    procedure InitLogInteraction()
    begin
        this.gvLogInteraction := this.SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Sales Shpt. Note") <> '';
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewShowCorrectionLines: Boolean; NewShowLotSN: Boolean; gvDisplayAsmInfo: Boolean)
    begin
        this.gvNoOfCopies := NewNoOfCopies;
        this.gvShowInternalInfo := NewShowInternalInfo;
        this.gvLogInteraction := NewLogInteraction;
        this.ShowCorrectionLines := NewShowCorrectionLines;
        this.gvShowLotSN := NewShowLotSN;
        this.DisplayAssemblyInformation := gvDisplayAsmInfo;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure FormatAddressFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        this.FormatAddr.GetCompanyAddr(SalesShipmentHeader."Responsibility Center", this.RespCenter, this.CompanyInfo, this.CompanyAddr);
        this.FormatAddr.SalesShptShipTo(this.ShipToAddr, SalesShipmentHeader);
        this.ShowCustAddr := this.FormatAddr.SalesShptBillTo(this.CustAddr, this.ShipToAddr, SalesShipmentHeader);
    end;

    local procedure FormatDocumentFields(SalesShipmentHeader: Record "Sales Shipment Header")
    var
        SPText: Text[50];
    begin
        SPText := this.SalesPersonText;
        this.FormatDocument.SetSalesPerson(this.SalesPurchPerson, SalesShipmentHeader."Salesperson Code", SPText);
        this.ReferenceText := this.FormatDocument.SetText(SalesShipmentHeader."Your Reference" <> '', CopyStr(SalesShipmentHeader.FieldCaption("Your Reference"), 1, 20));
    end;

    local procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterPostDataItem(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterOnPreReport(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
    end;
}