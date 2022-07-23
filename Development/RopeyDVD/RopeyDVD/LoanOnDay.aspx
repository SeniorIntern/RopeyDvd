<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoanOnDay.aspx.cs" Inherits="RopeyDVD.LoanOnDay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">DVD copies currently on loan</h1>
    <div style="margin-left:30%">
        <asp:GridView 
            ID="GridViewLoanOnDay" 
            runat="server" 
            DataSourceID="SqlDataSourceLoanOnDay">

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
        <asp:SqlDataSource 
            ID="SqlDataSourceLoanOnDay" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="SELECT
            DvdTitle.DTitle, Loan.DateOut,
            DVDCopy.CopyNumber, Member.MemberFirstName
            , x.total

            FROM DvdTitle
            INNER JOIN DVDCopy ON DvdTitle.DVDNumber = DVDCopy.DVDNumber
            left JOIN Loan ON DVDCopy.CopyNumber = Loan.CopyNumber
            left join Member on Loan.MemberNumber = Member.MemberNumber
            inner join (select DateOut, Count(DateOut) as total from Loan group by DateOut) as x on Loan.DateOut = x.DateOut
            where DVDCopy.CopyNumber = Loan.CopyNumber
            and Loan.DateOut is not null
            and Loan.DateReturned is null
            group by DvdTitle.DTitle, Loan.DateOut,
            DVDCopy.CopyNumber,
            Member.MemberFirstName,
            x.total
            order by Loan.DateOut, DvdTitle.DTitle">
        </asp:SqlDataSource>
    </div>
</asp:Content>
