<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="ChooseFarmer.aspx.cs" Inherits="PROGTestWebsite.ChooseFarmer" %>
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
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#CC6699" Height="638px" style="margin-left: 0px" BorderStyle="Solid">
        <table class="w-100">
            <tr>
                <td style="width: 1227px">&nbsp;&nbsp;You searched for:
                    <asp:Label ID="lblSearch" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 488px; width: 1227px;">
                    <asp:Panel ID="Panel1" runat="server" CssClass="gridstyle" BackColor="White" BorderColor="#CC6699" Height="500px" style="margin-left: 0px" BorderStyle="Solid">
                    <asp:GridView ID="dgvFarmer" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="FARMER_ID" DataSourceID="FarmerSearchDataSource" ForeColor="Black" GridLines="Vertical" Height="482px" Width="1210px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="FARMER_ID" HeaderText="FARMER ID" InsertVisible="False" ReadOnly="True" SortExpression="FARMER_ID" />
                            <asp:BoundField DataField="FARMER_FULLNAME" HeaderText="FARMER FULLNAME" SortExpression="FARMER_FULLNAME" />
                            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE NUMBER" SortExpression="PHONE_NUMBER" />
                            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="Gray" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="FarmerSearchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FARMER_ID], [FARMER_FULLNAME], [EMAIL], [PHONE_NUMBER], [USERNAME] FROM [FARMER] WHERE ([FARMER_FULLNAME] LIKE '%' + @FARMER_FULLNAME + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblSearch" Name="FARMER_FULLNAME" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        </asp:Panel>
                </td>
                <td>
                    <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next" />
                    <br />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 42px; width: 1227px;">&nbsp;&nbsp;If no results have come up, please make sure you have entered the name correctly. In order to go back to the previous page, please click the button below:</td>
            </tr>
            <tr>
                <td style="height: 51px; width: 1227px;">
                    &nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>        
        </asp:Panel>
                </div>
            </body>
</asp:Content>
