<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="FindClaimWithItem.aspx.cs" Inherits="NMH_HCM.UserReports.FindClaimWithItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="/Content/dist/css/telerikCombo.css" rel="stylesheet" />
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Find Claim Using Item </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upProcess">
                           <ProgressTemplate>
                            <div class="divWaiting">            
	                            <asp:Label ID="lblWait" runat="server" Text="Processing... " />
	                              <asp:Image ID="imgWait" runat="server" ImageAlign="Top" ImageUrl="/Content/dist/img/loader.gif" />
                                </div>
                             </ProgressTemplate>
                       </asp:UpdateProgress>

                   <asp:Panel runat="server" DefaultButton="btnSearch">
            <asp:UpdatePanel runat="server" ID="upProcess">
            <ContentTemplate>
                 <div class="modal-content">
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                      <div class="col-md-6">
                                     <label>Service Provider</label>
                                     <telerik:RadComboBox ID="dlProvider" runat="server" Width="100%" DataSourceID="providerSource" MaxHeight="200" EmptyMessage="Select Provider" Filter="Contains"
                                           OnItemDataBound="dlProvider_ItemDataBound" OnDataBound="dlProvider_DataBound" OnItemsRequested="dlProvider_ItemsRequested" EnableLoadOnDemand="true"
                                            OnClientItemsRequested="UpdateProviderItemCountField" HighlightTemplatedItems="true" MarkFirstMatch="true"  >
                                            <HeaderTemplate>
                <ul>
                    <li class="ncolfull">PROVIDER</li>
                </ul>
            </HeaderTemplate>
            <ItemTemplate>
                <ul>
                    <li class="ncolfull">
                        <%# DataBinder.Eval(Container.DataItem, "facility_name")%></li>
                </ul>
            </ItemTemplate>
            <FooterTemplate>
                A total of
                <asp:Literal runat="server" ID="providerCount" />
                items
            </FooterTemplate>
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="providerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top (30) provider_id_master,facility_name FROM [ServiceProviders_RX]"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dlProvider" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                                    <div class="col-md-3">
                                    <label>Month of Attendance</label>
                                        <telerik:RadMonthYearPicker ID="dpMonth" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadMonthYearPicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpMonth" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3">
                                     <label>Item</label>
                                    <asp:TextBox runat="server" ID="txtItem" Width="100%" MaxLength="50" ></asp:TextBox>
                                     <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtItem" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div> 
                                 </div>
                                  
                             </div>

                            <asp:HiddenField runat="server" ID="hfAttendMonth" />
                            <asp:HiddenField runat="server" ID="hfAttendYear" />

                            <div>
                                <telerik:RadGrid ID="ItemsGrid" runat="server" ShowFooter="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="itemSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" OnItemCommand="ItemsGrid_ItemCommand">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="Claim_Details" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="itemSource" DataKeyNames="RowID" AllowPaging="true" PageSize="100">
                                        <Columns>
                                            <telerik:GridBoundColumn Display="false" DataField="RowID" DataType="System.Int32" FilterControlAltText="Filter RowID column" HeaderText="RowID" ReadOnly="True" SortExpression="RowID" UniqueName="RowID">
                                    <HeaderStyle Width="60px" />
                                    </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="process_claim_no" FilterControlAltText="Filter process_claim_no column" HeaderText="Claim No" SortExpression="process_claim_no" UniqueName="process_claim_no">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="member_no" FilterControlAltText="Filter member_no column" HeaderText="Member No" SortExpression="member_no" UniqueName="member_no">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="date_of_consultation" FilterControlAltText="Filter date_of_consultation column" HeaderText="Date of Consultation" SortExpression="date_of_consultation" UniqueName="date_of_consultation" DataFormatString="{0:dd-MMM-yyyy}">
                                         <HeaderStyle Width="140px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="item" FilterControlAltText="Filter item column" HeaderText="Item" SortExpression="item" UniqueName="item">
                                         <HeaderStyle Width="230px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ins_item_code" FilterControlAltText="Filter ins_item_code column" HeaderText="ins_item_code" SortExpression="ins_item_code" UniqueName="ins_item_code">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridButtonColumn Text="Set Code" CommandName="SetCode" UniqueName="SetCode" ButtonType="PushButton" ButtonCssClass="btn-warning" Exportable="false">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="itemSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select RowID, process_claim_no, member_no, date_of_consultation, item, ins_item_code from ClaimsDetails_MySql where provider_id=@provider_id and month(date_of_consultation)=@attendMonth and year(date_of_consultation)=@attendYear and (item LIKE '%' + @item + '%') order by ins_item_code">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dlProvider" Name="provider_id" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                                        <asp:ControlParameter ControlID="hfAttendMonth" DefaultValue="0" Name="attendMonth" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="hfAttendYear" DefaultValue="2000" Name="attendYear" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtItem" Name="item" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                       </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Find" CssClass="btn btn-primary"  OnClick="btnSearch_Click" />
                    <asp:Button ID="btnExcelExport" runat="server" Text="Excel" CssClass="btn btn-success" OnClick="btnExcelExport_Click" CausesValidation="false" />
                </div>
            </div>
            </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnExcelExport" />
                </Triggers>
        </asp:UpdatePanel>
        </asp:Panel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

     <!-- new modal -->
         <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Set Code </h4>
                </div>
                        <div class="modal-body">
                             <asp:HiddenField runat="server" ID="hfItemId" />
                            <%--<div class="alert alert-info" runat="server" id="lblCompany"></div>--%>
                             <div class="form-group">
                                        <label>Code</label>
                                 <asp:TextBox runat="server" ID="txtCode" Width="100%"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtCode" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdateCode" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="new" OnClick="btnUpdateCode_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

      <script type="text/javascript">
            function newModal() {
                $('#newmodal').modal('show');
            }
            function closenewModal() {
                $('#newmodal').modal('hide');
            }
    </script>

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function UpdateProviderItemCountField(sender, args) {
                //Set the footer text.
                sender.get_dropDownElement().lastChild.innerHTML = "A total of " + sender.get_items().get_count() + " items";
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
