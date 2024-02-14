<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer.Master" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="PROGTestWebsite.ProductInfo" %>
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
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#993300" Height="495px" style="margin-left: 0px" BorderStyle="Solid">
    &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="&nbsp;Product Information"></asp:Label>
    <br />
    <br />
    &nbsp;&nbsp;Please fill in the details below about the shipped products,
    <asp:Label ID="lblUsername" runat="server"></asp:Label>
    <br />
    <br />
    <table class="w-100">
        <tr>
            <td style="width: 272px; height: 53px">
                <asp:Label ID="lblType" runat="server" Text="&nbsp;&nbsp;Product Type:"></asp:Label>
            </td>
            <td style="height: 53px; width: 339px">
                <asp:DropDownList ID="ddlProducts" runat="server" Width="189px">
                    <asp:ListItem>Choose any product</asp:ListItem>
                    <asp:ListItem>Vegetables</asp:ListItem>
                    <asp:ListItem>Fruit</asp:ListItem>
                    <asp:ListItem>Meat</asp:ListItem>
                    <asp:ListItem>Sweets/Chocolates</asp:ListItem>
                    <asp:ListItem>Milk</asp:ListItem>
                    <asp:ListItem>Water</asp:ListItem>
                    <asp:ListItem>Alcohol</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td rowspan="7">
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="overflow-scroll" BorderColor="#993300" Height="353px" style="margin-left: 0px" BorderStyle="Solid" Width="781px">
                <asp:GridView ID="dgvProduct" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="PRODUCTDataSource" Height="339px" Width="787px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="dgvProduct_SelectedIndexChanged" style="margin-left: 0px" DataKeyNames="PRODUCT_ID">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="PRODUCT_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="PRODUCT_ID" />
                        <asp:BoundField DataField="PRODUCT_TYPE" HeaderText="PRODUCT TYPE" SortExpression="PRODUCT_TYPE" />
                        <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                        <asp:BoundField DataField="DATE_DELIVERED" HeaderText="DATE DELIVERED" SortExpression="DATE_DELIVERED" DataFormatString="{0:yyyy/MM/dd}"/>
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <asp:SqlDataSource ID="PRODUCTDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [PRODUCT_ID], [PRODUCT_TYPE], [AMOUNT], [DATE_DELIVERED] FROM [PRODUCT] WHERE ([USERNAME] LIKE '%' + @USERNAME + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblUsername" Name="USERNAME" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 71px">
                <asp:Label ID="lblAmount" runat="server" Text="&nbsp;&nbsp;Amount Delivered:"></asp:Label>
            </td>
            <td style="height: 71px; width: 339px">
                <asp:TextBox ID="txtAmount" runat="server" Width="210px" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 60px;">
                <asp:Label ID="lblDate" runat="server" Text="&nbsp;&nbsp;Date Of Delivery:"></asp:Label>
            </td>
            <td style="width: 339px; height: 60px;">
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 54px;">
                </td>
            <td style="width: 339px; height: 54px;">
                <asp:CheckBox ID="chkBoxCorrect" runat="server" Text="All Information Is Correct" />
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 51px;"></td>
            <td style="width: 339px; height: 51px;">
                <asp:Button ID="btnAd" runat="server" Text="Add" Width="90px" OnClick="btnAdd_Click" ForeColor="Black" ShowRoundedCorner="true" CssClass=".MyButtonStyle"/>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="90px" OnClick="btnUpdate_Click" ShowRoundedCorner="true" CssClass=".MyButtonStyle"/>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="90px" OnClick="btnDelete_Click" ShowRoundedCorner="true" CssClass=".MyButtonStyle"/>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 25px;"></td>
            <td style="width: 339px; height: 25px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Operation" Width="277px" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td style="height: 31px;" colspan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
        </asp:Panel>
                </div>
            </body>
</asp:Content>

