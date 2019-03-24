<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="Book" %>
<%@ Register src="Controls/ctlBook.ascx" tagname="ctlBook" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Book Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:ctlBook ID="ctlBook1" runat="server" BookID='<%# Request.QueryString["bid"] %>' />
</asp:Content>

