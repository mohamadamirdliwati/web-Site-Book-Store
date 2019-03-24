<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="Publishers.aspx.cs" Inherits="Admin_Publishers" %>

<%@ Register src="../admin_controles/Publishers.ascx" tagname="Publishers" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Publishers
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:Publishers ID="Publishers1" runat="server" />
</asp:Content>

