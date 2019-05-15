<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Check_ClaimItems.aspx.cs" Inherits="NMH_HCM.UserReports.Check_ClaimItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Claim Items </h3>
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
                                        <label>Claim No</label>
                                       <asp:TextBox runat="server" ID="txtClaimNo" Width="100%" MaxLength="50" ></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter ClaimNo" ControlToValidate="txtClaimNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             </div>
                            <div>
                                <telerik:RadGrid ID="ItemsGrid" runat="server" ShowFooter="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="itemSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="Claim_Details" HideStructureColumns="true">

                                    </ExportSettings>
                                    <MasterTableView DataSourceID="itemSource">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="process_claim_no" FilterControlAltText="Filter process_claim_no column" HeaderText="Claim No" SortExpression="process_claim_no" UniqueName="process_claim_no">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="member_no" FilterControlAltText="Filter member_no column" HeaderText="Member No" SortExpression="member_no" UniqueName="member_no">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="date_of_consultation" FilterControlAltText="Filter date_of_consultation column" HeaderText="Date of Consultation" SortExpression="date_of_consultation" UniqueName="date_of_consultation" DataFormatString="{0:dd-MMM-yyyy}">
                                         <HeaderStyle Width="140px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="type_of_visit" FilterControlAltText="Filter type_of_visit column" HeaderText="Type Of Visit" SortExpression="type_of_visit" UniqueName="type_of_visit">
                                         <HeaderStyle Width="90px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="item" FilterControlAltText="Filter item column" HeaderText="Item" SortExpression="item" UniqueName="item">
                                         <HeaderStyle Width="230px" />
                                         </telerik:GridBoundColumn>
                                          <telerik:GridBoundColumn DataField="diagnosis" FilterControlAltText="Filter diagnosis column" HeaderText="diagnosis" SortExpression="diagnosis" UniqueName="diagnosis">
                                         <HeaderStyle Width="230px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridNumericColumn DataField="qty" FilterControlAltText="Filter qty column" HeaderText="Qty" SortExpression="qty" UniqueName="qty">
                                         <HeaderStyle Width="50px" />
                                         </telerik:GridNumericColumn>
                                          <telerik:GridNumericColumn DataField="unit_price" FilterControlAltText="Filter unit_price column" HeaderText="Unit Price" SortExpression="unit_price" UniqueName="unit_price" DataFormatString="{0:0.00}">
                                         <HeaderStyle Width="80px" />
                                         </telerik:GridNumericColumn>
                                          <telerik:GridCalculatedColumn DataType="System.Double" Aggregate="Sum" FooterText="Total : " HeaderText="Amount" DataFields="qty, unit_price" Expression="{0}*{1}" HeaderStyle-Width="80px" DataFormatString="{0:0.00}" />
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="itemSource" runat="server" ConnectionString="<%$ ConnectionStrings:rxConnectionString %>" ProviderName="<%$ ConnectionStrings:rxConnectionString.ProviderName %>" SelectCommand="SELECT process_claim_no, member_no, type_of_visit, date_of_consultation, item, diagnosis, qty, unit_price FROM claims_details WHERE process_claim_no = @process_claim_no">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtClaimNo" DefaultValue="X" Name="process_claim_no" PropertyName="Text" Type="String" />
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
