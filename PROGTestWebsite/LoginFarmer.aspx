<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="LoginFarmer.aspx.cs" Inherits="PROGTestWebsite.LoginFarmer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#33CC33" Height="325px" style="margin-left: 0px" BorderStyle="Solid">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">&nbsp;Farm Central</h1>
            <p>&nbsp;&nbsp;Please log in to access the stock-management application (For a farmers account only)</p>
            <table class="w-100" style="margin-bottom: 0px">
                <tr>
                    <td style="height: 42px; width: 169px">
                        <asp:Label ID="lblUsername" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Username:"></asp:Label>
                    </td>
                    <td style="height: 42px">
                        <asp:TextBox ID="txtUsername" runat="server" Width="214px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 69px; width: 169px">
                        <asp:Label ID="lblPassword" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Password:"></asp:Label>
                    </td>
                    <td style="height: 69px">
                        <asp:TextBox ID="txtPassword" runat="server" Width="214px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px; width: 169px"></td>
                    <td style="height: 30px">
                        <asp:Button ID="btnLogIn" runat="server" Text="Log in" OnClick="btnLogIn_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 36px">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 29px">&nbsp;&nbsp;&nbsp;&nbsp;If you are a farmer and do not have an account, please ask an employee to register you<br />                        
                    </td>
                </tr>
            </table>
        </section>
    </main>
        </asp:Panel>

</asp:Content>
