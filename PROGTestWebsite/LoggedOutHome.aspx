<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="LoggedOutHome.aspx.cs" Inherits="PROGTestWebsite.LoggedOutHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#33CC33" Height="422px" style="margin-left: 0px" BorderStyle="Solid">
        <h1>&nbsp;Farm Central</h1>
        <p>
            &nbsp;&nbsp;Welcome to the Farm Central stock management application</p>
        <p>
            &nbsp;&nbsp;Please
            <asp:Label ID="lblLogin" runat="server" Font-Bold="True" Text="login"></asp:Label>
            in order to use the applications functions&nbsp;</p>
        <p>
            &nbsp;&nbsp;There are two types of users in this application (employee and farmer). Each user has its own specific roles. The roles are as follows:</p>
        <table class="w-100">
            <tr>
                <td style="width: 670px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Farmer"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Employee"></asp:Label>
                </td>
            </tr>
        </table>
        <table class="w-100">
            <tr>
                <td style="width: 668px">
                    <asp:Panel ID="pnlFarmer" runat="server" BorderColor="Brown" BorderStyle="Solid" Height="140px" Width="625px">
                        <asp:Label ID="lblFarmerInfo" runat="server" Height="110px" style="margin-left: 9px; margin-bottom: 5px" Width="607px">The farmer can enter information about the product/products that he/she has delivered. This information includes the product type, the amount delivered and the date of the delivery. If you are a farmer and do not have an account, please ask an employee to register you into the system. The farmer does not have access to the employees pages.</asp:Label>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="pnlEmployee" runat="server" BorderColor="Brown" BorderStyle="Solid" Height="140px" style="margin-left: 0px" Width="625px">
                        <asp:Label ID="lblEmployeeInfo" runat="server" Height="114px" style="margin-left: 9px; margin-top: 9px" Width="607px">The employee can register a farmer into the system and allow them to login. The employee can also view a list of all the products supplied by a specific farmer. That list of products can then be filtered to only display information between two certain dates or the product type. The employee does not have access to the farmers pages. </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="width: 668px">
                    <asp:LinkButton ID="lnkFarmer" runat="server" OnClick="lnkFarmer_Click">Farmer Login</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lnkEmployee" runat="server" OnClick="lnkEmployee_Click">Employee Login</asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
