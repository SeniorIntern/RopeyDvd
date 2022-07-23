<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IssueCopy.aspx.cs" Inherits="RopeyDVD.IssueDvd" %>
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
        }
        .btnA{
            width:200px;
            height:40px;
            border-radius:1rem;
            text-align:center;
        }

    </style>
    <div class="contentB">
    <h1  style="text-align:center"> Issue DVD Copy</h1>
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>M01</asp:ListItem>
        </asp:DropDownList>
            <br />
            <asp:TextBox ID="TextBoxDvdNumberrr" runat="server" class="tbW" placeholder="DVD Number" ></asp:TextBox>
        <p>
                                                                                       
        <asp:TextBox ID="dvdTittleTextBox" runat="server" class="tbW" placeholder="DVD Copy" ></asp:TextBox>
        </p>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Check Restriction" class="btnA"  OnClick="Button1_Click" />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Check Loan" class="btnA"  OnClick="Button2_Click" />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" class="tbW" placeholder="Date Out" ></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" class="tbW" placeholder="Date Due" ></asp:TextBox>
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" class="tbW" placeholder="Loan Type" >
            <asp:ListItem>LT01</asp:ListItem>
            <asp:ListItem>LT02</asp:ListItem>
            <asp:ListItem>LT03</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" class="tbW" placeholder="Total Charge" ></asp:TextBox>
        <br />
              <asp:Button ID="Button3" runat="server" class="btnA" Text="Issue Dvd" OnClick="Button3_Click" />                                                                                                  
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
        SelectCommand="SELECT * FROM [DVDCategory]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
        SelectCommand="SELECT * FROM [Producer]">
    </asp:SqlDataSource>

    <p>
        <asp:SqlDataSource 
            ID="SqlDataSource3" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="SELECT * FROM [Studio]">
        </asp:SqlDataSource>

        <br />
    </p>
    <p>
    </p>
    </div>
</asp:Content>
