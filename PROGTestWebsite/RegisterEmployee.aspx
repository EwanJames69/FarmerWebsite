<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="RegisterEmployee.aspx.cs" Inherits="PROGTestWebsite.RegisterEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#33CC33" Height="507px" style="margin-left: 0px" BorderStyle="Solid">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="&nbsp;&nbsp;Employee Register Page"></asp:Label>
        <br />
    </p>
    <p>
        &nbsp;&nbsp;Please fill in all the details below in order to register an account</p>
    <table class="w-100">
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblName" runat="server" Text="&nbsp;&nbsp;Full Name:"></asp:Label>
            </td>
            <td style="height: 52px; width: 288px;">
                <asp:TextBox ID="txtName" runat="server" Width="210px"></asp:TextBox>
            </td>
            <td rowspan="6">
                <asp:Image ID="Image1" runat="server" BorderColor="#003300" BorderStyle="Solid" Height="306px" ImageUrl="~/EmployeeRegisterPhoto.jpg" Width="452px" />
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblEmail" runat="server" Text="&nbsp;&nbsp;Email:"></asp:Label>
            </td>
            <td style="height: 52px; width: 288px;">
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblNumber" runat="server" Text="&nbsp;&nbsp;Phone Number:"></asp:Label>
            </td>
            <td style="height: 52px; width: 288px;">
                <asp:TextBox ID="txtNumber" runat="server" TextMode="Phone" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblUsername" runat="server" Text="&nbsp;&nbsp;Username:"></asp:Label>
            </td>
            <td style="height: 52px; width: 288px;">
                <asp:TextBox ID="txtUsername" runat="server" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblPassword" runat="server" Text="&nbsp;&nbsp;Password:"></asp:Label>
            </td>
            <td style="height: 52px; width: 288px;">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="&nbsp;&nbsp;Confirm Password:"></asp:Label>
            </td>
            <td style="height: 52px; width: 288px;">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px"></td>
            <td style="height: 52px; width: 288px;">                
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" Width="90px" />
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="90px" />
            </td>
        </tr>
        <tr>
            <td style="height: 40px" colspan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        </table>
        </asp:Panel>
</asp:Content>
