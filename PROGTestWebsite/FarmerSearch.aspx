<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="FarmerSearch.aspx.cs" Inherits="PROGTestWebsite.FarmerSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#CC6699" Height="573px" style="margin-left: 0px" BorderStyle="Solid">
        <h1>&nbsp;Search For A Farmer</h1>
        <p>
            &nbsp;&nbsp;Welcome 
            <asp:Label ID="lblUsername" runat="server"></asp:Label>
            to the &quot;Search For A Farmer&quot; page.
            </p>
            <table class="w-100" style="height: 142px">
                <tr>
                    <td>&nbsp;&nbsp;Searching for a farmer will display all the product information that the farmer has entered.</td>
                </tr>
                <tr>
                    <td style="height: 28px">&nbsp;&nbsp;The information entered may be filtered so that it only displays the products delivered between a certain date, or it only displays a certain product type.</td>
                </tr>
                <tr>
                    <td style="height: 34px">&nbsp;&nbsp;Once a farmers name has been searched, please pick the farmer that you would like to see the information from.</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Please enter the name of the farmer below:</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtName" runat="server" Width="220px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                        
                    </td>
                </tr>
            </table>
        <p>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <p>
            &nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="262px" Width="305px" BorderColor="#CC6699" BorderStyle="Solid" ImageUrl="~/FarmerSearchPhoto1.jpg" />
            &nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" BorderColor="#CC6699" BorderStyle="Solid" Height="262px" Width="305px" ImageUrl="~/FarmerSearchPhoto2.jpg" />
            &nbsp;&nbsp;
            <asp:Image ID="Image3" runat="server" BorderColor="#CC6699" BorderStyle="Solid" Height="262px" Width="305px" ImageUrl="~/FarmerSearchPhoto3.jpg" />
            &nbsp;&nbsp;
            <asp:Image ID="Image4" runat="server" BorderColor="#CC6699" BorderStyle="Solid" Height="262px" Width="305px" ImageUrl="~/FarmerSearchPhoto4.jpg" />
        </p>
        
    </asp:Panel>
</asp:Content>
