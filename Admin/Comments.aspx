<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Admin_Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Comments
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <p>
    </p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BookCommentID" 
        DataSourceID="odsComments" onrowcommand="GridView1_RowCommand">
        <EmptyDataTemplate>
        No new comments.
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="BookTitle" HeaderText="Book Title" 
                SortExpression="BookTitle" />
            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" 
                SortExpression="CustomerName" />
            <asp:BoundField DataField="CommentText" HeaderText="Comment Text" 
                SortExpression="CommentText" />
            <asp:BoundField DataField="CommentDate" HeaderText="Comment Date" DataFormatString="{0:dd-MM-yyyy}"
                SortExpression="CommentDate" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkApprove" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("BookCommentID") %>'
                        OnClientClick="return confirm('Are you sure?');"
                        CommandName="Approve" Text="Approve"></asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lnkReject" runat="server" CausesValidation="False" 
                        OnClientClick="return confirm('Are you sure?');"
                        CommandArgument='<%# Eval("BookCommentID") %>'
                        CommandName="Reject" Text="Reject"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsComments" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNew" 
        TypeName="AWPDataSetTableAdapters.BookComments_VTableAdapter">
    </asp:ObjectDataSource>

</asp:Content>

