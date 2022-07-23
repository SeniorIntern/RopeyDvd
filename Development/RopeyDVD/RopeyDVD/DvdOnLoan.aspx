<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DvdOnLoan.aspx.cs" Inherits="RopeyDVD.DvdOnLoan" %>
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
    <div>
        <h1>Choose member to view list of DVDs on Loan</h1>
        <div>
            <asp:TextBox ID="TextBoxMemberSurname" CssClass="tbW" runat="server" placeholder="Member Id" ></asp:TextBox>
            <asp:DropDownList 
                ID="DropDownMemberSurname" 
                Class="tbW"
                runat="server" 
                DataSourceID="SqlDataSourceMemberSurname" 
                DataTextField="MemberLastName" 
                DataValueField="MemberLastName" OnSelectedIndexChanged="DropDownMemberSurname_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource 
                ID="SqlDataSourceMemberSurname" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT [MemberLastName] FROM [Member]">
            </asp:SqlDataSource>
            <br />
            
            <asp:SqlDataSource 
                ID="SqlDataSourceFindCopies" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT Member.MemberNumber, (Member.MemberFirstName + '' + Member.MemberLastName) as MemberName, DVDTitle.DTitle, DVDCopy.CopyNumber, Loan.DateOut 
                FROM Loan 
                inner join Member on Loan.MemberNumber = Member.MemberNumber 
                inner join DVDCopy ON Loan.CopyNumber = DVDCopy.CopyNumber 
                inner join DVDTitle on DVDCopy.DVDNumber = DVDTitle.DVDNumber 
                WHERE Member.MemberNumber = @name and Loan.DateOut &gt;= GETDATE()-31;">
                <SelectParameters>
                    <asp:ControlParameter 
                        ControlID="TextBoxMemberSurname" 
                        DefaultValue="" 
                        Name="name" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            
            <asp:SqlDataSource 
                ID="SqlDataSourceFindCopies2" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT Member.MemberNumber, (Member.MemberFirstName + '' + Member.MemberLastName) as MemberName, DVDTitle.DTitle, DVDCopy.CopyNumber, Loan.DateOut 
                FROM Loan 
                inner join Member on Loan.MemberNumber = Member.MemberNumber 
                inner join DVDCopy ON Loan.CopyNumber = DVDCopy.CopyNumber 
                inner join DVDTitle on DVDCopy.DVDNumber = DVDTitle.DVDNumber 
                WHERE Member.MemberLastName = @name and Loan.DateOut &gt;= GETDATE()-31;">
                <SelectParameters>
                    <asp:ControlParameter 
                        ControlID="DropDownMemberSurname" 
                        Name="name" 
                        PropertyName="SelectedValue"/>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <asp:Button ID="BtnSearchLoanDvd" class="btn" runat="server" Text="Search" OnClick="BtnSearchLoanDvd_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label">DVDs List:</asp:Label>
        <div style="margin:0 auto 8% auto">
            <asp:GridView ID="GridViewDvdOnLoan" runat="server"></asp:GridView>
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
        </div>
    </div>
</asp:Content>
