<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookEdit.ascx.cs" Inherits="admin_controles_BookEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="BookAuthors.ascx" tagname="BookAuthors" tagprefix="uc2" %>

<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="BookID" DataSourceID="odsBook" DefaultMode="Edit" 
    onitemupdating="DetailsView1_ItemUpdating">
    <Fields>
        <asp:BoundField DataField="BookID" HeaderText="Book ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="BookID" />
        <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="*"></asp:RequiredFieldValidator>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="odsCategories" DataTextField="CategoryName" 
                    DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'>
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsCategories" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="AWPDataSetTableAdapters.CategoriesTableAdapter">
                </asp:ObjectDataSource>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Title" SortExpression="BookTitle">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("BookTitle") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Abstract" SortExpression="Abstract">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Rows="5" Columns="50" Text='<%# Bind("Abstract") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Publisher" SortExpression="PublisherID">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="odsPublishers" DataTextField="PublisherName" 
                    DataValueField="PublisherID" SelectedValue='<%# Bind("PublisherID") %>'>
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsPublishers" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="AWPDataSetTableAdapters.PublishersTableAdapter">
                </asp:ObjectDataSource>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Publish Date" SortExpression="PublishDate">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PublishDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                <asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" FirstDayOfWeek="Saturday" 
                    PopupPosition="Left" 
                    Enabled="True" TargetControlID="TextBox4" Format="dd-MM-yyyy">
                </asp:CalendarExtender>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Cover">
            <EditItemTemplate>
                <asp:Image runat="server" ID="imgCover" 
                ImageUrl='<%# Eval("BookID", clsGlobal.BookCoverURL) %>' Width="300" />
                <br />
                <asp:FileUpload runat="server" ID="fileCover" /><br />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="BookPrice" HeaderText="Price" DataFormatString="{0:0.00}" ApplyFormatInEditMode="true"
            SortExpression="BookPrice" />

        <asp:TemplateField HeaderText="Book Authors" InsertVisible="false">
            <ItemTemplate>
                <uc2:BookAuthors ID="BookAuthors1" runat="server" />
            </ItemTemplate>
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
<asp:ObjectDataSource ID="odsBook" runat="server" DeleteMethod="SP_DE_Book" 
    InsertMethod="GetDataBySP_IN_Book" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetDataByBookID" 
    TypeName="AWPDataSetTableAdapters.BooksTableAdapter" UpdateMethod="SP_UP_Book" 
    oninserted="odsBook_Inserted">
    <DeleteParameters>
        <asp:Parameter Name="Original_BookID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ISBN" Type="String" />
        <asp:Parameter Name="BookTitle" Type="String" />
        <asp:Parameter Name="Abstract" Type="String" />
        <asp:Parameter Name="PublisherID" Type="Int32" />
        <asp:Parameter Name="PublishDate" Type="DateTime" />
        <asp:Parameter Name="BookPrice" Type="Decimal" />
        <asp:Parameter Name="CategoryID" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="BookID" QueryStringField="BookID" 
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ISBN" Type="String" />
        <asp:Parameter Name="BookTitle" Type="String" />
        <asp:Parameter Name="Abstract" Type="String" />
        <asp:Parameter Name="PublisherID" Type="Int32" />
        <asp:Parameter Name="PublishDate" Type="DateTime" />
        <asp:Parameter Name="BookPrice" Type="Decimal" />
        <asp:Parameter Name="CategoryID" Type="Int32" />
        <asp:Parameter Name="Original_BookID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
