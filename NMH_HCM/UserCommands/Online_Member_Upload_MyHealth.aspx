<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Online_Member_Upload_MyHealth.aspx.cs" Inherits="NMH_HCM.UserCommands.Online_Member_Upload_MyHealth" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Online Member Upload </h3>
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

                   <asp:Panel runat="server" DefaultButton="btnProcess">
            <asp:UpdatePanel runat="server" ID="upProcess">
            <ContentTemplate>
                 <div class="modal-content">
                        <div class="modal-body">
                             <%--<div class="form-group">
                                        <label>Claim No</label>
                                       <asp:TextBox runat="server" ID="txtClaimNo" Width="100%" MaxLength="50" ></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter ClaimNo" ControlToValidate="txtClaimNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             </div>--%>
                            <div>
                                <telerik:RadGrid ID="memberGrid" runat="server" AutoGenerateColumns="False" DataSourceID="memberSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <%--<Resizing AllowColumnResize="true" AllowRowResize="true" />--%>
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <MasterTableView DataSourceID="memberSource" DataKeyNames="AutoId">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="AutoId" FilterControlAltText="Filter AutoId column" HeaderText="AutoId" ReadOnly="True" SortExpression="AutoId" UniqueName="AutoId" DataType="System.Int32" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="id" FilterControlAltText="Filter id column" HeaderText="id" SortExpression="id" UniqueName="id" DataType="System.Int32" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MembershipNo" FilterControlAltText="Filter MembershipNo column" HeaderText="MembershipNo" SortExpression="MembershipNo" UniqueName="MembershipNo" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Surname" FilterControlAltText="Filter Surname column" HeaderText="Surname" SortExpression="Surname" UniqueName="Surname" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Othername" FilterControlAltText="Filter Othername column" HeaderText="Othername" SortExpression="Othername" UniqueName="Othername" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Dob" FilterControlAltText="Filter Dob column" HeaderText="Dob" SortExpression="Dob" UniqueName="Dob" DataType="System.DateTime" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <%--<telerik:GridBoundColumn DataField="Ref" FilterControlAltText="Filter Ref column" HeaderText="Ref" SortExpression="Ref" UniqueName="Ref" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="PrincipalId" DataType="System.Int32" FilterControlAltText="Filter PrincipalId column" HeaderText="PrincipalId" SortExpression="PrincipalId" UniqueName="PrincipalId" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Relationship" FilterControlAltText="Filter Relationship column" HeaderText="Relationship" SortExpression="Relationship" UniqueName="Relationship" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="primary_mobile_no" FilterControlAltText="Filter primary_mobile_no column" HeaderText="primary_mobile_no" SortExpression="primary_mobile_no" UniqueName="primary_mobile_no" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <%--<telerik:GridBoundColumn DataField="secondary_mobile_no" FilterControlAltText="Filter secondary_mobile_no column" HeaderText="secondary_mobile_no" SortExpression="secondary_mobile_no" UniqueName="secondary_mobile_no" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <%--<telerik:GridBoundColumn DataField="address" FilterControlAltText="Filter address column" HeaderText="address" SortExpression="address" UniqueName="address" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="email_address" FilterControlAltText="Filter email_address column" HeaderText="email_address" SortExpression="email_address" UniqueName="email_address" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <%--<telerik:GridBoundColumn DataField="created_at" DataType="System.DateTime" FilterControlAltText="Filter created_at column" HeaderText="created_at" SortExpression="created_at" UniqueName="created_at" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <%--<telerik:GridBoundColumn DataField="agent_id" DataType="System.Int32" FilterControlAltText="Filter agent_id column" HeaderText="agent_id" SortExpression="agent_id" UniqueName="agent_id" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="is_active" DataType="System.Byte" FilterControlAltText="Filter is_active column" HeaderText="is_active" SortExpression="is_active" UniqueName="is_active" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status_id" DataType="System.Int32" FilterControlAltText="Filter status_id column" HeaderText="status_id" SortExpression="status_id" UniqueName="status_id" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="insurance_package_id" FilterControlAltText="Filter insurance_package_id column" HeaderText="insurance_package_id" SortExpression="insurance_package_id" UniqueName="insurance_package_id" DataType="System.Int32" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="InsurancePackage" FilterControlAltText="Filter InsurancePackage column" HeaderText="InsurancePackage" SortExpression="InsurancePackage" UniqueName="InsurancePackage" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="opd_limit" DataType="System.Double" FilterControlAltText="Filter opd_limit column" HeaderText="opd_limit" SortExpression="opd_limit" UniqueName="opd_limit" EmptyDataText="0.00">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ip_limit" DataType="System.Double" FilterControlAltText="Filter ip_limit column" HeaderText="ip_limit" SortExpression="ip_limit" UniqueName="ip_limit" EmptyDataText="0.00">
                                            </telerik:GridBoundColumn>
                                            <%--<telerik:GridBoundColumn DataField="healthcare_id" FilterControlAltText="Filter healthcare_id column" HeaderText="healthcare_id" SortExpression="healthcare_id" UniqueName="healthcare_id" DataType="System.Int32" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <%--<telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" SortExpression="ServiceProvider" UniqueName="ServiceProvider" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="premium_amt" DataType="System.Double" FilterControlAltText="Filter premium_amt column" HeaderText="premium_amt" SortExpression="premium_amt" UniqueName="premium_amt" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="card_pin" FilterControlAltText="Filter card_pin column" HeaderText="card_pin" SortExpression="card_pin" UniqueName="card_pin" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="card_serialno" FilterControlAltText="Filter card_serialno column" HeaderText="card_serialno" SortExpression="card_serialno" UniqueName="card_serialno" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MemberType" FilterControlAltText="Filter MemberType column" HeaderText="MemberType" ReadOnly="True" SortExpression="MemberType" UniqueName="MemberType" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <%--<telerik:GridCheckBoxColumn DataField="info_uploaded" DataType="System.Boolean" FilterControlAltText="Filter info_uploaded column" HeaderText="info_uploaded" SortExpression="info_uploaded" UniqueName="info_uploaded">
                                            </telerik:GridCheckBoxColumn>
                                            <telerik:GridBoundColumn DataField="FullName" FilterControlAltText="Filter FullName column" HeaderText="FullName" ReadOnly="True" SortExpression="FullName" UniqueName="FullName" EmptyDataText="">
                                            </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn DataField="ActiveStatus" FilterControlAltText="Filter ActiveStatus column" HeaderText="ActiveStatus" ReadOnly="True" SortExpression="ActiveStatus" UniqueName="ActiveStatus" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="start_date" DataType="System.DateTime" FilterControlAltText="Filter start_date column" HeaderText="start_date" SortExpression="start_date" UniqueName="start_date" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="expiry_date" DataType="System.DateTime" FilterControlAltText="Filter expiry_date column" HeaderText="expiry_date" SortExpression="expiry_date" UniqueName="expiry_date" EmptyDataText="">
                                            </telerik:GridBoundColumn>
                                            <%--<telerik:GridCheckBoxColumn DataField="CardPrinted" DataType="System.Boolean" FilterControlAltText="Filter CardPrinted column" HeaderText="CardPrinted" SortExpression="CardPrinted" UniqueName="CardPrinted">
                                            </telerik:GridCheckBoxColumn>--%>
                                           </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="memberSource" runat="server" ConnectionString="<%$ ConnectionStrings:myHealthDBConnectionString %>" SelectCommand="SELECT * FROM [vwAvailable_Members_Online_Upload_New]">
                                </asp:SqlDataSource>
                            </div>
                       </div>

                <div class="modal-footer">
                    <asp:Button ID="btnProcess" runat="server" Text="Process" CssClass="btn btn-success"  OnClick="btnProcess_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
