<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewDvd.aspx.cs" Inherits="RopeyDVD.NewDvd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">Add New Dvd</h1>
<asp:Label ID="Label4" runat="server" Text="DVD Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dvdTitleTB" ErrorMessage="DVD title cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="dvdTitleTB" Placeholder="DVD Title" runat="server" Width="372px"></asp:TextBox>
    <br />
    <br />
    <asp:DropDownList ID="catDD" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDescription" DataValueField="CategoryNumber" Height="22px" Width="185px">
    </asp:DropDownList>
&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="DVD Category"></asp:Label>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DVDStoreConnectionString2 %>" SelectCommand="SELECT * FROM [DVDCategory]"></asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="studioDD" runat="server" DataSourceID="SqlDataSource3" DataTextField="StudioName" DataValueField="StudioNumber" Height="25px" Width="184px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DVDStoreConnectionString2 %>" SelectCommand="SELECT * FROM [Studio]"></asp:SqlDataSource>
&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Select Studio"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="producerDD" runat="server" DataSourceID="SqlDataSource2" DataTextField="ProducerName" DataValueField="ProducerNumber" Height="21px" Width="184px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DVDStoreConnectionString2 %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Select Producer"></asp:Label>
    <br />
    <br />
    <br />
    &nbsp;
    <asp:Label ID="Label5" runat="server" Text="Date Release"></asp:Label>
&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dateReleaseB" ErrorMessage="This field cannot be empty!!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <asp:TextBox ID="dateReleaseB" PlaceHolder="DateRelease" runat="server" Width="380px"></asp:TextBox>
    <p>
        &nbsp;
        <asp:Label ID="Label6" runat="server" Text="Standard Charge"></asp:Label>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="standardChargeB" ErrorMessage="This field cannot be empty!!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="standardChargeB" Placeholder="Standed Charge" runat="server" Width="375px"></asp:TextBox>
    </p>
    <p>
        &nbsp;
        <asp:Label ID="Label7" runat="server" Text="Penalty Charge"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="penaltyChargeB" ErrorMessage="This field cannot be empty!!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="penaltyChargeB" Placeholder="Panelty Charge" runat="server" Width="380px"></asp:TextBox>
    </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="addDVDB" runat="server" OnClick="addDVDB_Click" Text="Add DVD" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="manageDVDDetailB" runat="server" Text="Manage DVD Detail" />
    <br />
    <br />
    <asp:Panel ID="castPanel" runat="server" Height="211px" Visible="False" Width="424px">
        Select&nbsp; DVD Number:
        <asp:DropDownList ID="dvdNoDD" runat="server" datasourceid="SqlDataSource4" DataTextField="DVDTitle" DataValueField="DVDNumber">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DVDStoreConnectionString2 %>" SelectCommand="SELECT * FROM [DVDDetail]"></asp:SqlDataSource>
        <br />
        Select Actor Name:
        <asp:DropDownList ID="actordd" runat="server" datasourceid="SqlDataSource5" DataTextField="actorFirstName" DataValueField="actor">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DVDStoreConnectionString2 %>" SelectCommand="SELECT * FROM [actor]"></asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="castMemberB" runat="server" OnClick="castMemberB_Click" Text="Cast Member" />
    </asp:Panel>
    <br />
&nbsp;&nbsp;&nbsp;
    <p>
        &nbsp;</p>
</asp:Content>
