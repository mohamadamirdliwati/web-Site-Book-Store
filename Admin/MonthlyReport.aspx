<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="MonthlyReport.aspx.cs" Inherits="Admin_MonthlyReport" %>

<%@ Register src="../admin_controles/MonthlyReport.ascx" tagname="MonthlyReport" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    Monthly Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:MonthlyReport ID="MonthlyReport1" runat="server" />
</asp:Content>

