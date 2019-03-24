<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="Nationalities.aspx.cs" Inherits="Admin_Nationalities" %>

<%@ Register src="../admin_controles/Nationalities.ascx" tagname="Nationalities" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
Nationalities
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:Nationalities ID="Nationalities1" runat="server" />
</asp:Content>

