<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DvdCopies.aspx.cs" Inherits="RopeyDVD.DvdCopies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 style="text-align:center" >Enter or Select an Actor' Surname</h1>
        <div>
            <asp:TextBox ID="TextBoxActorSurname2" runat="server"  placeholder="Actor' Surname" ></asp:TextBox>
            <asp:DropDownList ID="DropDownActorSurname2" runat="server" 
                DataSourceID="SqlDataSourceActorSurname" 
                DataTextField="ActorSurname" 
                DataValueField="ActorSurname" 
                OnSelectedIndexChanged="DropDownActorSurname2_SelectedIndexChanged" AutoPostBack="True">

            </asp:DropDownList><br />
            <asp:SqlDataSource 
                ID="SqlDataSourceActorSurname" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT [ActorSurname] FROM [Actor]">
            </asp:SqlDataSource>
        </div>

            <asp:Button ID="BtnSearchDvdCopies" runat="server" Text="Search" OnClick="BtnSearchDvdCopies_Click" />
        <div style="margin:0 auto 8% auto">
            <asp:GridView ID="DvdCopiesGridView" runat="server" DataSourceID="SqlDataSourceDvdCopies" AutoGenerateColumns="False" DataKeyNames="DVDNumber,CopyNumber">
                <Columns>
                    <asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" ReadOnly="True" SortExpression="DVDNumber" />
                    <asp:BoundField DataField="DTitle" HeaderText="DTitle" SortExpression="DTitle" />
                    <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
                    <asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" ReadOnly="True" SortExpression="CopyNumber" />
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


            <asp:SqlDataSource 
                ID="SqlDataSourceDvdCopiesS" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT DISTINCT DVDTitle.DVDNumber, DVDTitle.DTitle, DVDTitle.DateReleased, DVDCopy.CopyNumber 
                FROM DVDTitle 
                inner join DVDCopy on DVDTitle.DVDNumber = DVDCopy.DVDNumber 
                inner join CastMember ON DVDTitle.DVDNumber = CastMember.DVDNumber 
                inner JOIN ACTOR ON CastMember.ActorNumber = ACTOR.ActorNumber 
                inner join Loan on DVDCopy.CopyNumber=Loan.CopyNumber 
                WHERE Actor.ActorSurname = @name AND Loan.DateReturned is null;">
                <SelectParameters>
                    <asp:ControlParameter 
                        ControlID="TextBoxActorSurname2" 
                        Name="name" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource 
                ID="SqlDataSourceDvdCopies" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
                SelectCommand="SELECT DISTINCT DVDTitle.DVDNumber, DVDTitle.DTitle, DVDTitle.DateReleased, DVDCopy.CopyNumber 
                FROM DVDTitle 
                inner join DVDCopy on DVDTitle.DVDNumber = DVDCopy.DVDNumber 
                inner join CastMember ON DVDTitle.DVDNumber = CastMember.DVDNumber 
                inner JOIN ACTOR ON CastMember.ActorNumber = ACTOR.ActorNumber 
                inner join Loan on DVDCopy.CopyNumber=Loan.CopyNumber 
                WHERE Actor.ActorSurname = @name AND Loan.DateReturned is null;">
                <SelectParameters>
                    <asp:ControlParameter 
                        ControlID="DropDownActorSurname2" 
                        Name="name" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
