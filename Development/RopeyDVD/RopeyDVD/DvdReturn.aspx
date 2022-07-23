<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DvdReturn.aspx.cs" Inherits="RopeyDVD.DvdReturn" %>
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

        .row{
            display:flex;
            flex-direction: row;
        }

        .tbW{
            width:200px;
            height:20px;
            border-radius:1rem;
            margin:auto;
            text-align:center;
            margin-bottom: 10px;
        }

        .btnA{
            width:200px;
            height:40px;
            border-radius:1rem;
            text-align:center;
            margin:0 auto 0 auto;
        }

    </style>

    <div class="contentB">
        <h1  style="text-align:center">Return Loan</h1>
        <p  style="text-align:center">
            <asp:DropDownList ID="DropDownListCopyNumber" CssClass="tbW" runat="server" Height="31px" Width="240px" DataSourceID="SqlDataSource1" DataTextField="CopyNumber" DataValueField="CopyNumber" OnSelectedIndexChanged="DropDownListCopyNumber_SelectedIndexChanged">
            </asp:DropDownList>
        </p>
        <p  style="text-align:center">
            <asp:Button ID="btnReturnLoan" runat="server" class="BtnA" BackColor="#1877F2" Text="Return DVD Copy" Width="249px" OnClick="btnReturnLoan_Click"  />
        </p>
        <asp:GridView ID="GridViewLoan" runat="server" HorizontalAlign="Center" OnLoad="GridViewLoan_Load">
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
        SelectCommand="SELECT * FROM [Loan] WHERE ([DateReturned] IS NULL)">
    </asp:SqlDataSource>

</asp:Content>
