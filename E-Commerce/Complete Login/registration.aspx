<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Complete_Login.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
            width: 436px;
            text-align: right;
        }
        .auto-style4 {
            width: 436px;
        }
        .auto-style5 {
            width: 436px;
            text-align: right;
        }
        .auto-style6 {
            height: 23px;
            width: 566px;
        }
        .auto-style7 {
            width: 566px;
        }
        .auto-style8 {
            width: 436px;
            text-align: right;
            height: 26px;
        }
        .auto-style9 {
            width: 566px;
            height: 26px;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style11 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style11">
            <strong>Registration Page<br />
            </strong>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">User Name</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxUn" runat="server" Height="22px" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Email</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="177px"></asp:TextBox>
                </td>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Confirm Password</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBoxCpass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Gender</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DropDownListGender" runat="server" Width="180px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Next" />
                    <input id="Reset1" type="reset" value="reset" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
