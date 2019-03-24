<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteAdmin.master" AutoEventWireup="true" CodeFile="DailyReport.aspx.cs" Inherits="Admin_DailyReport" %>

<%@ Register src="../admin_controles/DailyReport.ascx" tagname="DailyReport" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    Daily Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:DailyReport ID="DailyReport1" runat="server" />
</asp:Content>

