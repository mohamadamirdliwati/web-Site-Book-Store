<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBook.ascx.cs" Inherits="Controls_ctlBook" %>
<%@ Register src="ctlBookComments.ascx" tagname="ctlBookComments" tagprefix="uc1" %>
<%@ Register src="ctlBookEval.ascx" tagname="ctlBookEval" tagprefix="uc2" %>

<asp:HiddenField runat="server" ID="bookID" Value="0" />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="BookID" style="width:100%"  
    DataSourceID="odsBook">
    <ItemTemplate>
        
        <table>
            <tr valign="top">
                <td>
                    <span class="BookCover" style="width:50%; padding-right:12px;display:">
                        <asp:Image ID="lnkView" runat="server" ImageUrl='<%# Eval("BookID", clsGlobal.BookCoverURL) %>' />
                    </span>
                </td>
                <td>
                    <asp:HyperLink runat="server"  ID="lnkCategory" NavigateUrl='<%# Eval("CategoryID","~/Books.aspx?cid={0}") %>' 
                        Text='<%# Eval("CategoryName") %>' />


                    <h2 class="BookTitle"><%# Eval("BookTitle") %></h2>

                    ISBN:<%# Eval("ISBN") %><br /><asp:HyperLink runat="server" ID="lnkPublisher" NavigateUrl='<%# Eval("PublisherID","~/Books.aspx?pid={0}") %>' 
                        Text='<%# Eval("PublisherName") %>' />

                    <%# Eval("PublishDate","{0:yyyy}") %>

        
                    <br />
                    Authors:
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="odsBookAuthors">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="lnkAuthor" NavigateUrl='<%# Eval("AuthorID", "~/Books.aspx?aid={0}") %>'
                            Text='<%# Eval("AuthorName") %>'></asp:HyperLink>
                        </ItemTemplate>
                        <SeparatorTemplate>,</SeparatorTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsBookAuthors" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBookID" 
                        TypeName="AWPDataSetTableAdapters.BookAuthors_VTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="bookID" Name="BookID" 
                                PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <br /><br />
                    <asp:Label ID="AbstractLabel" runat="server" Text='<%# Eval("Abstract") %>' />
                    <hr />
                    Price: <%# Eval("BookPrice","{0:c}") %>
                    <br />
                    ReadCount:
                    <asp:Label ID="ReadCountLabel" runat="server" Text='<%# Eval("ReadCount") %>' />


                    <br /><br />
                    <% if (clsGlobal.IsLogged)
                       {
                           if (clsGlobal.IsCustomer)
                           { %>
                        <asp:LinkButton runat="server" ID="lnkBuy" Text="Add to Basket" OnClick="lnkBuy_Click" />
                        <asp:Label runat="server" ID="lblError" EnableViewState="false" ForeColor="Red" />
                    <%}
                       }
                       else
                       {%>
                       To buy this book please <asp:HyperLink runat="server" ID="lnkLogin" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>.
                    <%} %>

                </td>
            </tr>
        </table>
 
        <div>
            <uc2:ctlBookEval ID="ctlBookEval1" runat="server" BookID='<%# Eval("BookID") %>' />
            <uc1:ctlBookComments ID="ctlBookComments1" runat="server" BookID='<%# Eval("BookID") %>' />
        </div>
    </ItemTemplate>
</asp:FormView>

<asp:ObjectDataSource ID="odsBook" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBookID" 
    TypeName="AWPDataSetTableAdapters.Books_VTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="bookID" Name="BookID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>

