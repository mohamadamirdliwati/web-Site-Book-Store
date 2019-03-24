<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Books.ascx.cs" Inherits="admin_controles_Books" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server" ID="pnlSearch" GroupingText="Search" DefaultButton="btnSearch">

<table>
<tr><td>

    Category
    </td>
    <td>
<asp:DropDownList runat="server" ID="lstCategories" 
    DataSourceID="odsCategories" DataTextField="CategoryName" 
    DataValueField="CategoryID" ondatabound="DropDownList_DataBound">
</asp:DropDownList>
<asp:ObjectDataSource ID="odsCategories" runat="server" 
    SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.CategoriesTableAdapter">
</asp:ObjectDataSource>
</td><td>
    Book Title</td>
    <td> <asp:TextBox runat="server" ID="txtBookTitle" /> 
    </td>
</tr>
<tr>
    <td>
    Author</td>
    <td> <asp:DropDownList runat="server" ID="lstAuthors"  
    ondatabound="DropDownList_DataBound" DataSourceID="odsAuthors" 
    DataTextField="AuthorName" DataValueField="AuthorID"/>
    <asp:ObjectDataSource ID="odsAuthors" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.AuthorsTableAdapter">
</asp:ObjectDataSource>
</td>
<td>
    Publisher
    </td>
    <td>
     <asp:DropDownList runat="server" ID="lstPublisher"  
    ondatabound="DropDownList_DataBound" DataSourceID="odsPublisher" 
    DataTextField="PublisherName" DataValueField="PublisherID"/>
    <asp:ObjectDataSource ID="odsPublisher" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.PublishersTableAdapter">
</asp:ObjectDataSource>
    </td>
    </tr>
    <tr><td>
    Publish Date</td>
    <td> <asp:TextBox runat="server" ID="txtFromDate" Width="80px" />
        <asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" FirstDayOfWeek="Saturday" 
            PopupPosition="Left" 
            Enabled="True" TargetControlID="txtFromDate" Format="dd-MM-yyyy">
        </asp:CalendarExtender>

    </td>
    <td>To Date</td>
    <td><asp:TextBox runat="server" ID="txtToDate" Width="80px" /> 
                <asp:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" FirstDayOfWeek="Saturday" 
                    PopupPosition="Left" 
                    Enabled="True" TargetControlID="txtToDate" Format="dd-MM-yyyy">
                </asp:CalendarExtender>
    
    </td>
    </tr>
    </table>
<asp:LinkButton runat="server" ID="btnSearch" Text="Search" onclick="btnSearch_Click" />
&nbsp;
<asp:HyperLink runat="server" ID="btnAddBook" Text="Add Book" NavigateUrl="~/Admin/BookEdit.aspx" Target="_blank"></asp:HyperLink>
</asp:Panel>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="750px"
    DataKeyNames="BookID" DataSourceID="odsBooks" AllowPaging="True" 
    AllowSorting="True">
    <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="BookID" 
            DataNavigateUrlFormatString="~/Admin/BookEdit.aspx?BookID={0}" Target="_blank" 
            Text="Edit" />
        <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" Visible="false" 
            ReadOnly="True" SortExpression="BookID" />
        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
        <asp:BoundField DataField="CategoryName" HeaderText="Category" 
            SortExpression="CategoryID" />
        <asp:BoundField DataField="BookTitle" HeaderText="Title" 
            SortExpression="BookTitle" />
        <asp:BoundField DataField="Abstract" HeaderText="Abstract" 
            SortExpression="Abstract" />
        <asp:BoundField DataField="PublisherName" HeaderText="Publisher" 
            SortExpression="PublisherID" />
        <asp:BoundField DataField="PublishDate" HeaderText="Publish Date" DataFormatString="{0:dd-MM-yyyy}" 
            SortExpression="PublishDate" />
        <asp:BoundField DataField="BookPrice" HeaderText="Price" 
            DataFormatString="{0:c}"  ItemStyle-HorizontalAlign="Right"
            SortExpression="BookPrice" >
<ItemStyle HorizontalAlign="Right"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ReadCount" HeaderText="Read Count" 
            SortExpression="ReadCount" >
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsBooks" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySearch" 
    TypeName="AWPDataSetTableAdapters.Books_VTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBookTitle" Name="BookTitle" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="lstCategories" Name="CategoryID" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="lstPublisher" Name="PublisherID" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="lstAuthors" Name="AuthorID" 
            PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="txtFromDate" Name="FromDate" 
            PropertyName="Text" Type="DateTime" />
        <asp:ControlParameter ControlID="txtToDate" Name="ToDate" PropertyName="Text" 
            Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

