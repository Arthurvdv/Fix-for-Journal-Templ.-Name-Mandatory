permissionset 90500 "PTE All"
{
    Access = Internal;
    Assignable = true;
    Caption = 'All permissions', Locked = true;

    Permissions =
         codeunit "PTE Install" = X,
         codeunit "PTE Management" = X,
         codeunit "PTE Upgrade" = X;
}