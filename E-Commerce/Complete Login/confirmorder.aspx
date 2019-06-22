<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmorder.aspx.cs" Inherits="Complete_Login.confirmorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
            width: 426px;
        }
        .auto-style4 {
            width: 426px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="ONLINE SHOP BD"></asp:Label>
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">Name:</td>
                <td>
                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Delivery Address:</td>
                <td>
                    <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Phone No:</td>
                <td>
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="ButtonConfirm" runat="server" OnClick="ButtonConfirm_Click" Text="Confirm Order" />
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
