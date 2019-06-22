<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtocart.aspx.cs" Inherits="Complete_Login.addtocart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>
            <asp:Label ID="Label1" runat="server" Text="ONLINE COLLECTION BD"></asp:Label>
            </strong>
        </div>
        <p class="auto-style1">
            &nbsp;</p>
        <asp:Label ID="Label2" runat="server" Text="You Have Added Following Product To Your Cart"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style2" ForeColor="#FF6600" NavigateUrl="~/home.aspx">Continue Shopping..</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="Page_Load" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="cartId" HeaderText="cartId" SortExpression="cartId" />
                <asp:BoundField DataField="productId" HeaderText="productId" SortExpression="productId" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:ImageField DataImageUrlField="image" HeaderText="image">
                    <ControlStyle Height="150px" Width="150px" />
                </asp:ImageField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" 
                    SelectCommand="select Cart.cartId, Cart.productId, Products.name, Products.price, Products.image from Cart ,Products where Cart.productId = Products.productId and Cart.cartId=@new" DeleteCommand="delete from Cart where Cart.cartId=@new and [productId]=@productId" >
                <SelectParameters>
               <asp:SessionParameter Name="new" SessionField="new" Type="String" />
                </SelectParameters>
            <DeleteParameters>
                <asp:SessionParameter Name="new" SessionField="new" Type="String" />
                <asp:Parameter Name="productId" Type="Int32" />

            </DeleteParameters>
                    
        </asp:SqlDataSource>

        <br />
        <asp:Label ID="Label3" runat="server" Text="Total Payable = "></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="ButtonConfirm" runat="server" OnClick="ButtonConfirm_Click" Text="Confirm Order" />

    </form>
</body>
</html>
