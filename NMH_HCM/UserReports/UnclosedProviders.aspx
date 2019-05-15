<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UnclosedProviders.aspx.cs" Inherits="NMH_HCM.UserReports.UnclosedProviders" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <div class="col-md-12">
                                    <label>Month/Year</label>
                                        <telerik:RadMonthYearPicker ID="dpMonth" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadMonthYearPicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Select Month/Year" ControlToValidate="dpMonth" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div> 
                                 </div>
                                  
                             </div>
                            <div>
                                <telerik:RadGrid ID="providerGrid" runat="server" ShowFooter="true" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="providerSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="UnclosedProviders" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="providerSource">
                                        <Columns>
                                            <telerik:GridBoundColumn Aggregate="Count" DataField="facility_name" FilterControlAltText="Filter facility_name column" HeaderText="Facility Name" SortExpression="facility_name" UniqueName="facility_name">
                                         <HeaderStyle Width="300px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="providerSource" runat="server" ConnectionString="<%$ ConnectionStrings:rxConnectionString %>" ProviderName="<%$ ConnectionStrings:rxConnectionString.ProviderName %>" SelectCommand="SELECT a.facility_name, b.provider_name, b.id FROM provider_api a LEFT JOIN (SELECT id, provider_id, provider_name FROM payment_table WHERE yrofclaim = @yrofclaim AND monthofclaim = @monthofclaim) b ON a.provider_id = b.provider_id where b.id is null">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hfYearofClaim" DefaultValue="2000" Name="yrofclaim" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="hfMonthOfClaim" DefaultValue="00" Name="monthofclaim" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                       </div>
                     <asp:HiddenField runat="server" ID="hfYearofClaim" />
                     <asp:HiddenField runat="server" ID="hfMonthOfClaim" />
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
</asp:Content>
