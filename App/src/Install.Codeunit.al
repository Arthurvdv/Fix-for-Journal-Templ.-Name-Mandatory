codeunit 90500 "PTE Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        Management: Codeunit "PTE Management";
    begin
        Management.EnableJournalTemplateNameMandatory();
        Management.SetPurchasesPayablesSetup();
        Management.SetSalesReceivablesSetup();
        Management.SetInventorySetup();
        Management.UpdateSalesDocuments();
        Management.UpdatePurchaseDocuments();
    end;
}