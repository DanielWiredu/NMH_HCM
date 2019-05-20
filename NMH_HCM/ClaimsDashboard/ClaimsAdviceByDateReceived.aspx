<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ClaimsAdviceByDateReceived.aspx.cs" Inherits="NMH_HCM.ClaimsDashboard.ClaimsAdviceByDateReceived" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Claims Advice By Received Date</h3>
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
                             <div class="row">
                    <div class="col-md-3">

                    </div>
                                    <div class="col-md-3">
                                    <label>Start Date</label>
                                        <telerik:RadDatePicker ID="dpStartDate" runat="server" Width="100%"></telerik:RadDatePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpStartDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3">
                                     <label>End Date</label>
                                    <telerik:RadDatePicker ID="dpEndDate" runat="server" Width="100%"></telerik:RadDatePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEndDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                     <div class="col-md-3">

                    </div>
                                  
                             </div>
                            <hr />
                            <div class="row">
                                <telerik:RadGrid ID="adviceGrid" runat="server" AllowPaging="true" ShowFooter="False" AutoGenerateColumns="true" AllowSorting="False" DataSourceID="adviceSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="400px" />
                                         <%--<Resizing AllowColumnResize="true" AllowRowResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" ClipCellContentOnResize="true" ResizeGridOnColumnResize="true" />--%>
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="AdviceSlip" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView  DataSourceID="adviceSource" PageSize="50">
                                    </MasterTableView>
                                    <%--<MasterTableView DataSourceID="adviceSource" PageSize="100">
                                        <Columns>
                                         <telerik:GridBoundColumn DataField="ClaimsBatchNo" FilterControlAltText="Filter ClaimsBatchNo column" HeaderText="BatchNo" SortExpression="ClaimsBatchNo" UniqueName="ClaimsBatchNo" DataType="System.Int32">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ClaimsNo" FilterControlAltText="Filter ClaimsNo column" HeaderText="ClaimsNo" SortExpression="ClaimsNo" UniqueName="ClaimsNo">
                                            <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="MemberNo" FilterControlAltText="Filter MemberNo column" HeaderText="MemberNo" SortExpression="MemberNo" UniqueName="MemberNo" ReadOnly="True">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FullName" FilterControlAltText="Filter FullName column" HeaderText="FullName" SortExpression="FullName" UniqueName="FullName" ReadOnly="True">
                                         <HeaderStyle Width="150px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DOB2" DataType="System.DateTime" FilterControlAltText="Filter DOB2 column" HeaderText="DOB2" SortExpression="DOB2" UniqueName="DOB2" DataFormatString="{0:MM/dd/yyyy}">
                                            <HeaderStyle Width="90px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MemberAge" FilterControlAltText="Filter MemberAge column" HeaderText="MemberAge" ReadOnly="True" SortExpression="MemberAge" UniqueName="MemberAge">
                                            <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BenefitOption" FilterControlAltText="Filter BenefitOption column" HeaderText="BenefitOption" SortExpression="BenefitOption" UniqueName="BenefitOption">
                                            <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DateofAttendance" DataType="System.DateTime" FilterControlAltText="Filter DateofAttendance column" HeaderText="DateofAttendance" SortExpression="DateofAttendance" UniqueName="DateofAttendance" DataFormatString="{0:MM/dd/yyyy}">
                                            <HeaderStyle Width="110px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Inout" FilterControlAltText="Filter Inout column" HeaderText="Inout" ReadOnly="True" SortExpression="Inout" UniqueName="Inout">
                                            <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TariffName" FilterControlAltText="Filter TariffName column" HeaderText="TariffName" SortExpression="TariffName" UniqueName="TariffName">
                                            <HeaderStyle Width="180px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Qty" DataType="System.Int32" FilterControlAltText="Filter Qty column" HeaderText="Qty" SortExpression="Qty" UniqueName="Qty">
                                            <HeaderStyle Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Claimed" DataType="System.Decimal" FilterControlAltText="Filter Claimed column" HeaderText="Claimed" SortExpression="Claimed" UniqueName="Claimed">
                                            <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ApprovedAmount" DataType="System.Decimal" FilterControlAltText="Filter ApprovedAmount column" HeaderText="Approved" SortExpression="ApprovedAmount" UniqueName="ApprovedAmount">
                                            <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Diff" DataType="System.Decimal" FilterControlAltText="Filter Diff column" HeaderText="Diff" ReadOnly="True" SortExpression="Diff" UniqueName="Diff">
                                            <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Tariff_X_RejectionComments" FilterControlAltText="Filter Tariff_X_RejectionComments column" HeaderText="Tariff_X_RejectionComments" SortExpression="Tariff_X_RejectionComments" UniqueName="Tariff_X_RejectionComments">
                                            <HeaderStyle Width="200px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Diagnosis" FilterControlAltText="Filter Diagnosis column" HeaderText="Diagnosis" SortExpression="Diagnosis" UniqueName="Diagnosis">
                                            <HeaderStyle Width="200px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DateOfClaim" DataType="System.DateTime" FilterControlAltText="Filter DateOfClaim column" HeaderText="DateOfClaim" SortExpression="DateOfClaim" UniqueName="DateOfClaim" DataFormatString="{0:MM/dd/yyyy}">
                                            <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" SortExpression="ServiceProvider" UniqueName="ServiceProvider">
                                            <HeaderStyle Width="150px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TypeName" FilterControlAltText="Filter TypeName column" HeaderText="TypeName" SortExpression="TypeName" UniqueName="TypeName">
                                            <HeaderStyle Width="150px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>--%>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="adviceSource" runat="server" OnSelecting="adviceSource_Selecting" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        ClaimsBatchNo, DateofAttendance,  Inout, DateOfClaim, SysAmountClaimed, SysAmountAwarded, ServiceType, ServiceProvider, ProviderAmountClaimed, Diagnosis, FullName, Company,
                                                [Plan], RowID, ClaimsNo, TariffName, Tariff_X_RejectionComments, Claimed, Qty, ApprovedAmount, PrescribedDrug, DatePrescribed, QtyPrescribed, Gender, DOB2, MemberAge, BenefitOption, Diff, 
                                                TypeName, MemberNo, StatusID
                                                FROM            Vw_AdviceSlip_Outcome
                                                WHERE        (DateOfClaim BETWEEN @startdate and @enddate)" SelectCommandType="Text">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" DefaultValue="2000-01-01" />
                                        <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" DefaultValue="2000-01-01"/>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                       </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Run" CssClass="btn btn-primary" Visible="false"  OnClick="btnSearch_Click" />
                    <asp:Button ID="btnExcelExport" runat="server" Text="Run & Export" CssClass="btn btn-success" OnClick="btnExcelExport_Click" CausesValidation="true" />
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
