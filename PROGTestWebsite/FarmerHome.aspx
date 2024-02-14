<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer.Master" AutoEventWireup="true" CodeBehind="FarmerHome.aspx.cs" Inherits="PROGTestWebsite.FarmerHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#993300" Height="422px" style="margin-left: 0px" BorderStyle="Solid">
        <h1>&nbsp;Farmer Home</h1>
        <p>
            &nbsp;&nbsp;Welcome
            <asp:Label ID="lblUsername" runat="server"></asp:Label>
            !</p>
        <p>
            &nbsp;&nbsp;Thank you for using the Farm Central stock management application. If you need any assistance, please contact any store employee or administator that&#39;s available.</p>
        <table class="w-100">
            <tr>
                <td style="width: 668px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image1" runat="server" Height="248px" Width="280px" ImageUrl="~/FarmerPhoto1.jpg" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image2" runat="server" Height="248px" Width="280px" ImageUrl="~/FarmerPhoto2.jpeg" />
                </td>
                <td>
                    <asp:Image ID="Image3" runat="server" Height="248px" Width="280px" ImageUrl="~/FarmerPhoto3.jpg" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image4" runat="server" Height="248px" Width="280px" ImageUrl="~/FarmerPhoto4.jpg" />
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
