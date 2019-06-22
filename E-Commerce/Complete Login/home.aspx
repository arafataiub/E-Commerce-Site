<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Complete_Login.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 702px;
            height: 83px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 811px;
            height: 1019px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style4">
        <div class="auto-style1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="ONLINE COLLECTION BD"></asp:Label>
        </div>
        <p>
            <asp:Label ID="Label2" runat="server" BackColor="White" ForeColor="#FF3300" Text="Welcome to Online Collection Bd Website"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelCartCount" runat="server" Text="Number Of Product In Your Cart"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; :<asp:Label ID="LabelCount" runat="server" Font-Size="X-Large" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/addtocart.aspx">Go to Your Cart</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="HyperLinklogin" runat="server" NavigateUrl="~/login.aspx">login</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLinkres" runat="server" NavigateUrl="~/registration.aspx">Registraton</asp:HyperLink>
        </p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/userorder.aspx">Placed Order</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLinkHome" runat="server" NavigateUrl="~/login.aspx">Home</asp:HyperLink>
        <br />
        &nbsp;<div class="auto-style3">
            <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyField="productId" DataSourceID="SqlDataSourceProduct" GridLines="Horizontal" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" >
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <ItemTemplate>
                <table border="1" class="auto-style2">
                    <tr>
                        <td class="auto-style3">Product ID:<asp:Label ID="Label3" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Product Name:<asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("image") %>' Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">TK.<asp:Label ID="Label5" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="addToCart" Height="63px" ImageUrl="~/pic/4.jpg" Width="189px" CommandArgument='<% #Eval("productId") %>'/>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    </form>
</body>
</html>
