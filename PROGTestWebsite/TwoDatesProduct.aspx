<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="TwoDatesProduct.aspx.cs" Inherits="PROGTestWebsite.TwoDatesProduct" %>
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
    <asp:Panel ID="pnlBackground" runat="server" BackColor="White" BorderColor="#CC6699" Height="628px" style="margin-left: 0px" BorderStyle="Solid">
        &nbsp;&nbsp;These are all the products ever supplied by
        <asp:Label ID="lblName" runat="server"></asp:Label>
        &nbsp;(ID:
        <asp:Label ID="lblID" runat="server"></asp:Label>
        ) between the dates
        <asp:Label ID="lblDateOne" runat="server"></asp:Label>
        &nbsp;and
        <asp:Label ID="lblDateTwo" runat="server"></asp:Label>
        <br />
        <table class="w-100">
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" CssClass="gridstyle" BackColor="White" BorderColor="#CC6699" Height="500px" style="margin-left: 0px" BorderStyle="Solid">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="PRODUCT_ID" DataSourceID="TWODATESDataSource" GridLines="None" Height="542px" Width="1228px" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="PRODUCT_ID" HeaderText="PRODUCT_ID" InsertVisible="False" ReadOnly="True" SortExpression="PRODUCT_ID" />
                            <asp:BoundField DataField="PRODUCT_TYPE" HeaderText="PRODUCT_TYPE" SortExpression="PRODUCT_TYPE" />
                            <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                            <asp:BoundField DataField="DATE_DELIVERED" HeaderText="DATE_DELIVERED" SortExpression="DATE_DELIVERED" DataFormatString="{0:yyyy/MM/dd}" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="TWODATESDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PRODUCT_ID], [PRODUCT_TYPE], [AMOUNT], [DATE_DELIVERED] FROM [PRODUCT] WHERE (([FARMER_ID] = @FARMER_ID) AND ([FARMER_FULLNAME] = @FARMER_FULLNAME) AND ([DATE_DELIVERED] &lt;= @DATE_DELIVERED) AND ([DATE_DELIVERED] &gt;= @DATE_DELIVERED2))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblID" Name="FARMER_ID" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="lblName" Name="FARMER_FULLNAME" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="lblDateTwo" DbType="Date" Name="DATE_DELIVERED" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lblDateOne" DbType="Date" Name="DATE_DELIVERED2" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;If there is no data being displayed, this farmer has not delivered any products between these date.</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;If you have finished viewing the product information and want to search again, click the back button.</td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" Width="71px" OnClick="btnBack_Click" />
                </td>
            </tr>
        </table>
        <br />
        </asp:Panel>
                </div>
            </body>
</asp:Content>
