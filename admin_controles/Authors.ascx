<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Authors.ascx.cs" Inherits="admin_controles_Authors" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AuthorID" 
    DataSourceID="odsHeader" 
    onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="AuthorID" HeaderText="Author ID" ReadOnly="True" 
            SortExpression="AuthorID" />
        <asp:BoundField DataField="AuthorName" HeaderText="Name" 
            SortExpression="AuthorName" />
        <asp:BoundField DataField="AuthorDescription" HeaderText="Description" 
            SortExpression="AuthorDescription" />
        <asp:BoundField DataField="NationalityName" HeaderText="Nationality" 
            SortExpression="NationalityName" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsHeader" runat="server" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetData" 
    TypeName="AWPDataSetTableAdapters.Authors_VTableAdapter">
</asp:ObjectDataSource>

<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="AuthorID" DataSourceID="odsDetail" DefaultMode="Insert" 
    OnItemInserted="DetailsView1_ItemInserted" 
    OnItemUpdated="DetailsView1_ItemUpdated" 
    OnItemDeleted="DetailsView1_ItemDeleted">
    <Fields>
        <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" 
            InsertVisible="False" ReadOnly="True" SortExpression="AuthorID" />
        <asp:TemplateField HeaderText="Name" SortExpression="AuthorName">
            <ItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AuthorName") %>'></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rqAuthorName" ControlToValidate="TextBox1" ErrorMessage="*" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nationality" SortExpression="NationalityID">
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="odsNationality" DataTextField="NationalityName" 
                    DataValueField="NationalityID" SelectedValue='<%# Bind("NationalityID") %>'>
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsNationality" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="AWPDataSetTableAdapters.NationalitiesTableAdapter">
                </asp:ObjectDataSource>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="AuthorDescription" HeaderText="Description" 
            SortExpression="AuthorDescription" />
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
<asp:ObjectDataSource ID="odsDetail" runat="server" DeleteMethod="Delete" 
    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetDataByAuthorID" 
    TypeName="AWPDataSetTableAdapters.AuthorsTableAdapter" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_AuthorID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AuthorName" Type="String" />
        <asp:Parameter Name="NationalityID" Type="Int32" />
        <asp:Parameter Name="AuthorDescription" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="AuthorID" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="AuthorName" Type="String" />
        <asp:Parameter Name="NationalityID" Type="Int32" />
        <asp:Parameter Name="AuthorDescription" Type="String" />
        <asp:Parameter Name="Original_AuthorID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
