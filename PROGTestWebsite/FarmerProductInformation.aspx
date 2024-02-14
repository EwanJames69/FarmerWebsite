<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="FarmerProductInformation.aspx.cs" Inherits="PROGTestWebsite.FarmerProductInformation" %>
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
                .auto-style2 {
                    height: 50px;
                    width: 264px;
                }
                .auto-style3 {
                    height: 30px;
                }
                .auto-style4 {
                    height: 50px;
                }
                .auto-style5 {
                    width: 339px;
                    height: 59px;
                }
                .auto-style6 {
                    height: 59px;
                    width: 264px;
                }
                .auto-style7 {
                    height: 60px;
                }
            </style>
        </head>
        <body>
            <div class="container">
            <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#CC6699" Height="472px" style="margin-left: 0px" BorderStyle="Solid">
        &nbsp;&nbsp;These are all the products ever supplied by
        <asp:Label ID="lblName" runat="server"></asp:Label>
        &nbsp;(ID:
        <asp:Label ID="lblID" runat="server"></asp:Label>
        ):<br />
    <br />
    <table class="w-100">
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Label ID="lblType" runat="server" Text="&nbsp;&nbsp;Choose A Date of Delivery"></asp:Label>
                :&nbsp;&nbsp; </td>
            <td rowspan="11">
                <asp:Panel ID="Panel1" runat="server" CssClass="gridstyle" BackColor="White" BorderColor="#CC6699" Height="386px" style="margin-left: 0px" BorderStyle="Solid">
                <asp:GridView ID="dgvProduct" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="FARMERPRODUCTDataSource" Height="383px" Width="794px" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" style="margin-left: 0px; margin-top: 0px;" DataKeyNames="PRODUCT_ID" BorderStyle="None">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="PRODUCT_ID" HeaderText="PRODUCT ID" InsertVisible="False" ReadOnly="True" SortExpression="PRODUCT_ID" />
                        <asp:BoundField DataField="PRODUCT_TYPE" HeaderText="PRODUCT TYPE" SortExpression="PRODUCT_TYPE" />
                        <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                        <asp:BoundField DataField="DATE_DELIVERED" HeaderText="DATE DELIVERED" SortExpression="DATE_DELIVERED" DataFormatString="{0:yyyy/MM/dd}"/>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="FARMERPRODUCTDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PRODUCT_ID], [PRODUCT_TYPE], [AMOUNT], [DATE_DELIVERED] FROM [PRODUCT] WHERE ([FARMER_ID] = @FARMER_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblID" Name="FARMER_ID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                &nbsp;&nbsp;
                <asp:TextBox ID="txtSingleDate" runat="server" TextMode="Date" Width="210px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:Button ID="btnSingleDateChoose" runat="server" OnClick="btnSingleDateChoose_Click" Text="Choose" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblChooseTwoDates" runat="server" Text="&nbsp;&nbsp;Pick two Dates To Show All Products Delivered Inbetween:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;&nbsp;Please pick the oldest date on the left and newest on the right:</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;&nbsp;(Otherwise no data will be shown)</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;
                <asp:TextBox ID="txtDateOne" runat="server" TextMode="Date" Width="174px"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Label ID="lblAnd" runat="server" Text="And"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtDateTwo" runat="server" TextMode="Date" Width="174px"></asp:TextBox>
                &nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;
                <asp:Button ID="btnChooseTwoDates" runat="server" OnClick="btnChooseTwoDates_Click" Text="Choose" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4" colspan="2">
                <asp:Label ID="lblDate" runat="server" Text="&nbsp;&nbsp;Filter Product Type:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;&nbsp;
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
            <td style="width: 339px; height: 50px;">
                <asp:Button ID="btnChooseProduct" runat="server" Text="Choose" OnClick="btnChooseProduct_Click" />
            </td>
        </tr>
        <tr>
            <td style="height: 20px;" colspan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px;">
                &nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" Width="65px" OnClick="btnBack_Click" />
            </td>
        </tr>
    </table>
    </asp:Panel>
                </div>
        </body>
    </htm>    
</asp:Content>
