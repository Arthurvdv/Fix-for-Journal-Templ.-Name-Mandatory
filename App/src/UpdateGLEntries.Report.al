report 90500 "PTE Update G/L Entries"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Update G/L Entries';
    ProcessingOnly = true;
    Permissions = tabledata "G/L Entry" = rimd;

    dataset
    {
        dataitem(GLEntry; "G/L Entry")
        {
            DataItemTableView = where("Journal Templ. Name" = const(''));

            trigger OnAfterGetRecord()
            var
                PurchSetup: Record "Purchases & Payables Setup";
                SalesSetup: Record "Sales & Receivables Setup";
            begin
                PurchSetup.SetLoadFields("P. Cr. Memo Template Name", "P. Invoice Template Name");
                PurchSetup.Get();

                SalesSetup.SetLoadFields("S. Cr. Memo Template Name", "S. Invoice Template Name");
                SalesSetup.Get();

                case GLEntry."Source Type" of
                    GLEntry."Source Type"::Vendor:
                        case GLEntry."Document Type" of
                            GLEntry."Document Type"::"Credit Memo":
                                GLEntry."Journal Templ. Name" := PurchSetup."P. Cr. Memo Template Name";
                            GLEntry."Document Type"::Invoice:
                                GLEntry."Journal Templ. Name" := PurchSetup."P. Invoice Template Name";
                        end;
                    GLEntry."Source Type"::Customer:
                        case GLEntry."Document Type" of
                            GLEntry."Document Type"::"Credit Memo":
                                GLEntry."Journal Templ. Name" := SalesSetup."S. Cr. Memo Template Name";
                            GLEntry."Document Type"::Invoice:
                                GLEntry."Journal Templ. Name" := SalesSetup."S. Invoice Template Name";
                        end;
                end;

                GLEntry.Modify(false);
            end;
        }
    }
}