<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ClaimsEnteredByUser.aspx.cs" Inherits="NMH_HCM.ClaimsDashboard.ClaimsEnteredByUser" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Claims Entered By User</h3>
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
                                         <label>User</label>
                                         <telerik:RadDropDownList ID="dlUser" runat="server" Width="100%" DataSourceID="userSource" DataTextField="UserName" DataValueField="ID" DefaultMessage="Select User" DropDownHeight="300px"></telerik:RadDropDownList>
                                         <asp:SqlDataSource ID="userSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [UserName] FROM [Users] WHERE Dept in (1)"></asp:SqlDataSource>
                                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Select User" ControlToValidate="dlUser" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3">
                                    <label>Start Date</label>
                                        <telerik:RadDateTimePicker ID="dpStartDate" runat="server" Width="100%"></telerik:RadDateTimePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpStartDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3">
                                     <label>End Date</label>
                                    <telerik:RadDateTimePicker ID="dpEndDate" runat="server" Width="100%"></telerik:RadDateTimePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEndDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                     <div class="col-md-3">

                    </div>
                                  
                             </div>
                            <hr />
                            <%--<asp:HiddenField runat="server" ID="hfStartDate" />
                            <asp:HiddenField runat="server" ID="hfEndDate" />--%>
                            <div class="row">
                                <telerik:RadGrid ID="claimsGrid" runat="server" AllowPaging="true" ShowFooter="False" AutoGenerateColumns="true" AllowSorting="False" DataSourceID="claimSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="400px" />
                                         <%--<Resizing AllowColumnResize="true" AllowRowResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" ClipCellContentOnResize="true" ResizeGridOnColumnResize="true" />--%>
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="Entered_Claims" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView  DataSourceID="claimSource" PageSize="50">
                                    </MasterTableView>
                                  
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="claimSource" runat="server" OnSelecting="claimSource_Selecting" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        ClaimsHeader.ClaimsBatchNo, Vw_ServiceProvider.ServiceProvider, COUNT(ClaimsHeader.ClaimsNo) AS NoOfClaims, SUM(ClaimsHeader.ProviderAmountClaimed) AS ProviderAmountClaimed
                                            FROM            ClaimsHeader INNER JOIN
                                                                     ClaimsBatch ON ClaimsHeader.ClaimsBatchNo = ClaimsBatch.ID INNER JOIN
                                                                     Vw_ServiceProvider ON ClaimsBatch.ServiceProvideID = Vw_ServiceProvider.ID
                                            WHERE        (ClaimsHeader.UserID = @UserId) AND (ClaimsHeader.StampDate BETWEEN @startdate and @enddate)
                                            GROUP BY ClaimsHeader.ClaimsBatchNo, Vw_ServiceProvider.ServiceProvider" SelectCommandType="Text">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dlUser" Name="UserId" Type="Int32" PropertyName="SelectedValue" DefaultValue="0" />
                                        <%--<asp:ControlParameter ControlID="hfStartDate" Name="startdate" Type="DateTime" PropertyName="Value" DefaultValue="2000-01-01" />
                                        <asp:ControlParameter ControlID="hfEndDate" Name="enddate" Type="DateTime" PropertyName="Value" DefaultValue="2000-01-01"/>--%>
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
