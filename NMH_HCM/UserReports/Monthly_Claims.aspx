<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Monthly_Claims.aspx.cs" Inherits="NMH_HCM.UserReports.Monthly_Claims" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/telerikCombo.css" rel="stylesheet" />
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Monthly Claims </h3>
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
                        <%# DataBinder.Eval(Container.DataItem, "ServiceProvider")%></li>
                </ul>
            </ItemTemplate>
            <FooterTemplate>
                A total of
                <asp:Literal runat="server" ID="providerCount" />
                items
            </FooterTemplate>
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="providerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top (30) ID, ServiceProvider FROM [ServiceProviders]"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dlProvider" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                                    <div class="col-md-6">
                                    <label>Month/Year</label>
                                        <telerik:RadMonthYearPicker ID="dpMonth" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadMonthYearPicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Select Month/Year" ControlToValidate="dpMonth" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div> 
                                 </div>
                                  
                             </div>
                            <div>
                                <telerik:RadGrid ID="claimGrid" runat="server" ShowFooter="true" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="claimSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" ClipCellContentOnResize="true" ResizeGridOnColumnResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="Monthly_Claims" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="claimSource">
                                        <Columns>
                                         <telerik:GridBoundColumn Visible="false" DataField="StampDate" FilterControlAltText="Filter StampDate column" HeaderText="StampDate" SortExpression="StampDate" UniqueName="StampDate" DataType="System.DateTime">
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Aggregate="Count" DataField="ClaimsNo" FilterControlAltText="Filter ClaimsNo column" HeaderText="Claim No" SortExpression="ClaimsNo" UniqueName="ClaimsNo">
                                         <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="DateofAttendance" FilterControlAltText="Filter DateofAttendance column" HeaderText="Date of Attendance" SortExpression="DateofAttendance" UniqueName="DateofAttendance" DataType="System.DateTime" DataFormatString="{0:dd-MMM-yyyy}">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MemberNo" FilterControlAltText="Filter MemberNo column" HeaderText="MemberNo" SortExpression="MemberNo" UniqueName="MemberNo" ReadOnly="True">
                                         <HeaderStyle Width="80px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="FullName" FilterControlAltText="Filter FullName column" HeaderText="FullName" SortExpression="FullName" UniqueName="FullName" ReadOnly="True">
                                         <HeaderStyle Width="200px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridNumericColumn DataField="ProviderAmountClaimed" FilterControlAltText="Filter ProviderAmountClaimed column" HeaderText="Amount Claimed" SortExpression="ProviderAmountClaimed" UniqueName="ProviderAmountClaimed" DataFormatString="{0:0.00}">
                                         <HeaderStyle Width="80px" />
                                         </telerik:GridNumericColumn>
                                            <telerik:GridBoundColumn Visible="false" DataField="NMH_ProviderID" DataType="System.Int32" FilterControlAltText="Filter NMH_ProviderID column" HeaderText="NMH_ProviderID" SortExpression="NMH_ProviderID" UniqueName="NMH_ProviderID">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AttendMonth" FilterControlAltText="Filter AttendMonth column" HeaderText="AttendMonth" SortExpression="AttendMonth" UniqueName="AttendMonth" DataType="System.Int32">
                                            <HeaderStyle Width="70px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AttendYear" FilterControlAltText="Filter AttendYear column" HeaderText="AttendYear" SortExpression="AttendYear" UniqueName="AttendYear" DataType="System.Int32">
                                            <HeaderStyle Width="70px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="claimSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Get_Monthly_Claims" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dlProvider" DefaultValue="0" Name="ProviderID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="dpMonth" DefaultValue="2000-01-01" Name="attendDate" PropertyName="SelectedDate" Type="DateTime" />
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

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function UpdateProviderItemCountField(sender, args) {
                //Set the footer text.
                sender.get_dropDownElement().lastChild.innerHTML = "A total of " + sender.get_items().get_count() + " items";
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
