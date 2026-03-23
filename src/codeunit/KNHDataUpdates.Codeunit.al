codeunit 54411 "KNH Data Updates"
{
    trigger OnRun()
    begin
        this.Options := this.FunctionTxt;
        this.selection := Dialog.StrMenu(this.Options, 1, this.selectionTxt);
        case this.selection of
            1:
                this.UpdateBinContents();
            3:
                this.UpdateCustomerShipAdvice();
            4:
                this.UpdateItemSearchDesc();
            5:
                this.ClearLocCodeOnCust();
            6:
                this.UpdateConsigneeLocOnSalesHdr();
            7:
                this.UpdatePhoneNoOnContact();
            10:
                this.UpdatePhoneNoOnCustomer();
            11:
                this.UpdateVendorLocCode();
            12:
                this.UpdatePurchOrdersLocCode();
            13:
                this.UpdateItemCheckFields();
            14:
                this.UpdateItemBlockedField();
            16:
                this.CountShortItemNos();
            18:
                this.UpdateItemContacts();
            23:
                this.UpdateBinTypeOnWhseEntries();
            24:
                this.UpdateGPPGonItem();
            29:
                this.UpdateItemCostMethod();
            30:
                this.UpdateWHBinType();
            32:
                this.BinContentClearDefFix();
            33:
                this.BinContentUpdDefFix();
            34:
                this.SalesLineOrderType();
            35:
                this.SalesInvLineOrderType();
            36:
                this.SalesCreditLineOrderType();
            37:
                this.DeleteAllVendorRecords();
            38:
                this.DeleteVendorContactRecords();
            39:
                this.VendorEmailAddress();
            40:
                this.ContactAltAddrCheck();
            49:
                this.VendorRemittance();
            53:
                this.UpdateCustEmailAddr();
            54:
                this.UpdateVendEmailAddr();
            55:
                this.UpdateItemVendEmailAddr();
            57:
                this.UpdateSOLineDesc()
            else
                exit;
        end;
    end;

    var
        Customer: Record Customer;
        Item: Record Item;
        Options: Text;
        Counter: array[10] of Integer;
        Selection: Integer;
        FunctionTxt: Label
        'UpdateCustomerShipAdvice,UpdateItemSearchDesc,ClearLocCodeOnCust,UpdateConsigneeLocOnSalesHdr,UpdatePhoneNoOnContact,UpdatePhoneNoOnCustomer,UpdateVendorLocCode,UpdatePurchOrdersLocCode,UpdateItemCheckFields,UpdateItemBlockedField,CountShortItemNos,UpdateItemContacts,UpdateBinTypeOnWhseEntries,UpdateGPPGonItem,UpdateItemCostMethod,UpdateWHBinType,BinContentClearDefFix,BinContentUpdDefFix,SalesLineOrderType,SalesInvLineOrderType,SalesCreditLineOrderType,DeleteAllVendorRecords,DeleteVendorContactRecords,VendorEmailAddress,ContactAltAddrCheck,VendorRemittance,UpdateCustEmailAddr,UpdateVendEmailAddr,UpdateItemVendEmailAddr,UpdateSOLineDesc';
        SelectionTxt: Label 'Choose one of the following options:';

    //1
    local procedure UpdateBinContents()
    var
        BinContent: Record "Bin Content";
        Company: Record Company;
        Bin: Record "Bin";
    begin
        if Company.FindSet() then
            repeat
                Bin.ChangeCompany(Company.Name);
                BinContent.ChangeCompany(Company.Name);
                if BinContent.FindSet(true) then
                    repeat
                        Bin.Get(BinContent."Location Code", BinContent."Bin Code");
                        BinContent.Modify();
                    until BinContent.Next() = 0;
            until Company.Next() = 0;
        Message('Update Complete');
    end;

    //3
    local procedure UpdateCustomerShipAdvice()
    begin
        if this.Customer.FindSet(true) then
            repeat
                this.Customer."Shipping Advice" := this.Customer."Shipping Advice"::Partial;
                this.Customer.Modify();
                this.Counter[2] += 1;
            until this.Customer.Next() = 0;
        Message('Update Complete - Customer records updated for Shipping Advice to Partial = %1', Counter[2]);
    end;

    //4
    local procedure UpdateItemSearchDesc()
    begin
        if this.Item.FindSet(true) then
            repeat
                this.Item."Search Description" := CopyStr(this.Item.Description, 1, MaxStrLen(this.Item."Search Description"));
                this.Item.Modify();
                this.Counter[1] += 1;
            until this.Item.Next() = 0;
        Message('Update Complete - Item records updated for Search Description = %1', this.Counter[1]);
    end;

    //5
    local procedure ClearLocCodeOnCust()
    begin
        if Customer.FindSet(true) then
            repeat
                this.Customer."Location Code" := '';
                this.Customer.Modify();
                this.Counter[1] += 1;
            until this.Customer.Next() = 0;
        Message('Update Complete - Customer Records updated for Location Code = %1', this.Counter[1]);
    end;

    //6
    local procedure UpdateConsigneeLocOnSalesHdr()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        if SalesHeader.FindSet(true) then
            repeat
                if this.Customer.Get(SalesHeader."Sell-to Customer No.") then begin
                    SalesHeader.Modify();
                    this.Counter[1] += 1;
                end;
            until SalesHeader.Next() = 0;
        Message('Update Complete - Sales Order Header records updated for Consignee Location = %1', Counter[1]);
    end;

    //7
    local procedure UpdatePhoneNoOnContact()
    var
        Contact: Record Contact;
        CompanyInformation: Record "Company Information";
    begin
        CompanyInformation.Get();
        if Contact.FindSet() then
            repeat
                if this.Customer."Phone No." <> '' then begin
                    if Contact."Phone No." = '' then begin
                        Contact."Phone No." := this.Customer."Phone No.";
                        this.Counter[1] += 1;
                        Contact.Modify();
                    end;
                end else
                    if Contact."Phone No." = '' then begin
                        Contact."Phone No." := CompanyInformation."Phone No.";
                        this.Counter[2] += 1;
                        Contact.Modify();
                    end;
            until Contact.Next() = 0;
        Message('Update Complete\Contacts updated for Phone No. from Customer = %1\Contacts updated for Phone No. from Company = %2', this.Counter[1], Counter[2]);
    end;

    //10
    local procedure UpdatePhoneNoOnCustomer()
    var
        Contact: Record Contact;
        CompanyInformation: Record "Company Information";
    begin
        CompanyInformation.Get();
        if Customer.FindSet() then
            repeat
                if Contact.Get(Customer."Primary Contact No.") then begin
                    if Contact."Phone No." <> '' then begin
                        if this.Customer."Phone No." = '' then begin
                            this.Customer."Phone No." := Contact."Phone No.";
                            this.Counter[1] += 1;
                            this.Customer.Modify();
                        end;
                    end else
                        if this.Customer."Phone No." = '' then begin
                            this.Customer."Phone No." := CompanyInformation."Phone No.";
                            this.Counter[2] += 1;
                            this.Customer.Modify();
                        end;
                end else
                    if this.Customer."Phone No." = '' then begin
                        this.Customer."Phone No." := CompanyInformation."Phone No.";
                        this.Counter[2] += 1;
                        this.Customer.Modify();
                    end;
            until this.Customer.Next() = 0;
        Message('Update Complete\Customers updated for Phone No. from Contact = %1\Customers updated for Phone No. from Company = %2', this.Counter[1], this.Counter[2]);
    end;

    //11
    local procedure UpdateVendorLocCode()
    var
        Vendor: Record Vendor;
    begin
        if Vendor.FindSet(true) then
            repeat
                Vendor."Location Code" := 'PRIF WARWS';
                Vendor.Modify();
                this.Counter[1] += 1;
            until Vendor.Next() = 0;
        Message('Update Complete - Vendor records updated for Location Code = %1', this.Counter[1]);
    end;

    //12
    local procedure UpdatePurchOrdersLocCode()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        if PurchaseHeader.FindSet(true) then
            repeat
                PurchaseHeader."Location Code" := 'PRIF WARWS';
                PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                if PurchaseLine.FindSet(true) then
                    repeat
                        PurchaseLine.Validate("Location Code", 'PRIF WARWS');
                        PurchaseHeader.Modify();
                        this.Counter[2] += 1;
                    until PurchaseLine.Next() = 0;
                PurchaseHeader.Modify();
                this.Counter[1] += 1;
            until PurchaseHeader.Next() = 0;
        Message('Update Complete\Purch Headers updated for Location Code = %1\Purch Lines updated for Location Code = %2', this.Counter[1], this.Counter[2]);
    end;

    //13
    local procedure UpdateItemCheckFields()
    var
        NewDateTime: DateTime;
    begin
        NewDateTime := CreateDateTime(20231005D, 000000T);
        this.Item.SetFilter("Last DateTime Modified", '<%1', NewDateTime);
        if this.Item.FindSet(true) then
            repeat
                this.Item.Modify();
                this.Counter[1] += 1;
            until this.Item.Next() = 0;
        Message('Update Complete - Item records updated for Item Check = %1', this.Counter[1]);
    end;

    //14
    local procedure UpdateItemBlockedField()
    begin
        //Item.SetRange("BCW Item Checked", true);
        this.Item.SetRange(Blocked, true);
        if this.Item.FindSet(true) then
            repeat
                this.Item.Blocked := false;
                this.Item.Modify();
                this.Counter[1] += 1;
            until this.Item.Next() = 0;
        Message('Update Complete - Item records updated for Blocked = %1', this.Counter[1]);
    end;

    //16
    local procedure CountShortItemNos()
    var
        I: Integer;
        Total: array[100] of Text[20];
    begin
        if this.Item.FindSet(true) then
            repeat
                if StrLen(this.Item."No.") < 10 then begin
                    this.Counter[1] += 1;
                    I += 1;
                    Total[I] := Item."No.";
                    //Item.Delete(true);
                end;
            until this.Item.Next() = 0;
        Message('%1 Items found with Item No. length of < 10 characters.', this.Counter[1]);
    end;

    //18
    local procedure UpdateItemContacts()
    var
        MarketingSetup: Record "Marketing Setup";
        Contact: Record Contact;
        NoSeriesManagement: Codeunit "No. Series";
        ContactNo: Code[20];
    begin
        if this.Item.FindSet() then
            repeat
                if not Contact.FindFirst() then begin
                    MarketingSetup.Get();
                    ContactNo := NoSeriesManagement.GetNextNo(MarketingSetup."Contact Nos.", WorkDate(), true);
                    Contact.Init();
                    Contact.Validate("No.", ContactNo);
                    Contact.Insert();
                    Contact.Validate(Type, Contact.Type::Person);
                    Contact.Validate("Company Name", '');
                    Contact.Modify();
                    this.Counter[1] += 1
                end;
                this.Item.Modify();
            until this.Item.Next() = 0;
        Message('Update Complete %1 Contact records created where Author Contact No. blank on Item.', this.Counter[1]);
    end;

    //23
    local procedure UpdateBinTypeOnWhseEntries()
    var
        WarehouseEntry: Record "Warehouse Entry";
        Bin: Record Bin;
    begin
        if WarehouseEntry.FindSet(true) then
            repeat
                if Bin.Get(WarehouseEntry."Location Code", WarehouseEntry."Bin Code") then begin
                    WarehouseEntry.modify();
                    this.Counter[1] += 1;
                end;
            until WarehouseEntry.Next() = 0;
        Message('Update Complete - WH Bin Type field updated for %1 records.', this.Counter[1]);
    end;

    //24
    local procedure UpdateGPPGonItem()
    begin
        if this.Item.FindSet(true) then
            repeat
                this.Item."Gen. Prod. Posting Group" := this.Item."Inventory Posting Group";
                this.Item.Modify();
                this.Counter[1] += 1;
            until this.Item.Next() = 0;
        Message('Update Complete - Item GPPG field updated for %1 records.', this.Counter[1]);
    end;

    //29
    local procedure UpdateItemCostMethod()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        PurchaseLine: Record "Purchase Line";
        UpdateCompleteMsg: Label 'Item Update Complete - %1 records found, %2 records updated, %3 records not updated', Comment = '%1 = Rcords Counted, %2 = Records updated, %3 = Records not updated';
    begin
        this.Item.SetFilter("Costing Method", '<>%1', this.Item."Costing Method"::Standard);
        if this.Item.FindSet(true) then
            repeat
                this.Counter[1] += 1;
                ItemLedgerEntry.SetRange("Item No.", Item."No.");
                if ItemLedgerEntry.IsEmpty then begin
                    PurchaseLine.SetRange("No.", Item."No.");
                    if PurchaseLine.IsEmpty then begin
                        this.Item.Validate("Costing Method", this.Item."Costing Method"::Standard);
                        this.Counter[2] += 1;
                    end else
                        this.Counter[3] += 1;
                end else
                    this.Counter[3] += 1;
            until this.Item.Next() = 0;
        Message(UpdateCompleteMsg, this.Counter[1], this.Counter[2], this.Counter[3]);
    end;

    //30
    local procedure UpdateWHBinType()
    var
        Bin: Record Bin;
        Bin2: Record Bin;
        UpdateCompleteMsg: Label 'Bin Update Complete - %1 records created.', Comment = '%1 = Records Inserted';
    begin
        //All of the records in Location PRIF WARWS where the "WH Bin type" = Bulk Bin Location need to be copied to the location PW-FROZEN but for each Location PW-FROZEN record the "WH Bin Type" field needs to be set to Frozen Bin Location. 
        Bin.SetRange("Location Code", 'PRIF WARWS');
        if Bin.FindSet() then
            repeat
                Bin2.Init();
                Bin2."Location Code" := Bin."Location Code";
                Bin2.Code := Bin.Code;
                Bin2.Insert();
                this.Counter[1] += 1;
            until Bin.Next() = 0;
        Message(UpdateCompleteMsg, this.Counter[1]);
    end;

    //32
    local procedure BinContentClearDefFix()
    var
        BinContent: Record "Bin Content";
        UpdateCompleteMsg: Label 'Update complete - %1 Bin Content records found.', Comment = '%1 = Counter[1]';
    begin
        BinContent.SetRange("Location Code", 'PRIF WARWS');
        BinContent.SetRange(Default, true);
        BinContent.SetRange(Fixed, true);
        if BinContent.FindSet() then
            repeat
                BinContent.Default := false;
                BinContent.Fixed := false;
                BinContent.Modify();
                this.Counter[1] += 1;
            until BinContent.Next() = 0;
        Message(UpdateCompleteMsg, this.Counter[1]);
    end;

    //33
    local procedure BinContentUpdDefFix()
    var
        BinContent: Record "Bin Content";
        ItemNumber: Code[20];
        UpdateCompleteMsg: Label 'Update complete - %1 Bin Content records found.', Comment = '%1 = Counter[1]';
    begin
        ItemNumber := '';
        BinContent.SetRange("Location Code", 'PRIF WARWS');
        if BinContent.FindSet() then
            repeat
                if ItemNumber <> BinContent."Item No." then begin
                    ItemNumber := BinContent."Item No.";
                    BinContent.Default := true;
                    BinContent.Fixed := true;
                    BinContent.Modify();
                    this.Counter[1] += 1;
                end;
            until BinContent.Next() = 0;
        Message(UpdateCompleteMsg, Counter[1]);
    end;

    //34
    local procedure SalesLineOrderType()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        UpdateCompleteMsg: Label 'Update complete - %1 Sales Line records corrected.', Comment = '%1 = Counter[1]';
    begin
        if SalesHeader.FindSet() then
            repeat
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange(Type, SalesLine.Type::Item);
                if SalesLine.FindSet(true) then
                    repeat
                        SalesLine.Modify();
                        Counter[1] += 1;
                    until SalesLine.Next() = 0;
            until SalesHeader.Next() = 0;
        Message(UpdateCompleteMsg, this.Counter[1]);
    end;

    //35
    local procedure SalesInvLineOrderType()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        UpdateCompleteMsg: Label 'Update complete - %1 Sales Invoice Line records corrected.', Comment = '%1 = Counter[1]';
    begin
        if SalesInvoiceHeader.FindSet() then
            repeat
                SalesInvoiceLine.SetRange("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine.SetRange(Type, SalesInvoiceLine.Type::Item);
                if SalesInvoiceLine.FindSet(true) then
                    repeat
                        SalesInvoiceLine.Modify();
                        this.Counter[1] += 1;
                    until SalesInvoiceLine.Next() = 0;
            until SalesInvoiceHeader.Next() = 0;
        Message(UpdateCompleteMsg, this.Counter[1]);
    end;

    //36
    local procedure SalesCreditLineOrderType()
    var
        SalesCRMemoHeader: Record "Sales Cr.Memo Header";
        SalesCRMemoLine: Record "Sales Cr.Memo Line";
        UpdateCompleteMsg: Label 'Update complete - %1 Sales credit Memo Line records corrected.', Comment = '%1 = Counter[1]';
    begin
        if SalesCRMemoHeader.FindSet() then
            repeat
                SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHeader."No.");
                SalesCrMemoLine.SetRange(Type, SalesCrMemoLine.Type::Item);
                if SalesCrMemoLine.FindSet(true) then
                    repeat
                        SalesCrMemoLine.Modify();
                        this.Counter[1] += 1;
                    until SalesCrMemoLine.Next() = 0;
            until SalesCrMemoHeader.Next() = 0;
        Message(UpdateCompleteMsg, this.Counter[1]);
    end;

    //37
    local procedure DeleteAllVendorRecords();
    var
        Vendor: Record Vendor;
        ItemVendor: Record "Item Vendor";
        ConfirmMsg: Label 'Delete all Vendor and Item Vendor records?';
        UpdateCompleteMsg: Label 'Update Complete - All records deleted for Vendor and Item Vendor.';
    begin
        if Confirm(ConfirmMsg, false, true) then begin
            Vendor.DeleteAll();
            ItemVendor.DeleteAll();
            Message(UpdateCompleteMsg)
        end;
    end;

    //38
    local procedure DeleteVendorContactRecords();
    var
        Contact: Record Contact;
        UpdateCompleteMsg: Label 'Update Complete - All Vendor contact records deleted.';
    begin
        if Confirm('Contact records found = %1. Delete them?', false, Contact.Count()) then begin
            Contact.DeleteAll();
            Message(UpdateCompleteMsg);
        end;
    end;

    //39
    local procedure VendorEmailAddress()
    var
        Vendor: Record Vendor;
        ConfirmMsg: Label 'Update email address for all Vendor and Item Vendor records?';
        UpdateCompleteMsg: Label 'Update Complete for all Vendor and Item Vendor records.';
    begin
        if Confirm(ConfirmMsg, false, true) then begin
            Vendor.ModifyAll("E-Mail", 'stoc@llyfrau.cymru');
            Message(UpdateCompleteMsg);
        end;
    end;

    //40
    local procedure ContactAltAddrCheck()
    var
        ContactAltAddress: Record "Contact Alt. Address";
        Contact: Record Contact;
        CheckMsg: Label 'ContactAltAddress orphaned records found and deleted = %1.', Comment = '%1 = Count of Contact records not found for Alternative Contact Addresses.';
    begin
        if ContactAltAddress.FindSet() then
            repeat
                if not Contact.Get(ContactAltAddress."Contact No.") then begin
                    Counter[1] += 1;
                    ContactAltAddress.Delete();
                end;
            until ContactAltAddress.Next() = 0;
        Message(CheckMsg, Counter[1]);
    end;

    //49
    local procedure VendorRemittance();
    var
        Vendor: Record Vendor;
        CustomReportSelection: Record "Custom Report Selection";
    begin
        CustomReportSelection.SetRange(CustomReportSelection.Usage, CustomReportSelection.Usage::"V.Remittance");
        CustomReportSelection.DeleteAll();
        if Vendor.FindSet(true) then
            repeat
                Vendor."Document Sending Profile" := 'AUTOEMAIL';
                CustomReportSelection.Init();
                CustomReportSelection.Validate(Usage, CustomReportSelection.Usage::"V.Remittance");
                CustomReportSelection.Validate("Report ID", 50003);
                CustomReportSelection.Validate("Use for Email Body", true);
                CustomReportSelection."Source Type" := 23;
                CustomReportSelection."Source No." := Vendor."No.";

                if Vendor."Language Code" = 'ENG' then begin
                    CustomReportSelection.Validate("Email Body Layout Code", '50003-000002');
                    CustomReportSelection.CalcFields("Custom Report Description", "Email Body Layout Description");
                end else begin
                    CustomReportSelection.Validate("Email Body Layout Code", '50003-000003');
                    CustomReportSelection.CalcFields("Custom Report Description", "Email Body Layout Description");
                end;

                CustomReportSelection.Insert(true);
                Vendor.Modify();
                this.Counter[1] += 1;
            until Vendor.Next() = 0;
        Message('Document Layout Records Created = %1', this.Counter[1]);
    end;

    //53
    local procedure UpdateCustEmailAddr()
    begin
        if this.Customer.FindSet() then
            repeat
                this.Customer."E-Mail" := 'shipping.wms@books.wales ';
                this.Customer.Modify();
                this.Counter[1] += 1;
            until this.Customer.Next() = 0;
        Message('Customer email address updated for %1 records.', this.Counter[1]);
    end;

    //54
    local procedure UpdateVendEmailAddr()
    var
        Vendor: Record Vendor;
    begin
        if Vendor.FindSet() then
            repeat
                Vendor."E-Mail" := 'shipping.wms@books.wales ';
                Vendor.Modify();
                this.Counter[1] += 1;
            until Vendor.Next() = 0;
        Message('Vendor email address updated for %1 records.', this.Counter[1]);
    end;

    //55
    local procedure UpdateItemVendEmailAddr();
    var
        ItemVendor: Record "Item Vendor";
    begin
        if ItemVendor.FindSet() then
            repeat
                this.Counter[1] += 1;
            until ItemVendor.Next() = 0;
        Message('ItemVendor email addresses updated for %1 records.', this.Counter[1]);
    end;

    //57
    local procedure UpdateSOLineDesc()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        if SalesHeader.FindSet() then
            repeat
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange(Type, SalesLine.Type::Item);
                if SalesLine.FindSet() then
                    repeat
                        if this.Item.Get(SalesLine."No.") then
                            if this.Item."Description 2" <> '' then
                                if UpperCase(SalesLine.Description) <> UpperCase(this.Item."Description 2") then begin
                                    SalesLine."Description" := Item."Description 2";
                                    SalesLine.Modify();
                                    case SalesLine."Document Type" of
                                        SalesLine."Document Type"::Order:
                                            this.Counter[1] += 1;
                                        SalesLine."Document Type"::"Credit Memo":
                                            this.Counter[2] += 1;
                                        SalesLine."Document Type"::Invoice:
                                            this.Counter[3] += 1;
                                        SalesLine."Document Type"::"Return Order":
                                            this.Counter[4] += 1;
                                        else
                                            this.Counter[5] += 1;
                                    end;
                                end;
                    until SalesLine.Next() = 0;
            until SalesHeader.Next() = 0;
        this.Counter[6] := this.Counter[1] + this.Counter[2] + this.Counter[3] + this.Counter[4] + this.Counter[5];
        Message('Sales Lines updated for Description\Order = %1\Credit = %2\Invoice = %3\Return = %4\Other = %5\Total = %6',
        this.Counter[1], this.Counter[2], this.Counter[3], this.Counter[4], this.Counter[5], this.Counter[6]);
    end;
}
