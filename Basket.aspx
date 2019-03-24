<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="Basket.aspx.cs" Inherits="Basket" %>

<%@ Register src="Controls/ctlBasket.ascx" tagname="ctlBasket" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Basket
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:ctlBasket ID="ctlBasket1" runat="server" />
</asp:Content>

