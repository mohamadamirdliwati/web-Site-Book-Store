<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="BookEdit.aspx.cs" Inherits="Admin_BookEdit" %>
<%@ Register src="../admin_controles/BookEdit.ascx" tagname="BookEdit" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Edit Book
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:BookEdit ID="BookEdit1" runat="server" />
</asp:Content>

