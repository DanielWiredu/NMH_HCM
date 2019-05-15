<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewlyClosedProviders.aspx.cs" Inherits="NMH_HCM.UserReports.NewlyClosedProviders" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Newly Closed </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <%--<asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upProcess">
                           <ProgressTemplate>
                            <div class="divWaiting">            
	                            <asp:Label ID="lblWait" runat="server" Text="Processing... " />
	                              <asp:Image ID="imgWait" runat="server" ImageAlign="Top" ImageUrl="/Content/dist/img/loader.gif" />
                                </div>
                             </ProgressTemplate>
                       </asp:UpdateProgress>--%>

                 <div class="modal-content">
                        <div class="modal-body">

                            <div>
                                <telerik:RadGrid ID="newlyClosedGrid" runat="server" ShowFooter="True" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="newlyClosedSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" ClipCellContentOnResize="true" ResizeGridOnColumnResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="newlyClosedSource">
                                        <Columns>
                                            <telerik:GridBoundColumn Aggregate="Count" DataField="provider_id" DataType="System.Int32" HeaderText="provider_id" SortExpression="provider_id" UniqueName="provider_id">
                                            <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="provider_id_master" DataType="System.Int32" HeaderText="provider_id_master" SortExpression="provider_id_master" UniqueName="provider_id_master">
                                            <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="provider_name" HeaderText="provider_name" SortExpression="provider_name" UniqueName="provider_name">
                                         <HeaderStyle Width="200px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="yrofclaim" DataType="System.Int32" HeaderText="yrofclaim" SortExpression="yrofclaim" UniqueName="yrofclaim">
                                            <HeaderStyle Width="70px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="monthofclaim" DataType="System.Int32" HeaderText="monthofclaim" SortExpression="monthofclaim" UniqueName="monthofclaim">
                                            <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="provider_claim_amt" HeaderText="provider_claim_amt" SortExpression="provider_claim_amt" UniqueName="provider_claim_amt" DataType="System.Decimal">
                                            <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="number_of_claims" HeaderText="number_of_claims" SortExpression="number_of_claims" UniqueName="number_of_claims" DataType="System.Int32">
                                            <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="system_invoice_no" HeaderText="system_invoice_no" SortExpression="system_invoice_no" UniqueName="system_invoice_no">
                                            <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="date_added" HeaderText="date_added" SortExpression="date_added" UniqueName="date_added" DataType="System.DateTime">
                                         <HeaderStyle Width="150px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="type_of_facility" HeaderText="type_of_facility" SortExpression="type_of_facility" UniqueName="type_of_facility">
                                            <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="newlyClosedSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from payment_table_rx where nmhPull = 0">
                                </asp:SqlDataSource>
                            </div>
                       </div>

                <div class="modal-footer">
                    <asp:Button ID="btnRefresh" runat="server" Text="CLEAR" CssClass="btn btn-danger" OnClick="btnRefresh_Click" CausesValidation="false" />
                    <asp:Button ID="btnExcelExport" runat="server" Text="DOWNLOAD Excel" CssClass="btn btn-success" OnClick="btnExcelExport_Click" CausesValidation="false" />
                </div>
            </div>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
