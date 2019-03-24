<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Categories.ascx.cs" Inherits="admin_controles_Authors" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryID" 
    DataSourceID="odsHeader" 
    onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="CategoryID" HeaderText="Category ID" ReadOnly="True" 
            SortExpression="CategoryID" InsertVisible="False" />
        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" 
            SortExpression="CategoryName" />
    </Columns>
</asp:GridView>

<asp:ObjectDataSource ID="odsHeader" runat="server" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.CategoriesTableAdapter">
</asp:ObjectDataSource>

<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="CategoryID" DataSourceID="odsDetails" DefaultMode="Insert" 
    oniteminserted="DetailsView1_ItemInserted" 
    onitemupdated="DetailsView1_ItemUpdated" 
    onitemdeleted="DetailsView1_ItemDeleted">
    <Fields>
        <asp:BoundField DataField="CategoryID" HeaderText="Category ID" 
            InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" 
            SortExpression="CategoryName" />
        <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="CommandField">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New"></asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
<asp:ObjectDataSource ID="odsDetails" runat="server" DeleteMethod="Delete" 
    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetDataByCategoryID" 
    TypeName="AWPDataSetTableAdapters.CategoriesTableAdapter" 
    UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_CategoryID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CategoryName" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="CategoryID" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="Original_CategoryID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>


