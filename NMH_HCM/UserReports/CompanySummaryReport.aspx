<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CompanySummaryReport.aspx.cs" Inherits="NMH_HCM.UserReports.CompanySummaryReport" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Company Summary</h3>
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

            <asp:UpdatePanel runat="server" ID="upProcess">
            <ContentTemplate>
                 <div class="modal-content">
                        <div class="modal-body">
                            <div>
                                <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="true">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                    </ClientSettings>
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="CompanyID" DataType="System.Int32" FilterControlAltText="Filter CompanyID column" HeaderText="CompanyID" SortExpression="CompanyID" UniqueName="CompanyID">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" HeaderText="Company" SortExpression="Company" UniqueName="Company">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Visible="false" DataField="CoCare" DataType="System.Int32" FilterControlAltText="Filter CoCare column" HeaderText="CoCare" SortExpression="CoCare" UniqueName="CoCare">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Visible="false" DataField="EXECoCare" DataType="System.Int32" FilterControlAltText="Filter EXECoCare column" HeaderText="EXECoCare" SortExpression="EXECoCare" UniqueName="EXECoCare">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Visible="false" DataField="Standard" DataType="System.Int32" FilterControlAltText="Filter Standard column" HeaderText="Standard" SortExpression="Standard" UniqueName="Standard">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Essential" DataType="System.Int32" FilterControlAltText="Filter Essential column" HeaderText="Essential" SortExpression="Essential" UniqueName="Essential">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Executive" DataType="System.Int32" FilterControlAltText="Filter Executive column" HeaderText="Executive" SortExpression="Executive" UniqueName="Executive">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Premier" DataType="System.Int32" FilterControlAltText="Filter Premier column" HeaderText="Premier" SortExpression="Premier" UniqueName="Premier">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PremierLister" DataType="System.Int32" FilterControlAltText="Filter PremierLister column" HeaderText="PremierLister" SortExpression="PremierLister" UniqueName="PremierLister">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PremierPlus" DataType="System.Int32" FilterControlAltText="Filter PremierPlus column" HeaderText="PremierPlus" SortExpression="PremierPlus" UniqueName="PremierPlus">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Privilege" DataType="System.Int32" FilterControlAltText="Filter Privilege column" HeaderText="Privilege" SortExpression="Privilege" UniqueName="Privilege">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="International" DataType="System.Int32" FilterControlAltText="Filter International column" HeaderText="International" SortExpression="International" UniqueName="International">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="InitialJoin_Date" DataType="System.DateTime" FilterControlAltText="Filter InitialJoin_Date column" HeaderText="InitialJoin_Date" SortExpression="InitialJoin_Date" UniqueName="InitialJoin_Date" DataFormatString="{0:dd-MMM-yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PolicyStartDate" DataType="System.DateTime" FilterControlAltText="Filter PolicyStartDate column" HeaderText="PolicyStartDate" SortExpression="PolicyStartDate" UniqueName="PolicyStartDate" DataFormatString="{0:dd-MMM-yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PolicyEndDate" DataType="System.DateTime" FilterControlAltText="Filter PolicyEndDate column" HeaderText="PolicyEndDate" SortExpression="PolicyEndDate" UniqueName="PolicyEndDate" DataFormatString="{0:dd-MMM-yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ContactPerson" FilterControlAltText="Filter ContactPerson column" HeaderText="ContactPerson" SortExpression="ContactPerson" UniqueName="ContactPerson">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ContactNumber" FilterControlAltText="Filter ContactNumber column" HeaderText="ContactNumber" SortExpression="ContactNumber" UniqueName="ContactNumber">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PostalAddress" FilterControlAltText="Filter PostalAddress column" HeaderText="PostalAddress" SortExpression="PostalAddress" UniqueName="PostalAddress">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Business" FilterControlAltText="Filter Business column" HeaderText="Business" SortExpression="Business" UniqueName="Business">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Vw_Companies_Summary]"></asp:SqlDataSource>
                            </div>
                       </div>
                     <div class="modal-footer">
                    <asp:Button ID="btnExcel" runat="server" Text="EXCEL" CssClass="btn btn-success" OnClick="btnExcel_Click" />
                </div>
            </div>
            </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnExcel" />
                </Triggers>
        </asp:UpdatePanel>

            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
