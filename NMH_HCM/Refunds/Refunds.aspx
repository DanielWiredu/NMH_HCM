<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Refunds.aspx.cs" Inherits="NMH_HCM.Refunds.Refunds" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Refunds </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
               <%-- <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upProcess">
                           <ProgressTemplate>
                            <div class="divWaiting">            
	                            <asp:Label ID="lblWait" runat="server" Text="Processing... " />
	                              <asp:Image ID="imgWait" runat="server" ImageAlign="Top" ImageUrl="/Content/dist/img/loader.gif" />
                                </div>
                             </ProgressTemplate>
                       </asp:UpdateProgress>--%>
            <asp:UpdatePanel runat="server" ID="upProcess">
            <ContentTemplate>
                <div class="row">
                                        <div class="col-sm-4 pull-right">
                                           <asp:TextBox runat="server" ID="txtSearch" Width="100%" placeholder="Member No / MOMO No..." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                       </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <%--<asp:Button runat="server" ID="btnAdd" CssClass="btn-primary" Text="Add New" CausesValidation="false" OnClientClick="newModal()"/>--%>  
                                            </div>
                                        </div>
                                    </div>
                        <hr />

                            <telerik:RadGrid ID="refundGrid" runat="server" AllowFilteringByColumn="false" AllowSorting="True" DataSourceID="refundSource" GroupPanelPosition="Top" OnItemCommand="refundGrid_ItemCommand">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="true" ScrollHeight="400px" UseStaticHeaders="true" />
                                </ClientSettings>
                                <GroupingSettings CaseSensitive="false" />
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="refund_id" DataSourceID="refundSource" AllowPaging="true" PageSize="100">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="refund_id" DataType="System.Int32" FilterControlAltText="Filter refund_id column" HeaderText="refund_id" ReadOnly="True" SortExpression="refund_id" UniqueName="refund_id" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="40px">
                                        <HeaderStyle Width="50px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="member_no" FilterControlAltText="Filter member_no column" HeaderText="member_no" SortExpression="member_no" UniqueName="member_no" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="receipt_no" FilterControlAltText="Filter receipt_no column" HeaderText="receipt_no" SortExpression="receipt_no" UniqueName="receipt_no" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="mm_name" FilterControlAltText="Filter mm_name column" HeaderText="mm_name" SortExpression="mm_name" UniqueName="mm_name" FilterControlWidth="130px" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                        <HeaderStyle Width="150px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="mm_number" FilterControlAltText="Filter mm_number column" HeaderText="mm_number" SortExpression="mm_number" UniqueName="mm_number" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="update_time" DataType="System.DateTime" FilterControlAltText="Filter update_time column" HeaderText="update_time" SortExpression="update_time" UniqueName="update_time" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn Text="View" CommandName="View" UniqueName="View" ButtonType="PushButton" ButtonCssClass="btn-info" Exportable="false">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="refundSource" runat="server" ConnectionString="<%$ ConnectionStrings:rxConnectionString %>" ProviderName="<%$ ConnectionStrings:rxConnectionString.ProviderName %>" SelectCommand="SELECT refund_id, member_no, receipt_no, mm_name, mm_number, update_time FROM refund WHERE (member_no LIKE CONCAT('%', @SearchValue, '%') OR receipt_no LIKE CONCAT('%', @SearchValue, '%')) ORDER BY refund_id desc LIMIT 100">
                                 <SelectParameters>
                                                <asp:ControlParameter ControlID="txtSearch" Name="SearchValue" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                            </SelectParameters>
                            </asp:SqlDataSource>

            </ContentTemplate>
                <%--<Triggers>
                    <asp:PostBackTrigger ControlID="btnExcelExport" />
                </Triggers>--%>
        </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
