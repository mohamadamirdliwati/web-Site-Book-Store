<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBasket.ascx.cs" Inherits="Controls_ctlBasket" %>

    Items Count: <asp:Label runat="server" ID="lblCount" Font-Bold="true" />, 
    Total Price: <asp:Label runat="server" ID="lblPrice" Font-Bold="true" />
    &nbsp;
    <asp:LinkButton runat="server" ID="btnCommit" Text="Submit" onclick="btnCommit_Click" />

    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" width="100%"
        DataKeyNames="BookID" onrowdeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="" SortExpression="BookTitle">
                <ItemTemplate>
                    <asp:HyperLink ID="lnkView" runat="server" ImageUrl='<%# Eval("BookID", clsGlobal.BookCoverURL) %>' NavigateUrl='<%# Eval("BookID","~/Book.aspx?bid={0}") %>' />
                </ItemTemplate>
                <ItemStyle CssClass="BookThumbnail" />
            </asp:TemplateField>
            <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" 
                ReadOnly="True" SortExpression="BookID" Visible="False" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="CategoryName" HeaderText="Category" 
                SortExpression="CategoryID" />
            <asp:BoundField DataField="BookTitle" HeaderText="Title" 
                SortExpression="BookTitle" />
            <asp:BoundField DataField="Abstract" HeaderText="Abstract" 
                SortExpression="Abstract" Visible="False" />
            <asp:BoundField DataField="PublisherName" HeaderText="Publisher" 
                SortExpression="PublisherID" />
            <asp:BoundField DataField="PublishDate" HeaderText="Publish Date" DataFormatString="{0:dd-MM-yyyy}"
                SortExpression="PublishDate" />
            <asp:BoundField DataField="BookPrice" HeaderText="Price" DataFormatString="{0:c}"
                SortExpression="BookPrice" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                        OnClientClick="return confirm('Are you sure?');"
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            The basket is empty
        </EmptyDataTemplate>
    </asp:GridView>