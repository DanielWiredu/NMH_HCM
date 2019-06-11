<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProviderClaimMembersMonthly.aspx.cs" Inherits="NMH_HCM.StatsDashboard.ProviderClaimMembersMonthly" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Service Providers Month-On-Month Claims By Attendance</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <div class="form-group">
                          <div class="row">
                              <div class="col-md-1">

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
                                         <label>Service Type</label>
                                         <telerik:RadDropDownList ID="dlServiceType" runat="server" Width="100%" DataSourceID="serviceTypeSource" DataTextField="ServiceType" DataValueField="ID" DefaultMessage="Select Service Type"></telerik:RadDropDownList>
                                         <asp:SqlDataSource ID="serviceTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [ServiceType] FROM [ServiceType]"></asp:SqlDataSource>
                                         <%--<asp:RequiredFieldValidator runat="server" ErrorMessage="Select Service Type" ControlToValidate="dlServiceType" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                    </div>
                              <div class="col-md-1">
                                        <label>Click</label>
                                         <asp:Button runat="server" ID="btnRun" Text="Run" CssClass="btn-success" OnClick="btnRun_Click" Width="100%" />
                                    </div>
                          </div>
                      </div>

                <div class="bg-purple"> Distinct Members</div>
                 
              <telerik:RadGrid ID="claimsGrid" runat="server" AllowPaging="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="claimSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="300px" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="claimSummary" HideStructureColumns="true">
                                    </ExportSettings>
                                    <MasterTableView DataSourceID="claimSource" PageSize="100">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" SortExpression="ServiceProvider" UniqueName="ServiceProvider">
                                                <HeaderStyle Width="250px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jan"  HeaderText="Jan" SortExpression="Jan" UniqueName="Jan" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Feb" HeaderText="Feb" SortExpression="Feb" UniqueName="Feb" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Mar" HeaderText="Mar" SortExpression="Mar" UniqueName="Mar" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Apr" HeaderText="Apr" SortExpression="Apr" UniqueName="Apr" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="May" HeaderText="May" SortExpression="May" UniqueName="May" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jun" HeaderText="Jun" SortExpression="Jun" UniqueName="Jun" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jul" HeaderText="Jul" SortExpression="Jul" UniqueName="Jul" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Aug" HeaderText="Aug" SortExpression="Aug" UniqueName="Aug" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Sep" HeaderText="Sep" SortExpression="Sep" UniqueName="Sep" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Oct" HeaderText="Oct" SortExpression="Oct" UniqueName="Oct" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Nov" HeaderText="Nov" SortExpression="Nov" UniqueName="Nov" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Dec" HeaderText="Dec" SortExpression="Dec" UniqueName="Dec" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
             <asp:SqlDataSource ID="claimSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetProviderMonthOnMonthClaimMembers" SelectCommandType="StoredProcedure" OnSelecting="claimSource_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" DefaultValue="2000-01-01" />
                     <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" DefaultValue="2000-01-01"  />
                     <asp:ControlParameter ControlID="dlServiceType" Name="servicetypeId" PropertyName="SelectedValue" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                 </SelectParameters>
                </asp:SqlDataSource>
             
                <div class="modal-footer">
                    <asp:Button ID="btnExcelExport" runat="server" Text="Excel" CssClass="btn-success" OnClick="btnExcelExport_Click" CausesValidation="false" />
                </div>
      

                <div class="bg-fuchsia"> Number of Claims</div>
                 
              <telerik:RadGrid ID="claimNumbersGrid" runat="server" AllowPaging="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="claimNumberSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="300px" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="claimNumberSummary" HideStructureColumns="true">
                                    </ExportSettings>
                                    <MasterTableView DataSourceID="claimNumberSource" PageSize="100">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" SortExpression="ServiceProvider" UniqueName="ServiceProvider">
                                                <HeaderStyle Width="250px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jan"  HeaderText="Jan" SortExpression="Jan" UniqueName="Jan" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Feb" HeaderText="Feb" SortExpression="Feb" UniqueName="Feb" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Mar" HeaderText="Mar" SortExpression="Mar" UniqueName="Mar" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Apr" HeaderText="Apr" SortExpression="Apr" UniqueName="Apr" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="May" HeaderText="May" SortExpression="May" UniqueName="May" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jun" HeaderText="Jun" SortExpression="Jun" UniqueName="Jun" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jul" HeaderText="Jul" SortExpression="Jul" UniqueName="Jul" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Aug" HeaderText="Aug" SortExpression="Aug" UniqueName="Aug" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Sep" HeaderText="Sep" SortExpression="Sep" UniqueName="Sep" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Oct" HeaderText="Oct" SortExpression="Oct" UniqueName="Oct" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Nov" HeaderText="Nov" SortExpression="Nov" UniqueName="Nov" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Dec" HeaderText="Dec" SortExpression="Dec" UniqueName="Dec" EmptyDataText="0.00" DataFormatString="{0:N0}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
             <asp:SqlDataSource ID="claimNumberSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetProviderMonthOnMonthNoOfClaims" SelectCommandType="StoredProcedure" OnSelecting="claimNumberSource_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" DefaultValue="2000-01-01" />
                     <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" DefaultValue="2000-01-01"  />
                     <asp:ControlParameter ControlID="dlServiceType" Name="servicetypeid" PropertyName="SelectedValue" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                 </SelectParameters>
                </asp:SqlDataSource>
             
                <div class="modal-footer">
                    <asp:Button ID="btnExcelExportClaimNumbers" runat="server" Text="Excel" CssClass="btn-success" OnClick="btnExcelExportClaimNumbers_Click" CausesValidation="false" />
                </div>

                <div class="bg-red"> Claim Amount</div>
                 
              <telerik:RadGrid ID="claimAmountGrid" runat="server" AllowPaging="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="claimAmountSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="300px" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="claimAmountSummary" HideStructureColumns="true">
                                    </ExportSettings>
                                    <MasterTableView DataSourceID="claimAmountSource" PageSize="100">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" SortExpression="ServiceProvider" UniqueName="ServiceProvider">
                                                <HeaderStyle Width="250px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jan"  HeaderText="Jan" SortExpression="Jan" UniqueName="Jan" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Feb" HeaderText="Feb" SortExpression="Feb" UniqueName="Feb" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Mar" HeaderText="Mar" SortExpression="Mar" UniqueName="Mar" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Apr" HeaderText="Apr" SortExpression="Apr" UniqueName="Apr" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="May" HeaderText="May" SortExpression="May" UniqueName="May" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jun" HeaderText="Jun" SortExpression="Jun" UniqueName="Jun" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Jul" HeaderText="Jul" SortExpression="Jul" UniqueName="Jul" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Aug" HeaderText="Aug" SortExpression="Aug" UniqueName="Aug" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Sep" HeaderText="Sep" SortExpression="Sep" UniqueName="Sep" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Oct" HeaderText="Oct" SortExpression="Oct" UniqueName="Oct" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Nov" HeaderText="Nov" SortExpression="Nov" UniqueName="Nov" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Dec" HeaderText="Dec" SortExpression="Dec" UniqueName="Dec" EmptyDataText="0.00" DataFormatString="{0:N02}">
                                                <HeaderStyle Width="80px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
             <asp:SqlDataSource ID="claimAmountSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetProviderMonthOnMonthClaimAmount" SelectCommandType="StoredProcedure" OnSelecting="claimAmountSource_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" DefaultValue="2000-01-01" />
                     <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" DefaultValue="2000-01-01"  />
                     <asp:ControlParameter ControlID="dlServiceType" Name="servicetypeid" PropertyName="SelectedValue" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                 </SelectParameters>
                </asp:SqlDataSource>
             
                <div class="modal-footer">
                    <asp:Button ID="btnExcelExportClaimAmount" runat="server" Text="Excel" CssClass="btn-success" OnClick="btnExcelExportClaimAmount_Click" CausesValidation="false" />
                </div>

            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
