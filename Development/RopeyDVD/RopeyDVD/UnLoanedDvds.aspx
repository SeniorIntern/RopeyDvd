<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UnLoanedDvds.aspx.cs" Inherits="RopeyDVD.UnLoanedDvds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1 style="text-align:center">DVDs not Loaned Over a Year:</h1>
    <div>
        <div style="margin-left:30%">
            <asp:GridView ID="GridViewUnloanedDvds" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUnloanedDvds">
                <Columns>
                    <asp:BoundField DataField="copynumber" HeaderText="copynumber" SortExpression="copynumber" />
                    <asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" SortExpression="DVDNumber" />
                    <asp:BoundField DataField="DatePurchased" HeaderText="DatePurchased" SortExpression="DatePurchased" />
            
                    <%--designing edit and delete option-buttons--%>
                    <%--asp:CommandField 
                    ButtonType="Image" 
                    CancelImageUrl="~/images/cancel.png" 
                    DeleteImageUrl="~/images/delete.png" 
                    EditImageUrl="~/images/edit.png" 
                    ShowEditButton="True" 
                    UpdateImageUrl="~/images/save.png">
                        <ControlStyle 
                        Height="25px" 
                        Width="25px" />
                    </asp:CommandField>--%>
                    <asp:CommandField 
                    ButtonType="Image" 
                    CancelImageUrl="~/images/cancel.png" 
                    DeleteImageUrl="~/images/delete.png" 
                    EditImageUrl="~/images/cancel.png" 
                    ShowDeleteButton="True" 
                    UpdateImageUrl="~/images/save.png">
                        <ControlStyle 
                        Height="25px" 
                        Width="25px" />
                    </asp:CommandField>
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
            ID="SqlDataSourceUnloanedDvds" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RopeyDatabaseConnectionString %>" 
            SelectCommand="SELECT l.copynumber, DVDNumber, DatePurchased FROM DVDCopy dc, Loan l WHERE dc.CopyNumber=l.CopyNumber AND dc.DatePurchased > GETDATE()-365 AND l.DateDue >= l.DateReturned"
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [Loan] WHERE [CopyNumber] = @original_CopyNumber; DELETE FROM [DvdCopy] WHERE [CopyNumber] = @original_CopyNumber;" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_CopyNumber" Type="String" />
                <asp:Parameter Name="original_DvdNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DatePurchased" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
