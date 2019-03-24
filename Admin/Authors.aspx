<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="Authors.aspx.cs" Inherits="Admin_Authors" %>

<%@ Register src="../admin_controles/Authors.ascx" tagname="Authors" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Authors
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:Authors ID="Authors1" runat="server" />
</asp:Content>

