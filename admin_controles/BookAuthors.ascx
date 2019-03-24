<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookAuthors.ascx.cs" Inherits="admin_controles_BookAuthors" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BookAuthorID" 
    DataSourceID="odsHeader" Width="100%"
    onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="BookAuthorID" HeaderText="BookAuthorID" ReadOnly="True"  Visible="false"
            SortExpression="BookAuthorID" />
        <asp:BoundField DataField="BookID" HeaderText="BookID"  Visible="false"
            SortExpression="BookID" />
        <asp:BoundField DataField="AuthorID" HeaderText="AuthorID"  Visible="false"
            SortExpression="AuthorID" />
        <asp:BoundField DataField="BookTitle" HeaderText="BookTitle" Visible="false"
            SortExpression="BookTitle" />
        <asp:BoundField DataField="AuthorName" HeaderText="Author Name" 
            SortExpression="AuthorName" />
    </Columns>
</asp:GridView>

<asp:ObjectDataSource ID="odsHeader" runat="server" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetDataByBookID" 
    TypeName="AWPDataSetTableAdapters.BookAuthors_VTableAdapter">
    <SelectParameters>
        <asp:QueryStringParameter Name="BookID" QueryStringField="BookID" 
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>

<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="BookAuthorID" DataSourceID="odsDetails" DefaultMode="Insert" 
    oniteminserted="DetailsView1_ItemInserted" 
    onitemupdated="DetailsView1_ItemUpdated" 
    onitemdeleted="DetailsView1_ItemDeleted">
    <Fields>
        <asp:BoundField DataField="BookAuthorID" HeaderText="BookAuthorID" Visible="false"
            InsertVisible="False" ReadOnly="True" SortExpression="BookAuthorID" />
        <asp:TemplateField HeaderText="Author" SortExpression="AuthorID">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsAuthors" 
                    DataTextField="AuthorName" DataValueField="AuthorID" Width="100%"
                    SelectedValue='<%# Bind("AuthorID") %>'>
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsAuthors" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="AWPDataSetTableAdapters.AuthorsTableAdapter">
                </asp:ObjectDataSource>
            </EditItemTemplate>
        </asp:TemplateField>
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
    SelectMethod="GetDataByBookAuthorID" 
    TypeName="AWPDataSetTableAdapters.BookAuthorsTableAdapter" 
    UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_BookAuthorID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="BookID" Type="Int32" QueryStringField="BookID"/>
        <asp:Parameter Name="AuthorID" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="BookAuthorID" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="BookID" Type="Int32" QueryStringField="BookID"/>
        <asp:Parameter Name="AuthorID" Type="Int32" />
        <asp:Parameter Name="Original_BookAuthorID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>


