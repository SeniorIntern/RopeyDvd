<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberDvds.aspx.cs" Inherits="RopeyDVD.MemberDvds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 style="text-align:center">Members with DVDs Details:</h1>
        <div style="margin-left: 15%">
            <asp:GridView ID="GridViewMembersDvd" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMembersDvd" DataKeyNames="MemberNumber">
                <Columns>
                    <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" SortExpression="MemberNumber" ReadOnly="True" />
                    <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" ReadOnly="True" />
                    <asp:BoundField DataField="MembershipCategoryDescription" HeaderText="MembershipCategoryDescription" SortExpression="MembershipCategoryDescription" />
                    <asp:BoundField DataField="MembershipCategoryAllowedLoans" HeaderText="MembershipCategoryAllowedLoans" SortExpression="MembershipCategoryAllowedLoans" />
                    <asp:BoundField DataField="TotalLoan" HeaderText="TotalLoan" ReadOnly="True" SortExpression="TotalLoan" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" ReadOnly="True" SortExpression="Remarks" />
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
            <asp:SqlDataSource 
                ID="SqlDataSourceMembersDvd" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="select Member.MemberNumber ,
                Member.MemberFirstName,
                (SELECT DATEDIFF(year, MemberDateOfBirth, GETDATE()) AS  age) as Age,
                MembershipCategory.MembershipCategoryDescription,
                MembershipCategory.MembershipCategoryAllowedLoans,
                x.TotalLoan,
                Case when (x.TotalLoan&gt;=MembershipCategory.MembershipCategoryAllowedLoans) then 'too many dvd' else 'ok' end as Remarks
                from Member
                join MembershipCategory on Member.MembershipCategoryNumber = MembershipCategory.MembershipCategoryNumber
                left join
                (select loan.MemberNumber, count(loan.membernumber) as TotalLoan
                from Loan where loan.DateReturned is null
                group by Loan.MemberNumber) as x
                on Member.MemberNumber = x.MemberNumber">
            </asp:SqlDataSource>
    </div>
</asp:Content>
