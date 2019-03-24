<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_login.ascx.cs" Inherits="UserControls_u_login" %>
<asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnLogin" GroupingText="Login Info">
    <table>
        <tr>
            <th>
                User name
            </th>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUserName" ToolTip="User Name Is Null !!!" 
                    ValidationGroup="log">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                Password
            </th>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ControlToValidate="txtPassword" ToolTip="Password Is Null !!!" 
                    ValidationGroup="log">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                Auth. Level
            </th>
            <td>
                <asp:DropDownList ID="lstAuthLevel" runat="server">
                    <asp:ListItem >Admin</asp:ListItem>
                    <asp:ListItem Selected="True">Customer</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:right">
                <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                    Text="LogIn" ValidationGroup="log" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:right">
                If you don't have an account: 
                    <asp:LinkButton ID="lnkSignUp" runat="server" onclick="lnkSignUp_Click" 
                    PostBackUrl="~/Customer/SignUp.aspx">SignUp</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Panel>