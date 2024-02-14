<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeHome.aspx.cs" Inherits="PROGTestWebsite.EmployeeHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#CC6699" Height="470px" style="margin-left: 0px" BorderStyle="Solid">
        <h1>&nbsp;Employee Home</h1>
        <p>
            &nbsp;&nbsp;Welcome
            <asp:Label ID="lblUsername" runat="server"></asp:Label>
            !</p>
        <p>
            &nbsp;&nbsp;If you need assistance with using the application, please contact any administator that is available.
        </p>
        <p>
            &nbsp; If a farmer asks you to register them into the system, please make sure with the administrator that he/she is allowed to be registered and that they have their certified documents.</p>
        <table class="w-100">
            <tr>
                <td style="width: 668px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image1" runat="server" Height="248px" Width="280px" ImageUrl="~/EmployeePhoto1.jpg" BorderColor="#CC6699" BorderStyle="Solid" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image2" runat="server" Height="248px" Width="280px" ImageUrl="~/EmployeePhoto2.jpg" BorderColor="#CC6699" BorderStyle="Solid" />
                </td>
                <td>
                    <asp:Image ID="Image3" runat="server" Height="248px" Width="280px" ImageUrl="~/EmployeePhoto3.jpg" BorderColor="#CC6699" BorderStyle="Solid" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image4" runat="server" Height="248px" Width="280px" ImageUrl="~/EmployeePhoto4.jpg" BorderColor="#CC6699" BorderStyle="Solid" />
                </td>
            </tr>
            <tr>
                <td style="width: 668px">&nbsp;&nbsp;If you have finished using the application,
                    <asp:LinkButton ID="lnkLogOut" runat="server" OnClick="lnkLogOut_Click">log out</asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
