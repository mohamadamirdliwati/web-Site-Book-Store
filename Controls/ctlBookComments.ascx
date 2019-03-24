<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBookComments.ascx.cs" Inherits="Controls_ctlBookComments" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



    <fieldset>
        <legend>Comments</legend>
        <asp:HiddenField runat="server" ID="txtBookID" />

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsBookComments">
            <ItemTemplate>
                <div class="comment">
                <span class="name"><%# Eval("CustomerName") %></span>
                <span class="date"><%# Eval("CommentDate", "{0:dd-MM-yyyy}") %></span>
                <br />
                <span class="text"><%# Eval("CommentText") %></span>
                </div>
            </ItemTemplate>
            <SeparatorTemplate><hr /></SeparatorTemplate>
            <FooterTemplate>

            </FooterTemplate>
        </asp:Repeater>

        <hr />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <% if(clsGlobal.IsLogged)
                    {if (clsGlobal.IsCustomer)
                    { %>

                    <asp:Panel runat="server" ID="pnlAddComment" CssClass="popupPanel" width="400px">
                        <asp:Panel runat="server" ID="popupHeader" CssClass="PopupHeader">AddComment</asp:Panel>
                        <asp:Panel ID="pnlContents" runat="server" Class="popupContents">
                            <b><%= clsGlobal.IsCustomer? clsGlobal.CurrentCustomer.CustomerName:"" %></b><br />
                            <asp:TextBox runat="server" ID="txtCommentText" TextMode="MultiLine" Rows="5" Width="98%"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCommentText" ValidationGroup="AddComment" Display="Dynamic" ForeColor="Red">Please fill the comment</asp:RequiredFieldValidator>
                            <div style="text-align:right">
                                <asp:LinkButton runat="server" ID="lnkAddComment" Text="Add Comment" ValidationGroup="AddComment" OnClick="lnkAddComment_Click" />
                                <asp:LinkButton runat="server" ID="lnkCancel" text="cancel"/>
                            </div>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:LinkButton runat="server" ID="LinkButton1" Text="Add Comment" />
                    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                        TargetControlID="LinkButton1" PopupControlID="pnlAddComment"
                        PopupDragHandleControlID="popupHeader" DropShadow="true"
                        Drag="true" RepositionMode="None" 
                        BackgroundCssClass="modalBackground" />

                <%}}
                    else 
                    {%>
                    To add comment please
                    <asp:HyperLink runat="server" ID="lnkLogin" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>.
                <%} %>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:ObjectDataSource ID="odsBookComments" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetApprovedDataByBookID" 
            TypeName="AWPDataSetTableAdapters.BookComments_VTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBookID" Name="BookID" 
                    PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </fieldset>
