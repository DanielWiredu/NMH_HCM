<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RepeatedItemsPerAttendance.aspx.cs" Inherits="NMH_HCM.UserReports.RepeatedItemsPerAttendance" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Repeated Items Per Attendance</h3>
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
                                    <label>Batch Number</label>
                                    <asp:TextBox runat="server" ID="txtBatchNo" Width="100%" ></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter Batch No" ControlToValidate="txtBatchNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div> 
                                 </div>
                                  
                             </div>
                            <div>
                                <telerik:RadGrid ID="itemGrid" runat="server" AllowPaging="true" ShowFooter="False" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="itemSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" ClipCellContentOnResize="true" ResizeGridOnColumnResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="RepeatedItems" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="itemSource" PageSize="100">
                                        <Columns>
                                         <telerik:GridBoundColumn DataField="ClaimsBatchNo" FilterControlAltText="Filter ClaimsBatchNo column" HeaderText="BatchNo" SortExpression="ClaimsBatchNo" UniqueName="ClaimsBatchNo" DataType="System.Int32">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ClaimsNo" FilterControlAltText="Filter ClaimsNo column" HeaderText="ClaimsNo" SortExpression="ClaimsNo" UniqueName="ClaimsNo">
                                            <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DateofAttendance" DataType="System.DateTime" FilterControlAltText="Filter DateofAttendance column" HeaderText="DateofAttendance" SortExpression="DateofAttendance" UniqueName="DateofAttendance" DataFormatString="{0:dd-MMM-yyyy}">
                                            <HeaderStyle Width="110px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MemberNo" FilterControlAltText="Filter MemberNo column" HeaderText="MemberNo" SortExpression="MemberNo" UniqueName="MemberNo">
                                         <HeaderStyle Width="90px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FullName" FilterControlAltText="Filter FullName column" HeaderText="FullName" SortExpression="FullName" UniqueName="FullName">
                                         <HeaderStyle Width="200px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TariffName" FilterControlAltText="Filter TariffName column" HeaderText="TariffName" SortExpression="TariffName" UniqueName="TariffName">
                                            <HeaderStyle Width="200px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="rn" FilterControlAltText="Filter rn column" HeaderText="Repeated" SortExpression="rn" UniqueName="rn" DataType="System.Int32">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="itemSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="with cte as (
select ClaimsHeader.ClaimsBatchNo, ClaimsHeader.ClaimsNo, ClaimsHeader.DateofAttendance, Vw_Members.MemberNo, Vw_Members.FullName, Tariff.TariffName, 
ROW_NUMBER() over(partition by ClaimsHeader.DateofAttendance, Vw_Members.MemberNo, Tariff.TariffName order by ClaimsHeader.ID) as [rn]
from ClaimsHeader INNER JOIN
                         ClaimsDetails1 ON ClaimsHeader.ClaimsNo = ClaimsDetails1.ClaimsNo INNER JOIN
                         Tariff ON ClaimsDetails1.ProductID = Tariff.TariffID INNER JOIN
                         Vw_Members ON ClaimsHeader.MemberID = Vw_Members.ID 
WHERE (ClaimsHeader.ClaimsBatchNo = @BatchNo) 
)
select * from cte where [rn] > 1 order by ClaimsNo">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtBatchNo" DefaultValue="0" Name="BatchNo" PropertyName="Text" Type="String" />
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
</asp:Content>
