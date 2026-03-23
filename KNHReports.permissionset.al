permissionset 54400 KNHReports
{
    Assignable = true;
    Permissions = report "KNH Cust Fill Location 2" = X,
        report "KNH Customer Comment" = X,
        report "KNH Excel MultiTable" = X,
        report "KNH Query Report" = X,
        report "KNH Vendor Lead Time" = X,
        report "KNH Vendor Rename" = X,
        report KNHCustomerExcel = X,
        report KNHItemLedgerEntryAnalysis = X,
        report KNHSalesShipment = X,
        report KNHVendorExcel = X,
        codeunit "KNH Data Updates" = X,
        query "KNH Query Report" = X;
}