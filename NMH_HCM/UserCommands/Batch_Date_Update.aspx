<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Batch_Date_Update.aspx.cs" Inherits="NMH_HCM.UserCommands.Batch_Date_Update" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Batch Date Update</h3>
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
                                        <label>Batch No</label>
                                       <asp:TextBox runat="server" ID="txtBatchNo" Width="100%" MaxLength="50" ></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter Batch No" ControlToValidate="txtBatchNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             </div>
                            <div>
                                <telerik:RadGrid ID="BatchGrid" runat="server" ShowFooter="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="batchSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" OnItemCommand="BatchGrid_ItemCommand">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="Claim_Details" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="batchSource">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="Batch No" SortExpression="ID" UniqueName="ID">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ServiceProvideID" FilterControlAltText="Filter ServiceProvideID column" HeaderText="Provider ID" SortExpression="ServiceProvideID" UniqueName="ServiceProvideID">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="NoOfClaims" FilterControlAltText="Filter NoOfClaims column" HeaderText="NoOfClaims" SortExpression="NoOfClaims" UniqueName="NoOfClaims">
                                         <HeaderStyle Width="60px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="AmountClaimed" FilterControlAltText="Filter AmountClaimed column" HeaderText="AmountClaimed" SortExpression="AmountClaimed" UniqueName="AmountClaimed">
                                         <HeaderStyle Width="80px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="StatusID" FilterControlAltText="Filter StatusID column" HeaderText="StatusID" SortExpression="StatusID" UniqueName="StatusID">
                                         <HeaderStyle Width="60px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="MonthOfClaimFrom" FilterControlAltText="Filter MonthOfClaimFrom column" HeaderText="Month" SortExpression="MonthOfClaimFrom" UniqueName="MonthOfClaimFrom">
                                         <HeaderStyle Width="50px" />
                                         </telerik:GridBoundColumn>
                                          <telerik:GridBoundColumn DataField="YearFrom" FilterControlAltText="Filter YearFrom column" HeaderText="Year" SortExpression="YearFrom" UniqueName="YearFrom">
                                         <HeaderStyle Width="50px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridDateTimeColumn DataField="DateOfClaim" FilterControlAltText="Filter DateOfClaim column" HeaderText="DateOfClaim" SortExpression="DateOfClaim" UniqueName="DateOfClaim">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridDateTimeColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn-warning" Text="Edit" CommandName="ChangeDate" ButtonType="PushButton" UniqueName="ChangeDate">
                                                <HeaderStyle Width="60px" />
                                            </telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="batchSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID,ServiceProvideID,NoOfClaims,AmountClaimed,StatusID,MonthOfClaimFrom,YearFrom,DateOfClaim FROM ClaimsBatch WHERE ID = @BatchNo OR RefBatchNo = @BatchNo">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtBatchNo" DefaultValue="0" Name="BatchNo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                       </div>
                     <div class="modal-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Find" CssClass="btn btn-primary"  OnClick="btnSearch_Click" />
                </div>
            </div>
            </ContentTemplate>
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
                    <h4 class="modal-title">Date of Claim </h4>
                </div>
                        <div class="modal-body">
                             <asp:HiddenField runat="server" ID="hfBatchNo" />
                             <div class="form-group">
                                        <label>Date</label>
                                 <telerik:RadDatePicker ID="dpDateOfClaim" Width="100%" runat="server" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpDateOfClaim" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdateDate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="new" OnClick="btnUpdateDate_Click" />
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
</asp:Content>
