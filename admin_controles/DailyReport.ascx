<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DailyReport.ascx.cs" Inherits="admin_controles_DailyReport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

Sale Date:
<asp:TextBox runat="server" ID="txtFromDate" Width="80px" />
<asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" FirstDayOfWeek="Saturday" 
    PopupPosition="Left" 
    Enabled="True" TargetControlID="txtFromDate" Format="dd-MM-yyyy">
</asp:CalendarExtender>
To
<asp:TextBox runat="server" ID="txtToDate" Width="80px" /> 
<asp:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" FirstDayOfWeek="Saturday" 
    PopupPosition="Left" 
    Enabled="True" TargetControlID="txtToDate" Format="dd-MM-yyyy">
</asp:CalendarExtender>
<asp:LinkButton runat="server" ID="lnkSearch" Text="Search" />
<br /><br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" ShowFooter="True"
    AllowSorting="True" AutoGenerateColumns="False" 
    DataSourceID="odsReport" ondatabound="GridView1_DataBound">
    <Columns>
        <asp:BoundField DataField="SaleDate" HeaderText="Sale Date" DataFormatString="{0:dd-MM-yyyy}"
            SortExpression="SaleDate" FooterText="Total" />
        <asp:BoundField DataField="SalesCount" HeaderText="Items Count" ItemStyle-HorizontalAlign="Center"
            SortExpression="SalesCount" FooterStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="TotalSales" HeaderText="Total Sales" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" 
            DataFormatString="{0:c}" SortExpression="TotalSales" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsReport" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySaleDate" 
    TypeName="AWPDataSetTableAdapters.DailySalesTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtFromDate" Name="FromDate"
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtToDate" Name="ToDate" PropertyName="Text" 
            Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

