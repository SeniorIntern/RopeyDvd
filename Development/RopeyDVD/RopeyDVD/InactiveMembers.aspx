<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InactiveMembers.aspx.cs" Inherits="RopeyDVD.InactiveMembers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 style="text-align:center">Inactive Members in the last 31 days</h1>
        <div style="margin-left:30%">
            <asp:GridView ID="GridViewInactiveMember" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceInactiveMember">
                <Columns>
                    <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
                    <asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
                    <asp:BoundField DataField="last Loan" HeaderText="last Loan" ReadOnly="True" SortExpression="last Loan" />
                    <asp:BoundField DataField="InactiveDays" HeaderText="InactiveDays" ReadOnly="True" SortExpression="InactiveDays" />
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
            ID="SqlDataSourceInactiveMember" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="select a.MemberFirstName, a.MemberAddress, a.[last Loan], (select DateDiff(day,a.[last Loan], GETDATE()) as x) as InactiveDays 
            from (select Member.MemberFirstName, Member.MemberAddress, MAX(Loan.DateOut) as [last Loan] 
            from member inner join loan on Loan.MemberNumber = Member.MemberNumber 
            group by Member.MemberFirstName, Member.MemberAddress) as a where a.[last Loan] &lt; GETDATE()-31">
        </asp:SqlDataSource>
    </div>
</asp:Content>
