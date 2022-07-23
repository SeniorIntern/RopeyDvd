<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UnsoldDvds.aspx.cs" Inherits="RopeyDVD.UnsoldDvds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">DVD Titles with no Copies Loaned in Last 31 Days </h1>
    <div  style="margin-left:35%">
        <asp:GridView ID="GridViewUnsoldDvds" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUnsoldDvds">
            <Columns>
                <asp:BoundField DataField="DTitle" HeaderText="DTitle" SortExpression="DTitle" />
                <asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
            </Columns>

            <%--Styling gridview--%>
            <FooterStyle BackColor="#24405c" ForeColor="white" />
            <HeaderStyle
                BackColor="#24405c"
                Font-Bold="True"
                ForeColor="White"
            />

            <PagerStyle
                BackColor="#24405c"
                ForeColor="White"
                HorizontalAlign="Center"
            />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSourceUnsoldDvds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
        SelectCommand="select DVDTitle.DTitle, Loan.DateOut from Loan inner join DVDCopy on Loan.CopyNumber = DVDCopy.CopyNumber inner join DVDTitle on DVDCopy.DVDNumber = DVDTitle.DVDNumber where DateOut &gt; GETDATE() - 31;
"></asp:SqlDataSource>
</asp:Content>
