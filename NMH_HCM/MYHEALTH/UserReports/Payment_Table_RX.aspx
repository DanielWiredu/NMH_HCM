<%@ Page Title="" Language="C#" MasterPageFile="~/MYHEALTH/MyHealthHome.Master" AutoEventWireup="true" CodeBehind="Payment_Table_RX.aspx.cs" Inherits="NMH_HCM.MYHEALTH.UserReports.Payment_Table_RX" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Closed Accounts </h3>
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
                 <div class="modal-content">
                        <div class="modal-body">
                          
                            <telerik:RadGrid ID="invoiceGrid" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="invoiceSource" GroupPanelPosition="Top">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="true" ScrollHeight="400px" UseStaticHeaders="true" />
                                </ClientSettings>
                                <GroupingSettings CaseSensitive="false" />
                                <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" HideStructureColumns="true">

                                    </ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="invoiceSource" AllowPaging="true" PageSize="20">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="id" DataType="System.Double" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="40px">
                                        <HeaderStyle Width="50px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="provider_id" DataType="System.Int32" FilterControlAltText="Filter provider_id column" HeaderText="provider_id" SortExpression="provider_id" UniqueName="provider_id" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="60px">
                                        <HeaderStyle Width="80px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="provider_id_master" DataType="System.Int32" FilterControlAltText="Filter provider_id_master column" HeaderText="provider_id_master" SortExpression="provider_id_master" UniqueName="provider_id_master" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="provider_name" FilterControlAltText="Filter provider_name column" HeaderText="provider_name" SortExpression="provider_name" UniqueName="provider_name" FilterControlWidth="130px" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                        <HeaderStyle Width="150px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="yrofclaim" DataType="System.Int32" FilterControlAltText="Filter yrofclaim column" HeaderText="year" SortExpression="yrofclaim" UniqueName="yrofclaim" FilterControlWidth="40px" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                        <HeaderStyle Width="50px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="monthofclaim" DataType="System.Int32" FilterControlAltText="Filter monthofclaim column" HeaderText="month" SortExpression="monthofclaim" UniqueName="monthofclaim" FilterControlWidth="40px" ShowFilterIcon="false" AutoPostBackOnFilter="true">
                                        <HeaderStyle Width="50px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="provider_claim_amt" DataType="System.Double" FilterControlAltText="Filter provider_claim_amt column" HeaderText="Amount" SortExpression="provider_claim_amt" UniqueName="provider_claim_amt" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="50px">
                                        <HeaderStyle Width="70px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="number_of_claims" DataType="System.Int32" FilterControlAltText="Filter number_of_claims column" HeaderText="No of claims" SortExpression="number_of_claims" UniqueName="number_of_claims" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="50px">
                                        <HeaderStyle Width="70px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="system_invoice_no" FilterControlAltText="Filter system_invoice_no column" HeaderText="system_invoice_no" SortExpression="system_invoice_no" UniqueName="system_invoice_no" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="date_added" DataType="System.DateTime" FilterControlAltText="Filter date_added column" HeaderText="date_added" SortExpression="date_added" UniqueName="date_added" DataFormatString="{0:dd-MMM-yyyy}" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="type_of_facility" FilterControlAltText="Filter type_of_facility column" HeaderText="type_of_facility" SortExpression="type_of_facility" UniqueName="type_of_facility" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="invoiceSource" runat="server" ConnectionString="<%$ ConnectionStrings:myHealthDBConnectionString %>" SelectCommand="SELECT [id], [provider_id], [provider_id_master], [provider_name], [yrofclaim], [monthofclaim], [provider_claim_amt], [number_of_claims], [system_invoice_no], [date_added], [type_of_facility] FROM [payment_table_rx]"></asp:SqlDataSource>

                       </div>

                <div class="modal-footer">
                    <asp:Button ID="btnExcelExport" runat="server" Text="Excel" CssClass="btn btn-success" OnClick="btnExcelExport_Click" CausesValidation="false" />
                </div>
            </div>
            </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnExcelExport" />
                </Triggers>
        </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
