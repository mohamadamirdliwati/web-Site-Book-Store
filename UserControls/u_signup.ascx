<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_signup.ascx.cs" Inherits="UserControls_u_signup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style>
.signUp th{text-align:right}
</style>
<table cellpadding="4" class="signUp">
    <tr>
        <th>
            Full Name
        </th>
        <td>
            <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtFullName" ErrorMessage="Please Insert Your Full Name" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            Login Name
        </th>
        <td>
            <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtUserName" ErrorMessage="Please Insert Your User Name" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            Password
        </th>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="Please Insert Your Password" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            Confirm Password
        </th>
        <td>
            <asp:TextBox ID="txtConfirmPassword" runat="server"  
                TextMode="Password" ></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtConfirmPassword" ErrorMessage="Please Confirm the Password" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                ErrorMessage="Please check Your Password" ValidationGroup="reg">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <th>
            Email
        </th>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Please Insert Your Email" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Please Insert Valid Email" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="reg">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <th>
            Nationality
        </th>
        <td>
            <asp:DropDownList ID="lstNationality" runat="server" DataSourceID="odsNationalities" 
                DataTextField="NationalityName" DataValueField="NationalityID">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="odsNationalities" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="AWPDataSetTableAdapters.NationalitiesTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <th>
            Gender
        </th>
        <td>
            <asp:DropDownList ID="lstGender" runat="server">
                <asp:ListItem Value="0">Male</asp:ListItem>
                <asp:ListItem Value="1">Female</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <th>
            BirthDate
        </th>
        <td>
            <asp:TextBox runat="server" ID="txtBirthDate" />
            <asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" FirstDayOfWeek="Saturday" 
                PopupPosition="Left" 
                Enabled="True" TargetControlID="txtBirthDate" Format="dd-MM-yyyy">
            </asp:CalendarExtender>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <th>
            Marital Status</th>
        <td>
            <asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem Value="0">Single</asp:ListItem>
                <asp:ListItem Value="1">Married</asp:ListItem>
                <asp:ListItem Value="2">Engaged</asp:ListItem>
                <asp:ListItem Value="3">Divorced</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <th>
            Children Count</th>
        <td>
            <asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <th>
            Hoppies
        </th>
        <td>
            <asp:TextBox ID="txtHoppies" runat="server" Rows="5" TextMode="MultiLine" 
                Width="209px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:right">
            <asp:LinkButton ID="btnSave" runat="server" onclick="btnSave_Click" 
                ValidationGroup="reg" Text="Save" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="Label10" runat="server" ForeColor="Red" Visible="False">*</asp:Label>
            <asp:SqlDataSource ID="loginid" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT MAX(loginID) + 1 AS Expr1 FROM login">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
            <asp:ValidationSummary runat="server" ID="vs" ValidationGroup="reg" />
