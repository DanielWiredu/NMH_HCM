<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RefundDetails.aspx.cs" Inherits="NMH_HCM.Refunds.RefundDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Refund Details </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                           <div class="form-group">
                               <div class="row">
                                   <div class="col-md-3">
                                       <label>Refund ID</label>
                                       <asp:TextBox runat="server" ID="txtRefundId" Width="100%" Enabled="false"></asp:TextBox>
                                   </div>
                                   <div class="col-md-3">
                                       <label>Receipt No</label>
                                       <asp:TextBox runat="server" ID="txtReceiptNo" Width="100%" Enabled="false"></asp:TextBox>
                                   </div>
                                   <div class="col-md-6">
                                       <label>Update Time</label>
                                       <asp:TextBox runat="server" ID="txtUpdateTime" Width="100%" Enabled="false"></asp:TextBox>
                                   </div>
                               </div>
                           </div>
                        <div class="form-group">
                               <div class="row">
                                   <div class="col-md-3">
                                       <label>Member No</label>
                                       <asp:TextBox runat="server" ID="txtMemberNo" Width="100%" Enabled="false"></asp:TextBox>
                                   </div>
                                   <div class="col-md-3">
                                       <label>MOMO Number</label>
                                       <asp:TextBox runat="server" ID="txtMMNumber" Width="100%" Enabled="false"></asp:TextBox>
                                   </div>
                                   <div class="col-md-6">
                                       <label>MOMO Name</label>
                                       <asp:TextBox runat="server" ID="txtMMName" Width="100%" Enabled="false"></asp:TextBox>
                                   </div>
                               </div>
                           </div> 
                        
                        <hr />

                        <telerik:RadGrid ID="refundItemGrid" runat="server" ShowFooter="true" AllowSorting="True" DataSourceID="refundItemSource" GroupPanelPosition="Top">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="true" ScrollHeight="200px" UseStaticHeaders="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="refundItemSource" AllowAutomaticDeletes="false" PageSize="50">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id" Aggregate="Count" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id">
                                    <HeaderStyle Width="60px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="receipt_no" FilterControlAltText="Filter receipt_no column" HeaderText="receipt_no" SortExpression="receipt_no" UniqueName="receipt_no">
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="item_desc" FilterControlAltText="Filter item_desc column" HeaderText="Description" SortExpression="item_desc" UniqueName="item_desc">
                                     <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="amount" DataType="System.Double" FilterControlAltText="Filter amount column" HeaderText="Amount" SortExpression="amount" UniqueName="amount" DataFormatString="{0:N2}">
                                     <HeaderStyle Width="70px" />
                                     </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="reason" FilterControlAltText="Filter reason column" HeaderText="reason" SortExpression="reason" UniqueName="reason">
                                     <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                                        </telerik:RadGrid>
                                        <asp:SqlDataSource ID="refundItemSource" runat="server" ConnectionString="<%$ ConnectionStrings:rxConnectionString %>" ProviderName="<%$ ConnectionStrings:rxConnectionString.ProviderName %>"  SelectCommand="SELECT id, receipt_no, item_desc, amount, reason FROM refund_items WHERE refund_id = @refund_id ORDER BY id DESC LIMIT 100">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtRefundId" Name="refund_id" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" DefaultValue="0" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>    
                        
                        <hr />
                        
                        <telerik:RadGrid ID="refundFileGrid" runat="server" ShowFooter="true" AllowSorting="True" DataSourceID="refundFileSource" GroupPanelPosition="Top">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="true" ScrollHeight="200px" UseStaticHeaders="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="refundFileSource" AllowAutomaticDeletes="false" PageSize="50">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id" Aggregate="Count" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id">
                                    <HeaderStyle Width="60px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridImageColumn DataType="System.String" DataImageUrlFields="filepath" AlternateText="Refund File" DataAlternateTextField="member_no" ImageAlign="Middle" ImageHeight="100px" ImageWidth="102px" HeaderText="Refund File">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridImageColumn>
                                    <telerik:GridBoundColumn DataField="timeuploaded" DataType="System.DateTime" FilterControlAltText="Filter timeuploaded column" HeaderText="timeuploaded" SortExpression="timeuploaded" UniqueName="timeuploaded">
                                    <HeaderStyle Width="140px" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                                        </telerik:RadGrid>
                                        <asp:SqlDataSource ID="refundFileSource" runat="server" ConnectionString="<%$ ConnectionStrings:rxConnectionString %>" ProviderName="<%$ ConnectionStrings:rxConnectionString.ProviderName %>" SelectCommand="SELECT id, member_no, filepath, timeuploaded FROM refund_files WHERE refund_id = @refund_id ORDER BY id DESC LIMIT 100">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtRefundId" Name="refund_id" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" DefaultValue="0" />
                                            </SelectParameters>
                                        </asp:SqlDataSource> 
                               
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnReturn" CssClass="btn btn-warning" Text="Return" PostBackUrl="~/Refunds/Refunds.aspx" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
