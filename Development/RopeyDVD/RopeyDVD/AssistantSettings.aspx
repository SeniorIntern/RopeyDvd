<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AssistantSettings.aspx.cs" Inherits="RopeyDVD.AssistantSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <style>
         .defineborder{
            width:60%;
            border: 3px solid black;
            border-radius:1rem;
            margin: 40px auto 40px auto;
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

     <div class="defineborder">
    <h1  style="text-align:center">Change Password</h1>
        <p  style="text-align:center"> 
            <asp:TextBox ID="userNewPasswordTextBox" runat="server" class="tbw" placeholder="Password" ></asp:TextBox>
        </p>
        <p  style="text-align:center"> 
            <asp:TextBox ID="confirmPasswordTextBox" runat="server" class="tbw" placeholder="Confirm Paasword" ></asp:TextBox>
        </p>
         <p  style="text-align:center"> 
        
        <asp:Button ID="btnChangePassword" runat="server" BackColor="#1877F2" CssClass="btnA" Text="Change Password" Width="249px" OnClick="btnChangePassword_Click" Font-Bold="True" ForeColor="White"  />


             </p>
         <p  style="text-align:center"> 
        
    <asp:Label ID="successfulLabel" runat="server" style="color:red"></asp:Label>
           

             </p>
         <p  style="text-align:center"> 
        
             &nbsp;</p>
         <p  style="text-align:center">&nbsp;</p>
         </div>
         
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
         
</asp:Content>
