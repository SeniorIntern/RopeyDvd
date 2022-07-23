<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DvdDetails.aspx.cs" Inherits="RopeyDVD.DvdDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:0 auto 0 auto">
    <h1 style="text-align:center; margin:auto; margin-bottom:5%">List of Dvd Titles along with other details</h1>
        <div style="margin:0 auto 8% auto">
            <asp:GridView 
                ID="GridViewDvdDetails" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceToListDvd">
                <Columns>
                    <asp:BoundField DataField="DTitle" HeaderText="DTitle" SortExpression="DTitle" />
                    <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
                    <asp:BoundField DataField="ProducerName" HeaderText="ProducerName" SortExpression="ProducerName" />
                    <asp:BoundField DataField="StudioName" HeaderText="StudioName" SortExpression="StudioName" />
                    <asp:BoundField DataField="Cast" HeaderText="Cast" SortExpression="Cast" ReadOnly="True" />
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
            ID="SqlDataSourceToListDvd" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="SELECT DVDTitle.DTitle, DVDTitle.DateReleased, Producer.ProducerName, Studio.StudioName, string_agg(Actor.ActorSurname, ',') within GROUP(order by Actor.ActorSurname) as Cast 
            FROM DVDTitle 
            inner join Producer on DVDTitle.ProducerNumber = Producer.ProducerNumber 
            inner join Studio on DVDTitle.StudioNumber = Studio.StudioNumber 
            inner join CastMember on DVDTitle.DVDNumber = CASTMEMBER.DVDNumber 
            inner join Actor on CastMember.ActorNumber = Actor.ActorNumber
            Group by DVDTitle.DTitle, DVDTitle.DateReleased, Producer.ProducerName, Studio.StudioName order by DVDTitle.DateReleased">

        </asp:SqlDataSource>
    </div>
</asp:Content>
