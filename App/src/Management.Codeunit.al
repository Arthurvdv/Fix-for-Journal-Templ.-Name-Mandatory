codeunit 90502 "PTE Management"
{
    procedure EnableJournalTemplateNameMandatory()
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if not GeneralLedgerSetup.Get() then
            exit;

        if GeneralLedgerSetup."Journal Templ. Name Mandatory" then
            exit;

        GeneralLedgerSetup.Validate("Journal Templ. Name Mandatory", true);
        GeneralLedgerSetup.Modify(true);
    end;

    procedure SetPurchasesPayablesSetup()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        GenJournalTemplate: Record "Gen. Journal Template";
        IsModify: Boolean;
    begin
        if not PurchasesPayablesSetup.Get() then
            exit;

        IsModify := false;

        //OLD: 11310; "Journal Templ. Purch. Invoice"; Code[10]
        //NEW: 200; "P. Invoice Template Name"; Code[10]
        if (PurchasesPayablesSetup."Journal Templ. Purch. Invoice" <> '') and (PurchasesPayablesSetup."P. Invoice Template Name" = '') then
            if GenJournalTemplate.Get(PurchasesPayablesSetup."Journal Templ. Purch. Invoice") then begin
                PurchasesPayablesSetup.Validate("P. Invoice Template Name", PurchasesPayablesSetup."Journal Templ. Purch. Invoice");
                IsModify := true;
            end;

        //OLD: 11311; "Journal Templ. Purch. Cr. Memo"; Code[10]
        //NEW: 201; "P. Cr. Memo Template Name"; Code[10]
        if (PurchasesPayablesSetup."Journal Templ. Purch. Cr. Memo" <> '') and (PurchasesPayablesSetup."P. Cr. Memo Template Name" = '') then
            if GenJournalTemplate.Get(PurchasesPayablesSetup."Journal Templ. Purch. Cr. Memo") then begin
                PurchasesPayablesSetup.Validate("P. Cr. Memo Template Name", PurchasesPayablesSetup."Journal Templ. Purch. Cr. Memo");
                IsModify := true;
            end;

        //OLD: 11320; "Jnl. Templ. Prep. P. Inv."; Code[10]
        //NEW: 202; "P. Prep. Inv. Template Name"; Code[10]
        if (PurchasesPayablesSetup."Jnl. Templ. Prep. P. Inv." <> '') and (PurchasesPayablesSetup."P. Prep. Inv. Template Name" = '') then
            if GenJournalTemplate.Get(PurchasesPayablesSetup."Jnl. Templ. Prep. P. Inv.") then begin
                PurchasesPayablesSetup.Validate("P. Prep. Inv. Template Name", PurchasesPayablesSetup."Jnl. Templ. Prep. P. Inv.");
                IsModify := true;
            end;

        //OLD: 11321; "Jnl. Templ. Prep. P. Cr. Memo"; Code[10]
        //NEW: 203; "P. Prep. Cr.Memo Template Name"; Code[10]
        if (PurchasesPayablesSetup."Jnl. Templ. Prep. P. Cr. Memo" <> '') and (PurchasesPayablesSetup."P. Prep. Cr.Memo Template Name" = '') then
            if GenJournalTemplate.Get(PurchasesPayablesSetup."Jnl. Templ. Prep. P. Cr. Memo") then begin
                PurchasesPayablesSetup.Validate("P. Prep. Cr.Memo Template Name", PurchasesPayablesSetup."Jnl. Templ. Prep. P. Cr. Memo");
                IsModify := true;
            end;

        //OLD: 11322; "IC Jnl. Templ. Purch. Invoice"; Code[10]
        //NEW: 204; "IC Purch. Invoice Templ. Name"; Code[10]
        if (PurchasesPayablesSetup."IC Jnl. Templ. Purch. Invoice" <> '') and (PurchasesPayablesSetup."IC Purch. Invoice Templ. Name" = '') then
            if GenJournalTemplate.Get(PurchasesPayablesSetup."IC Jnl. Templ. Purch. Invoice") then begin
                PurchasesPayablesSetup.Validate("IC Purch. Invoice Templ. Name", PurchasesPayablesSetup."IC Jnl. Templ. Purch. Invoice");
                IsModify := true;
            end;

        //OLD: 11323; "IC Jnl. Templ. Purch. Cr. Memo"; Code[10]
        //NEW: 205; "IC Purch. Cr. Memo Templ. Name"; Code[10]
        if (PurchasesPayablesSetup."IC Jnl. Templ. Purch. Cr. Memo" <> '') and (PurchasesPayablesSetup."IC Purch. Cr. Memo Templ. Name" = '') then
            if GenJournalTemplate.Get(PurchasesPayablesSetup."IC Jnl. Templ. Purch. Cr. Memo") then begin
                PurchasesPayablesSetup.Validate("IC Purch. Cr. Memo Templ. Name", PurchasesPayablesSetup."IC Jnl. Templ. Purch. Cr. Memo");
                IsModify := true;
            end;

        if IsModify then
            PurchasesPayablesSetup.Modify(true);
    end;

    procedure SetSalesReceivablesSetup()
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        GenJournalTemplate: Record "Gen. Journal Template";
        IsModify: Boolean;
    begin
        if not SalesReceivablesSetup.Get() then
            exit;

        IsModify := false;

        //OLD: 11310; "Journal Templ. Sales Invoice"; Code[10]
        //NEW: 201; "S. Invoice Template Name"; Code[10]
        if (SalesReceivablesSetup."Journal Templ. Sales Invoice" <> '') and (SalesReceivablesSetup."S. Invoice Template Name" = '') then
            if GenJournalTemplate.Get(SalesReceivablesSetup."Journal Templ. Sales Invoice") then begin
                SalesReceivablesSetup.Validate("S. Invoice Template Name", SalesReceivablesSetup."Journal Templ. Sales Invoice");
                IsModify := true;
            end;

        //OLD: 11311; "Journal Templ. Sales Cr. Memo"; Code[10]
        //NEW: 202; "S. Cr. Memo Template Name"; Code[10]
        if (SalesReceivablesSetup."Journal Templ. Sales Cr. Memo" <> '') and (SalesReceivablesSetup."S. Cr. Memo Template Name" = '') then
            if GenJournalTemplate.Get(SalesReceivablesSetup."Journal Templ. Sales Cr. Memo") then begin
                SalesReceivablesSetup.Validate("S. Cr. Memo Template Name", SalesReceivablesSetup."Journal Templ. Sales Cr. Memo");
                IsModify := true;
            end;

        //OLD: 11320; "Jnl. Templ. Prep. S. Inv."; Code[10]
        //NEW: 203; "S. Prep. Inv. Template Name"; Code[10]
        if (SalesReceivablesSetup."Jnl. Templ. Prep. S. Inv." <> '') and (SalesReceivablesSetup."S. Prep. Inv. Template Name" = '') then
            if GenJournalTemplate.Get(SalesReceivablesSetup."Jnl. Templ. Prep. S. Inv.") then begin
                SalesReceivablesSetup.Validate("S. Prep. Inv. Template Name", SalesReceivablesSetup."Jnl. Templ. Prep. S. Inv.");
                IsModify := true;
            end;

        //OLD: 11321; "Jnl. Templ. Prep. S. Cr. Memo"; Code[10]
        //NEW: 204; "S. Prep. Cr.Memo Template Name"; Code[10]
        if (SalesReceivablesSetup."Jnl. Templ. Prep. S. Cr. Memo" <> '') and (SalesReceivablesSetup."S. Prep. Cr.Memo Template Name" = '') then
            if GenJournalTemplate.Get(SalesReceivablesSetup."Jnl. Templ. Prep. S. Cr. Memo") then begin
                SalesReceivablesSetup.Validate("S. Prep. Cr.Memo Template Name", SalesReceivablesSetup."Jnl. Templ. Prep. S. Cr. Memo");
                IsModify := true;
            end;

        //OLD: 11322; "IC Jnl. Templ. Sales Invoice"; Code[10]
        //NEW: 205; "IC Sales Invoice Template Name"; Code[10]
        if (SalesReceivablesSetup."IC Jnl. Templ. Sales Invoice" <> '') and (SalesReceivablesSetup."IC Sales Invoice Template Name" = '') then
            if GenJournalTemplate.Get(SalesReceivablesSetup."IC Jnl. Templ. Sales Invoice") then begin
                SalesReceivablesSetup.Validate("IC Sales Invoice Template Name", SalesReceivablesSetup."IC Jnl. Templ. Sales Invoice");
                IsModify := true;
            end;

        //OLD: 11323; "IC Jnl. Templ. Sales Cr. Memo"; Code[10]
        //NEW: 206; "IC Sales Cr. Memo Templ. Name"; Code[10]
        if (SalesReceivablesSetup."IC Jnl. Templ. Sales Cr. Memo" <> '') and (SalesReceivablesSetup."IC Sales Cr. Memo Templ. Name" = '') then
            if GenJournalTemplate.Get(SalesReceivablesSetup."IC Jnl. Templ. Sales Cr. Memo") then begin
                SalesReceivablesSetup.Validate("IC Sales Cr. Memo Templ. Name", SalesReceivablesSetup."IC Jnl. Templ. Sales Cr. Memo");
                IsModify := true;
            end;

        if IsModify then
            SalesReceivablesSetup.Modify(true);

    end;

    procedure SetInventorySetup()
    var
        InventorySetup: Record "Inventory Setup";
        GenJournalTemplate: Record "Gen. Journal Template";
        IsModify: Boolean;
    begin
        if not InventorySetup.Get() then
            exit;

        IsModify := false;

        //OLD: 11300; "Jnl. Templ. Name Cost Posting"; Code[10]
        //NEW: 180; "Invt. Cost Jnl. Template Name"; Code[10]
        if (InventorySetup."Jnl. Templ. Name Cost Posting" <> '') and (InventorySetup."Invt. Cost Jnl. Template Name" = '') then
            if GenJournalTemplate.Get(InventorySetup."Jnl. Templ. Name Cost Posting") then begin
                InventorySetup.Validate("Invt. Cost Jnl. Template Name", InventorySetup."Jnl. Templ. Name Cost Posting");
                IsModify := true;
            end;

        //OLD: 11306; "Jnl. Batch Name Cost Posting"; Code[10]
        //NEW: 181; "Invt. Cost Jnl. Batch Name"; Code[10]
        if (InventorySetup."Jnl. Batch Name Cost Posting" <> '') and (InventorySetup."Invt. Cost Jnl. Batch Name" = '') then
            if GenJournalTemplate.Get(InventorySetup."Jnl. Batch Name Cost Posting") then begin
                InventorySetup.Validate("Invt. Cost Jnl. Batch Name", InventorySetup."Jnl. Batch Name Cost Posting");
                IsModify := true;
            end;

        if IsModify then
            InventorySetup.Modify(true);
    end;

    procedure UpdateSalesDocuments()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Journal Templ. Name", '');
        if SalesHeader.FindSet(true, false) then
            repeat
                SetJournalTemplateName(SalesHeader);
                SalesHeader.Modify(true);
            until SalesHeader.Next() = 0;
    end;

    procedure UpdatePurchaseDocuments()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.SetRange("Journal Templ. Name", '');
        if PurchaseHeader.FindSet(true, false) then
            repeat
                SetJournalTemplateName(PurchaseHeader);
                PurchaseHeader.Modify(true);
            until PurchaseHeader.Next() = 0;
    end;

    local procedure SetJournalTemplateName(var Rec: Record "Sales Header")
    var
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        GenJournalTemplate: Record "Gen. Journal Template";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PostingNoSeries: Code[20];
    begin
        GLSetup.Get();
        SalesSetup.Get();
        if GLSetup."Journal Templ. Name Mandatory" then begin
            if Rec."Journal Templ. Name" = '' then begin
                if not Rec.IsCreditDocType() then
                    GenJournalTemplate.Get(SalesSetup."S. Invoice Template Name")
                else
                    GenJournalTemplate.Get(SalesSetup."S. Cr. Memo Template Name");
                Rec."Journal Templ. Name" := GenJournalTemplate.Name;
            end else
                GenJournalTemplate.Get(Rec."Journal Templ. Name");
            PostingNoSeries := GenJournalTemplate."Posting No. Series";
        end else
            if Rec.IsCreditDocType() then
                PostingNoSeries := SalesSetup."Posted Credit Memo Nos."
            else
                PostingNoSeries := SalesSetup."Posted Invoice Nos.";

        case Rec."Document Type" of
            Rec."Document Type"::Quote, Rec."Document Type"::Order:
                begin
                    NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    NoSeriesMgt.SetDefaultSeries(Rec."Shipping No. Series", SalesSetup."Posted Shipment Nos.");
                    if Rec."Document Type" = Rec."Document Type"::Order then begin
                        NoSeriesMgt.SetDefaultSeries(Rec."Prepayment No. Series", SalesSetup."Posted Prepmt. Inv. Nos.");
                        NoSeriesMgt.SetDefaultSeries(Rec."Prepmt. Cr. Memo No. Series", SalesSetup."Posted Prepmt. Cr. Memo Nos.");
                    end;
                end;
            Rec."Document Type"::Invoice:
                begin
                    if (Rec."No. Series" <> '') and (SalesSetup."Invoice Nos." = PostingNoSeries) then
                        Rec."Posting No. Series" := Rec."No. Series"
                    else
                        NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    if SalesSetup."Shipment on Invoice" then
                        NoSeriesMgt.SetDefaultSeries(Rec."Shipping No. Series", SalesSetup."Posted Shipment Nos.");
                end;
            Rec."Document Type"::"Return Order":
                begin
                    NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    NoSeriesMgt.SetDefaultSeries(Rec."Return Receipt No. Series", SalesSetup."Posted Return Receipt Nos.");
                end;
            Rec."Document Type"::"Credit Memo":
                begin
                    if (Rec."No. Series" <> '') and (SalesSetup."Credit Memo Nos." = PostingNoSeries) then
                        Rec."Posting No. Series" := Rec."No. Series"
                    else
                        NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    if SalesSetup."Return Receipt on Credit Memo" then
                        NoSeriesMgt.SetDefaultSeries(Rec."Return Receipt No. Series", SalesSetup."Posted Return Receipt Nos.");
                end;
        end;
    end;

    local procedure SetJournalTemplateName(var Rec: Record "Purchase Header")
    var
        GLSetup: Record "General Ledger Setup";
        PurchSetup: Record "Purchases & Payables Setup";
        GenJournalTemplate: Record "Gen. Journal Template";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PostingNoSeries: Code[20];
    begin
        GLSetup.Get();
        PurchSetup.Get();
        if GLSetup."Journal Templ. Name Mandatory" then begin
            if Rec."Journal Templ. Name" = '' then begin
                if not Rec.IsCreditDocType() then
                    GenJournalTemplate.Get(PurchSetup."P. Invoice Template Name")
                else
                    GenJournalTemplate.Get(PurchSetup."P. Cr. Memo Template Name");
                Rec."Journal Templ. Name" := GenJournalTemplate.Name;
            end else
                if GenJournalTemplate.Name = '' then
                    GenJournalTemplate.Get(Rec."Journal Templ. Name");
            PostingNoSeries := GenJournalTemplate."Posting No. Series";
        end else
            if Rec.IsCreditDocType() then
                PostingNoSeries := PurchSetup."Posted Credit Memo Nos."
            else
                PostingNoSeries := PurchSetup."Posted Invoice Nos.";

        case Rec."Document Type" of
            Rec."Document Type"::Quote, Rec."Document Type"::Order:
                begin
                    NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    NoSeriesMgt.SetDefaultSeries(Rec."Receiving No. Series", PurchSetup."Posted Receipt Nos.");
                    if Rec."Document Type" = Rec."Document Type"::Order then begin
                        NoSeriesMgt.SetDefaultSeries(Rec."Prepayment No. Series", PurchSetup."Posted Prepmt. Inv. Nos.");
                        NoSeriesMgt.SetDefaultSeries(Rec."Prepmt. Cr. Memo No. Series", PurchSetup."Posted Prepmt. Cr. Memo Nos.");
                    end;
                end;
            Rec."Document Type"::Invoice:
                begin
                    if (Rec."No. Series" <> '') and (PurchSetup."Invoice Nos." = PostingNoSeries) then
                        Rec."Posting No. Series" := Rec."No. Series"
                    else
                        NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    if PurchSetup."Receipt on Invoice" then
                        NoSeriesMgt.SetDefaultSeries(Rec."Receiving No. Series", PurchSetup."Posted Receipt Nos.");
                end;
            Rec."Document Type"::"Return Order":
                begin
                    NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    NoSeriesMgt.SetDefaultSeries(Rec."Return Shipment No. Series", PurchSetup."Posted Return Shpt. Nos.");
                end;
            Rec."Document Type"::"Credit Memo":
                begin
                    if (Rec."No. Series" <> '') and (PurchSetup."Credit Memo Nos." = PostingNoSeries) then
                        Rec."Posting No. Series" := Rec."No. Series"
                    else
                        NoSeriesMgt.SetDefaultSeries(Rec."Posting No. Series", PostingNoSeries);
                    if PurchSetup."Return Shipment on Credit Memo" then
                        NoSeriesMgt.SetDefaultSeries(Rec."Return Shipment No. Series", PurchSetup."Posted Return Shpt. Nos.");
                end;
        end;
    end;
}