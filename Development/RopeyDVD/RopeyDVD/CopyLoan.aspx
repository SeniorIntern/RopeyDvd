<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CopyLoan.aspx.cs" Inherits="RopeyDVD.CopyLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .contentB{
            border: 3px solid black;
            border-radius:1rem;
            margin:auto;
            text-align:center;
        }

        .tbW{
            width:200px;
            height:20px;
            border-radius:1rem;
            margin:auto;
            text-align:center;
            margin-top:30px;
        }
        .btnA{
            width:200px;
            height:40px;
            border-radius:1rem;
            text-align:center;
            margin-top:30px;
            margin-bottom:30px;
        }

    </style>
    <div style="margin:40px 10% auto 10%" class="contentB">
        <div>
            <h1>Select or Enter Copy Number</h1>
            <asp:TextBox ID="TextBoxCopyNo" class="tbW" runat="server" placeholder="Copy Number"></asp:TextBox>
            <asp:DropDownList ID="DropDownCopyNo" class="tbW" runat="server" DataSourceID="SqlDataSourceCopyNo" DataTextField="CopyNumber" DataValueField="CopyNumber" OnSelectedIndexChanged="DropDownCopyNo_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource 
                ID="SqlDataSourceLoanHistory1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT TOP 1 Loan.LoanNumber, Loan.CopyNumber, Loan.DateOut, Loan.DateDue, Loan.DateReturned, Member.MemberFirstName, Member.MemberLastName
                FROM Loan 
                inner join Member on Member.MemberNumber = Loan.MemberNumber 
                inner join DVDCopy on DVDCopy.CopyNumber = Loan.CopyNumber
                inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
                where Loan.CopyNumber = @name
                order by Loan.DateOut Desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxCopyNo" Name="name" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
            <asp:SqlDataSource ID="SqlDataSourceLoanHistory2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" SelectCommand="SELECT TOP 1 Loan.LoanNumber, Loan.CopyNumber, Loan.DateOut, Loan.DateDue, Loan.DateReturned, Member.MemberFirstName, Member.MemberLastName
                FROM Loan 
                inner join Member on Member.MemberNumber = Loan.MemberNumber 
                inner join DVDCopy on DVDCopy.CopyNumber = Loan.CopyNumber
                inner join DVDTitle on DVDTitle.DVDNumber = DVDCopy.DVDNumber
                where Loan.CopyNumber = @name
                order by Loan.DateOut Desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownCopyNo" Name="name" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource 
                ID="SqlDataSourceCopyNo" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT [CopyNumber] FROM [DVDCopy]">
            </asp:SqlDataSource>
        </div>
        <div style="margin:0 auto 20% auto">
            <asp:Button ID="BtnLoanCopy" runat="server" CssClass="btnA" Text="Search" OnClick="BtnLoanCopy_Click" />
            <asp:GridView ID="GridViewLoanCopy" runat="server">
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
    </div>
</asp:Content>
