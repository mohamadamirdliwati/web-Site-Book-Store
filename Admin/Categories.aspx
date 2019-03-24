<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Admin_Categories" %>

<%@ Register src="../admin_controles/Categories.ascx" tagname="Categories" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    Categories
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:Categories ID="Categories1" runat="server" />
</asp:Content>

