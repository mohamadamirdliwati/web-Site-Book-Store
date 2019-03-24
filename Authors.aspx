<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="Authors.aspx.cs" Inherits="Authors" %>

<%@ Register src="Controls/ctlAuthors.ascx" tagname="ctlAuthors" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:ctlAuthors ID="ctlAuthors1" runat="server" />
</asp:Content>

