<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>
<%@ Register src="~/UserControls/u_signup.ascx" tagname="u_signup" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
    Sign Up
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc2:u_signup ID="u_signup1" runat="server" />
</asp:Content>

