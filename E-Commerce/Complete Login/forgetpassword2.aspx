<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpassword2.aspx.cs" Inherits="Complete_Login.forgetpassword2" %>

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
            width: 284px;
        }
        .auto-style4 {
            width: 284px;
            text-align: right;
        }
        .auto-style5 {
            margin-left: 5px;
        }
        .auto-style6 {
            width: 215px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Answer Security Question</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">Security Question 1</td>
                <td class="auto-style6">
                    <asp:Label ID="Labelsq1" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxsa1" runat="server" Width="236px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Security Question 2</td>
                <td class="auto-style6">
                    <asp:Label ID="Labelsq2" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxsa2" runat="server" CssClass="auto-style5" Width="224px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" style="height: 26px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
