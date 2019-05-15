<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Monthly_Claim_Prescriptions.aspx.cs" Inherits="NMH_HCM.UserReports.Monthly_Claim_Prescriptions" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/telerikCombo.css" rel="stylesheet" />
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Monthly Claim Prescriptions </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:UpdatePanel runat="server" ID="upMain">
                    <ContentTemplate>
                         <div class="row">
                    <div class="col-sm-8">
                        <!-- START panel-->
                        <div class="panel panel-default">
                            <div class="panel-heading">Claims</div>
                            <div class="panel-body">
                                 <div class="form-group">
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
                                    <div class="form-group">
                                    <label>Month/Year</label>
                                        <telerik:RadMonthYearPicker ID="dpMonth" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadMonthYearPicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Select Month/Year" ControlToValidate="dpMonth" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                               
                                   
                                    <div class="row">
                                <telerik:RadGrid ID="claimGrid" runat="server" ShowFooter="true" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="claimSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" OnItemCommand="claimGrid_ItemCommand">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="300px" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" ClipCellContentOnResize="true" ResizeGridOnColumnResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="Monthly_Claims" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="claimSource">
                                        <Columns>
                                         <telerik:GridBoundColumn Visible="false" DataField="StampDate" FilterControlAltText="Filter StampDate column" HeaderText="StampDate" SortExpression="StampDate" UniqueName="StampDate" DataType="System.DateTime">
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Aggregate="Count" Display="false" DataField="ClaimsNo" HeaderText="Claim No" SortExpression="ClaimsNo" UniqueName="ClaimsNo">
                                         <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridButtonColumn DataTextField="ClaimsNo" ButtonType="LinkButton" CommandName="Select" HeaderText="ClaimsNo">
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle ForeColor="SteelBlue" Font-Underline="true" />
                                         </telerik:GridButtonColumn>
                                         <telerik:GridBoundColumn DataField="DateofAttendance" FilterControlAltText="Filter DateofAttendance column" HeaderText="Date of Attendance" SortExpression="DateofAttendance" UniqueName="DateofAttendance" DataType="System.DateTime" DataFormatString="{0:dd-MMM-yyyy}">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn Aggregate="Count" DataField="MemberNo" FilterControlAltText="Filter MemberNo column" HeaderText="MemberNo" SortExpression="MemberNo" UniqueName="MemberNo" ReadOnly="True">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="FullName" FilterControlAltText="Filter FullName column" HeaderText="FullName" SortExpression="FullName" UniqueName="FullName" ReadOnly="True">
                                         <HeaderStyle Width="230px" />
                                         </telerik:GridBoundColumn>
                                            <%--<telerik:GridNumericColumn DataField="ProviderAmountClaimed" FilterControlAltText="Filter ProviderAmountClaimed column" HeaderText="Amount Claimed" SortExpression="ProviderAmountClaimed" UniqueName="ProviderAmountClaimed" DataFormatString="{0:0.00}">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridNumericColumn>--%>
                                            <telerik:GridBoundColumn Visible="false" DataField="NMH_ProviderID" DataType="System.Int32" FilterControlAltText="Filter NMH_ProviderID column" HeaderText="NMH_ProviderID" SortExpression="NMH_ProviderID" UniqueName="NMH_ProviderID">
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
                                    <div class="modal-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Find" CssClass="btn btn-primary"  OnClick="btnSearch_Click" />
                    <%--<asp:Button ID="btnExcelExport" runat="server" Text="Excel" CssClass="btn btn-success" OnClick="btnExcelExport_Click" CausesValidation="false" />--%>
                </div>
                                
                                
                            </div>
                        </div>
                        <!-- END panel-->
                    </div>
                    <div class="col-sm-4">
                        <!-- START panel-->
                        <div class="panel panel-default">
                            <div class="panel-heading">Prescription</div>
                            <div class="panel-body">
                                <div class="row">
                                    <asp:HiddenField runat="server" ID="hfClaimNo" />
                                    <telerik:RadGrid ID="prescriptioneGrid" runat="server" ShowFooter="true" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataSourceID="prescriptionSource" GridLines="Both">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="450px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                                 <MasterTableView DataKeyNames="Id" DataSourceID="prescriptionSource" AllowAutomaticDeletes="true">
                                     <Columns>
                                         <telerik:GridBoundColumn Display="true" Aggregate="Count" DataField="Id" DataType="System.Int32" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
                                         <HeaderStyle Width="80px" />
                                         </telerik:GridBoundColumn>
                                         <%--<telerik:GridBoundColumn DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" UniqueName="ImagePath">
                                         <HeaderStyle Width="300px" />
                                         </telerik:GridBoundColumn>--%>
                                         <telerik:GridImageColumn DataType="System.String" DataImageUrlFields="prescription_document" AlternateText="Prescription" DataAlternateTextField="process_claim_no" ImageAlign="Middle" ImageHeight="150px" ImageWidth="154px" HeaderText="Prescription">
                                         <HeaderStyle Width="200px" />
                                         </telerik:GridImageColumn>
                                    <%--<telerik:GridButtonColumn Text="View" CommandName="View" UniqueName="View" ButtonType="LinkButton" Exportable="false">
                                        <HeaderStyle Width="50px" />
                                        <ItemStyle ForeColor="Green" Font-Underline="true" />
                                    </telerik:GridButtonColumn>--%>
                                     </Columns>
                                 </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="prescriptionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  SelectCommand="SELECT process_claim_no, id, prescription_document FROM [Prescriptions] WHERE process_claim_no = @ClaimNo">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfClaimNo" Name="ClaimNo" PropertyName="Value" Type="String" ConvertEmptyStringToNull="false" />
                                <%--<asp:ControlParameter ControlID="claimGrid" Name="ClaimNo" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />--%>
                            </SelectParameters>
                        </asp:SqlDataSource>
                                </div>

                            </div>
                        </div>
                        <!-- END panel-->
                    </div>
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

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
