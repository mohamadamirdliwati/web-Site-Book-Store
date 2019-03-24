<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Nationalities.ascx.cs" Inherits="admin_controles_Authors" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="NationalityID" 
    DataSourceID="odsHeader" 
    onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="NationalityID" HeaderText="Nationality ID" ReadOnly="True" 
            SortExpression="NationalityID" InsertVisible="False" />
        <asp:BoundField DataField="NationalityName" HeaderText="Nationality Name" 
            SortExpression="NationalityName" />
    </Columns>
</asp:GridView>

<asp:ObjectDataSource ID="odsHeader" runat="server" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.NationalitiesTableAdapter">
</asp:ObjectDataSource>

<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="NationalityID" DataSourceID="odsDetails" DefaultMode="Insert" 
    oniteminserted="DetailsView1_ItemInserted" 
    onitemupdated="DetailsView1_ItemUpdated" 
    onitemdeleted="DetailsView1_ItemDeleted">
    <Fields>
        <asp:BoundField DataField="NationalityID" HeaderText="Nationality ID" 
            InsertVisible="False" ReadOnly="True" SortExpression="NationalityID" />
        <asp:BoundField DataField="NationalityName" HeaderText="Nationality Name" 
            SortExpression="NationalityName" />
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
    SelectMethod="GetDataByNationalityID" 
    TypeName="AWPDataSetTableAdapters.NationalitiesTableAdapter" 
    UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_NationalityID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="NationalityName" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="NationalityID" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="NationalityName" Type="String" />
        <asp:Parameter Name="Original_NationalityID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>


