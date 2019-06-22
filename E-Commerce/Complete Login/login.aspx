<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Complete_Login.login" %>

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
            height: 165px;
        }
        .auto-style3 {
            text-align: right;
            width: 377px;
        }
        .auto-style4 {
            width: 377px;
        }
        .auto-style5 {
            width: 377px;
            height: 30px;
            text-align: right;
        }
        .auto-style6 {
            height: 30px;
        }
        .auto-style7 {
            text-align: right;
            width: 377px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Login Page<br />
            </strong>
        </div>
        <table align="center" class="auto-style2">
            <tr>
                <td class="auto-style7">User Name</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBoxUserName" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td>
                    <asp:TextBox ID="TextBoxLoginPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:CheckBox ID="Checkme" runat="server" Text="Remember me" />
                </td>
                <td class="auto-style6">
                    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Login" Width="87px" />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Forget Password" />
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/registration.aspx">New User Register Here</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
