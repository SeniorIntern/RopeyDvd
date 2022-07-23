<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="RopeyDVD.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <div style="width: 300px; height: fit-content; display: flex; flex-direction: column; border-radius: 1rem; box-shadow: 0 0 20px rgb(207, 207, 207); padding: 10px; background-color: #ffffff;  text-align: center; font-family: 'JetBrains Mono'; font-size: medium; margin: 40px auto 20px auto">
        <%--margin:10% auto 20% auto;--%>
        <img style="width:110px; margin:auto" src="/images/avatar.png" alt="avatar" />
        <p><b>User Login</b></p>
        <hr width="100%"/>
        <br />
        <div style="display: flex; flex-direction: column;">
            <asp:TextBox ID="TbUserLoginId" placeholder="User ID" runat="server" class="tb" CssClass="tb"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TbUserLoginId" ErrorMessage="User Id Field can't be empty" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TbUserLoginPasswd" ErrorMessage="Password Field can't be empty" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TbUserLoginPasswd" placeholder="Password" TextMode="Password" runat="server" class="tb" CssClass="tb"></asp:TextBox>
            <asp:Button ID="BtnLogin" 
                runat="server" 
                Text="Login" 
                style="background-color:#1877F2;" 
                OnClick="BtnLogin_Click" 
                CssClass="btn"/>
        </div>
    </div>
</asp:Content>
