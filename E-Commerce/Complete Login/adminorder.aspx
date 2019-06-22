<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminorder.aspx.cs" Inherits="Complete_Login.adminorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] set [status] = @status where [orderId] = @orderId">
                <UpdateParameters>
                    <asp:Parameter Name="status" />
                    <asp:Parameter Name="orderId" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="orderId" Readonly="true" HeaderText="orderId" InsertVisible="False" SortExpression="orderId" />
                <asp:BoundField DataField="name"  Readonly="true" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="address" Readonly="true" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="phone" Readonly="true" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                <asp:BoundField DataField="details" Readonly="true" HeaderText="details" SortExpression="details" />
                <asp:BoundField DataField="cost" Readonly="true" HeaderText="cost" SortExpression="cost" />
                <asp:CommandField ShowEditButton="True" />
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
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin.aspx">Back</asp:HyperLink>
    </form>
</body>
</html>
