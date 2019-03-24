<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlAuthors.ascx.cs" Inherits="Controls_ctlAuthors" %>
<asp:DataList runat="server" ID="lstLetters" DataSourceID="sqlLetters" 
    DataKeyField ="KeyLetter" CellPadding="6"
RepeatColumns="15" RepeatDirection="Horizontal" onselectedindexchanged="lstLetters_SelectedIndexChanged">
    <ItemTemplate>
        <asp:LinkButton CommandName="Select" ID="LetterLabel" runat="server" Text='<%# Eval("DisplayLetter") %>' />
    </ItemTemplate>
    <SelectedItemTemplate>
        <b><%# Eval("DisplayLetter") %></b>
    </SelectedItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="sqlLetters" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
    SelectCommand="select 'All' as DisplayLetter, '%' as KeyLetter union all select letter, letter from (SELECT DISTINCT UPPER(SUBSTRING(AuthorName, 1, 1)) AS Letter FROM Authors) as t">
</asp:SqlDataSource>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    AllowSorting="True" AllowPaging="True"
    DataKeyNames="AuthorID" DataSourceID="odsAuthors">
    <Columns>
        <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" 
            ReadOnly="True" SortExpression="AuthorID" />
        <asp:BoundField DataField="AuthorName" HeaderText="Author Name" 
            SortExpression="AuthorName" />
        <asp:BoundField DataField="NationalityName" HeaderText="Nationality" 
            SortExpression="NationalityName" />
        <asp:BoundField DataField="AuthorDescription" HeaderText="Description" 
            SortExpression="AuthorDescription" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsAuthors" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.Authors_VTableAdapter" 
    FilterExpression="AuthorName like '{0}%'">
    <FilterParameters>
        <asp:ControlParameter ControlID="lstLetters" Name="FirstLetter" 
            PropertyName="SelectedValue" Size="1" Type="String" />
    </FilterParameters>
</asp:ObjectDataSource>