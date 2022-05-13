codeunit 90501 "PTE Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
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