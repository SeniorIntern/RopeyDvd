<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EntryDvd.aspx.cs" Inherits="RopeyDVD.EntryDvd" %>
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
    <div style="display:flex; flex-direction:row" class="contentB">
        <div style="margin: 40px auto auto auto; display:flex; flex-direction:column">
            <h1 style="text-align:center">Add New Dvd</h1>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dvdTitleTB" ErrorMessage="DVD title cannot be empty" ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="dvdTitleTB" Placeholder="DVD Title" runat="server" class="tbW"></asp:TextBox>
        
            <asp:TextBox ID="dvdNumTB" PlaceHolder="DVD Number" runat="server" class="tbW"></asp:TextBox>
        
            <asp:DropDownList ID="catDD" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDescription" DataValueField="CategoryNumber"  class="tbW">
            </asp:DropDownList>
  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" SelectCommand="SELECT * FROM [DVDCategory]"></asp:SqlDataSource>
        
            <asp:DropDownList ID="studioDD" runat="server" DataSourceID="SqlDataSource3" DataTextField="StudioName" DataValueField="StudioNumber"  class="tbW">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" SelectCommand="SELECT * FROM [Studio]"></asp:SqlDataSource>

            <asp:DropDownList ID="producerDD" runat="server" DataSourceID="SqlDataSource2" DataTextField="ProducerName" DataValueField="ProducerNumber" class="tbW">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dateReleaseB" ErrorMessage="This field cannot be empty!!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <asp:TextBox ID="dateReleaseB" PlaceHolder="DateRelease" runat="server" class="tbW"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="standardChargeB" ErrorMessage="This field cannot be empty!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="standardChargeB" Placeholder="Standed Charge" runat="server" class="tbW"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="penaltyChargeB" ErrorMessage="This field cannot be empty!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="penaltyChargeB" Placeholder="Panelty Charge" runat="server" class="tbW"></asp:TextBox>           
            <asp:Button ID="addDVDB" BackColor="#1877F2" runat="server" OnClick="addDVDB_Click" class="btnA" Text="Add DVD" />
        </div>  
        
        <div style="margin: 40px auto auto auto; display:flex; flex-direction:column">
            <asp:Panel ID="castPanel" runat="server" Height="211px" Visible="False" Width="424px">
                Select  DVD Number:
                <asp:DropDownList ID="dvdNoDD" class="tbW" runat="server" datasourceid="SqlDataSource4" DataTextField="DvdNumber" DataValueField="DvdNumber">
                </asp:DropDownList>
                <asp:Label ID="LabelRecDvdNo" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" SelectCommand="SELECT * FROM [DVDTitle]"></asp:SqlDataSource>
            
                Select Actor Name:
                <asp:DropDownList ID="actordd" class="tbW" runat="server" datasourceid="SqlDataSource5" DataTextField="ActorNumber" DataValueField="ActorNumber">
                </asp:DropDownList>
                <asp:Label ID="LabelRecActorNo" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" SelectCommand="SELECT * FROM [actor]"></asp:SqlDataSource>          
                <asp:Button ID="castMemberB" BackColor="#1877F2" class="btnA" runat="server" Text="Add to CastMember" OnClick="castMemberB_Click" />
            </asp:Panel>
        </div>
    </div>
</asp:Content>
