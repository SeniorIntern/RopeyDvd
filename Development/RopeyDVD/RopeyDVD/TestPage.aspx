<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="RopeyDVD.TestPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ActorNumber" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ActorNumber" HeaderText="ActorNumber" ReadOnly="True" SortExpression="ActorNumber" />
            <asp:BoundField DataField="ActorSurname" HeaderText="ActorSurname" SortExpression="ActorSurname" />
            <asp:BoundField DataField="ActorFirstname" HeaderText="ActorFirstname" SortExpression="ActorFirstname" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
        DeleteCommand="DELETE FROM [Actor] WHERE [ActorNumber] = @original_ActorNumber AND [ActorSurname] = @original_ActorSurname AND [ActorFirstname] = @original_ActorFirstname" 
        InsertCommand="INSERT INTO [Actor] ([ActorNumber], [ActorSurname], [ActorFirstname]) VALUES (@ActorNumber, @ActorSurname, @ActorFirstname)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Actor]" 
        UpdateCommand="UPDATE [Actor] SET [ActorSurname] = @ActorSurname, [ActorFirstname] = @ActorFirstname WHERE [ActorNumber] = @original_ActorNumber AND [ActorSurname] = @original_ActorSurname AND [ActorFirstname] = @original_ActorFirstname">
        <DeleteParameters>
            <asp:Parameter Name="original_ActorNumber" Type="String" />
            <asp:Parameter Name="original_ActorSurname" Type="String" />
            <asp:Parameter Name="original_ActorFirstname" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ActorNumber" Type="String" />
            <asp:Parameter Name="ActorSurname" Type="String" />
            <asp:Parameter Name="ActorFirstname" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ActorSurname" Type="String" />
            <asp:Parameter Name="ActorFirstname" Type="String" />
            <asp:Parameter Name="original_ActorNumber" Type="String" />
            <asp:Parameter Name="original_ActorSurname" Type="String" />
            <asp:Parameter Name="original_ActorFirstname" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
