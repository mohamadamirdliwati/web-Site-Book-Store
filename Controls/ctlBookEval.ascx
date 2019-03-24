<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBookEval.ascx.cs" Inherits="Controls_ctlBookEval" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<fieldset><legend>Evaluation:</legend>
    <asp:HiddenField runat="server" ID="txtBookID" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>   

    <asp:ListView ID="lstEval" runat="server" DataSourceID="odsBookEval">
        <ItemTemplate>
            <asp:Image runat="server" ID="imgEval" ImageUrl='<%# Eval("EvalRate","~/images/eval{0}.png")%>' />
        </ItemTemplate>
        <EmptyDataTemplate>
            Not evaluated.
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsBookEval" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBookID" 
        TypeName="AWPDataSetTableAdapters.BookEval_VTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBookID" Name="BookID" PropertyName="Value" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>


            <% if (clsGlobal.IsLogged)
               {     if (clsGlobal.IsCustomer)
                  
                       { %>

                <asp:Panel runat="server" ID="pnlAddEvaluation" CssClass="popupPanel" width="400px">
                    <asp:Panel runat="server" ID="popupHeader" CssClass="PopupHeader">Add Evaluation</asp:Panel>
                    <asp:Panel ID="pnlContents" runat="server" Class="popupContents">
                        <b><%= clsGlobal.IsCustomer? clsGlobal.CurrentCustomer.CustomerName:"" %></b>
                        <asp:RadioButtonList runat="server" ID="lstEvaluation" RepeatLayout="OrderedList">
                            <asp:ListItem Value="1"><img src="images/eval1.png" /></asp:ListItem>
                            <asp:ListItem Value="2"><img src="images/eval2.png" /></asp:ListItem>
                            <asp:ListItem Value="3"><img src="images/eval3.png" /></asp:ListItem>
                            <asp:ListItem Value="4"><img src="images/eval4.png" /></asp:ListItem>
                            <asp:ListItem Value="5"><img src="images/eval5.png" /></asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lstEvaluation" ValidationGroup="AddEvaluation" Display="Dynamic" ForeColor="Red">Please fill the Evaluation</asp:RequiredFieldValidator>
                        <div style="text-align:right">
                            <asp:LinkButton runat="server" ID="lnkAddEvaluation" Text="Add Evaluation" ValidationGroup="AddEvaluation" OnClick="lnkAddEvaluation_Click" />
                            <asp:LinkButton runat="server" ID="lnkCancel" text="cancel"/>
                        </div>
                    </asp:Panel>
                </asp:Panel>

                <asp:LinkButton runat="server" ID="LinkButton1" Text="Add Evaluation" />
                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="LinkButton1" PopupControlID="pnlAddEvaluation"
                PopupDragHandleControlID="popupHeader" DropShadow="true"
                Drag="true" RepositionMode="None" 
                BackgroundCssClass="modalBackground" />

            <%}
                   }
            else
                   {%>
               To add evaluation please <asp:HyperLink runat="server" ID="lnkLogin" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>.
            <%} %>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lstEvaluation" EventName="SelectedIndexChanged" />
        </Triggers>

    </asp:UpdatePanel>
</fieldset>
