<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="RegisterFarmer.aspx.cs" Inherits="PROGTestWebsite.RegisterFarmer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <htm>
        <head>
            <style>
                .container{
                    position: relative;
                }
                .gridstyle{
                    overflow: scroll;
                }
                </style>
        </head>
        <body>
            <div class="container">
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#CC6699" Height="542px" style="margin-left: 0px" BorderStyle="Solid">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="&nbsp;Farmer Register Page"></asp:Label>
        <br />
    </p>
    <p>
        &nbsp;&nbsp;Please fill in all the details below in order to register an account for a farmer</p>
    <table class="w-100">
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblName" runat="server" Text="&nbsp;&nbsp;Full Name:"></asp:Label>
            </td>
            <td style="height: 52px; width: 353px;">
                <asp:TextBox ID="txtName" runat="server" Width="210px"></asp:TextBox>
            </td>
            <td rowspan="7">
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="overflow-scroll" BorderColor="#CC6699" Height="353px" style="margin-left: 0px" BorderStyle="Solid" Width="763px">
                <asp:GridView ID="dgvFarmer" runat="server" AutoGenerateColumns="False" DataKeyNames="FARMER_ID" DataSourceID="FARMERDataSource" Height="356px" Width="763px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="FARMER_ID" HeaderText="FARMER_ID" InsertVisible="False" ReadOnly="True" SortExpression="FARMER_ID" />
                        <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                        <asp:BoundField DataField="FARMER_FULLNAME" HeaderText="FARMER_FULLNAME" SortExpression="FARMER_FULLNAME" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="FARMERDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FARMER_ID], [PHONE_NUMBER], [EMAIL], [FARMER_FULLNAME], [USERNAME] FROM [FARMER]"></asp:SqlDataSource>
                    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblEmail" runat="server" Text="&nbsp;&nbsp;Email:"></asp:Label>
            </td>
            <td style="height: 52px; width: 353px;">
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblNumber" runat="server" Text="&nbsp;&nbsp;Phone Number:"></asp:Label>
            </td>
            <td style="height: 52px; width: 353px;">
                <asp:TextBox ID="txtNumber" runat="server" TextMode="Phone" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblUsername" runat="server" Text="&nbsp;&nbsp;Username:"></asp:Label>
            </td>
            <td style="height: 52px; width: 353px;">
                <asp:TextBox ID="txtUsername" runat="server" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblPassword" runat="server" Text="&nbsp;&nbsp;Password:"></asp:Label>
            </td>
            <td style="height: 52px; width: 353px;">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="&nbsp;&nbsp;Confirm Password:"></asp:Label>
            </td>
            <td style="height: 52px; width: 353px;">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 52px"></td>
            <td style="height: 52px; width: 353px;">
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
                </div>
        </body>
</asp:Content>
