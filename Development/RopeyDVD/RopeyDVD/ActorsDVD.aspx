<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ActorsDVD.aspx.cs" Inherits="RopeyDVD.ActorsDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <div style="background-color: #ffffff; font-family: 'JetBrains Mono'; display: flex; flex-direction: column; margin:0 auto 0 auto">
        <h1 style="text-align:center">Select Actor' lastname to see the titles of DVDs</h1>
        <asp:TextBox ID="TextBoxActorSurname1" runat="server" CssClass="tb" placeholder="Actor' Surname"></asp:TextBox>
        <asp:DropDownList 
            ID="DropDownActorSurname1" 
            runat="server" 
            AutoPostBack="True" 
            class="tb"
            DataSourceID="SqlDataSourceSurname" 
            DataTextField="ActorSurname" 
            DataValueField="ActorSurname" 
            OnSelectedIndexChanged="DropDownActorSurname1_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <div style="text-align:center">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxActorSurname1" ErrorMessage="Input valid Actor Surname." Font-Bold="True" ForeColor="Red" ValidationExpression=" [a-zA-Z][a-zA-Z0-9-_]{4,24}"></asp:RegularExpressionValidator>
        </div>
        <br />
        <asp:Button ID="ButtonSearchDvd" runat="server" OnClick="ButtonSearchDvd_Click" Text="Search" CssClass="btn" style="background-color:#1877F2; color:white; max-width:fit-content; margin:auto"/>

        <asp:SqlDataSource ID="SqlDataSourceSurname" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="SELECT [ActorSurname] FROM [Actor]">
        </asp:SqlDataSource>

        <asp:SqlDataSource 
            ID="SqlDataSourceDefault" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="select Distinct
            DVDTitle.DVDNumber,
            DVDTitle.DTitle,
            DVDTitle.DateReleased
            from DVDTitle
            inner join CASTMEMBER ON DVDTitle.DVDNumber = CastMember.DVDNumber
            inner join Actor ON CastMember.ActorNumber= Actor.ActorNumber
            where Actor.ActorSurname =@name">
            <SelectParameters>
                <asp:ControlParameter 
                    ControlID="TextBoxActorSurname1" 
                    Name="name" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource 
            ID="SqlDataSourceFindDvd" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="select Distinct
            DVDTitle.DVDNumber,
            DVDTitle.DTitle,
            DVDTitle.DateReleased
            from DVDTitle
            inner join CASTMEMBER ON DVDTitle.DVDNumber = CastMember.DVDNumber
            inner join Actor ON CastMember.ActorNumber= Actor.ActorNumber
            where Actor.ActorSurname = @name">

            <SelectParameters>
                <asp:ControlParameter 
                    ControlID="DropDownActorSurname1" 
                    Name="name" 
                    PropertyName="SelectedValue" DefaultValue="NULL" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Label ID="Label1" runat="server" Text="Label"><h3 style="text-align:center">DVDs Titles:</h3></asp:Label>
        <div style="margin:0 auto 8% auto">
            <asp:GridView 
                ID="GridViewListDvd" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceDefault" DataKeyNames="DVDNumber">
                <Columns>
                    <asp:BoundField 
                        DataField="DVDNumber" 
                        HeaderText="DVDNumber" 
                        SortExpression="DVDNumber" ReadOnly="True" />
                    <asp:BoundField DataField="DTitle" HeaderText="DTitle" SortExpression="DTitle" />
                    <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
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
    </div>
</asp:Content>
