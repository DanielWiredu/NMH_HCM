<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Online_Member_Upload.aspx.cs" Inherits="NMH_HCM.UserCommands.Online_Member_Upload" %>

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
                                    <MasterTableView DataSourceID="memberSource">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="member_no" FilterControlAltText="Filter member_no column" HeaderText="member_no" ReadOnly="True" SortExpression="member_no" UniqueName="member_no">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="member_plan" FilterControlAltText="Filter member_plan column" HeaderText="member_plan" SortExpression="member_plan" UniqueName="member_plan">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Surname" FilterControlAltText="Filter Surname column" HeaderText="Surname" SortExpression="Surname" UniqueName="Surname">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="othernames" FilterControlAltText="Filter othernames column" HeaderText="othernames" ReadOnly="True" SortExpression="othernames" UniqueName="othernames">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="sex" FilterControlAltText="Filter sex column" HeaderText="sex" SortExpression="sex" UniqueName="sex">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="date_of_birth" DataType="System.DateTime" FilterControlAltText="Filter date_of_birth column" HeaderText="date_of_birth" SortExpression="date_of_birth" UniqueName="date_of_birth">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="telephone_no" FilterControlAltText="Filter telephone_no column" HeaderText="telephone_no" SortExpression="telephone_no" UniqueName="telephone_no">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="employer" FilterControlAltText="Filter employer column" HeaderText="employer" SortExpression="employer" UniqueName="employer">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="expiry_date" DataType="System.DateTime" FilterControlAltText="Filter expiry_date column" HeaderText="expiry_date" SortExpression="expiry_date" UniqueName="expiry_date">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="member_id" DataType="System.Int32" FilterControlAltText="Filter member_id column" HeaderText="member_id" SortExpression="member_id" UniqueName="member_id">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="rx_member_id" FilterControlAltText="Filter rx_member_id column" HeaderText="rx_member_id" ReadOnly="True" SortExpression="rx_member_id" UniqueName="rx_member_id">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="insert_delete_status" FilterControlAltText="Filter insert_delete_status column" HeaderText="insert_delete_status" SortExpression="insert_delete_status" UniqueName="insert_delete_status">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="InfoUploaded" DataType="System.Int32" FilterControlAltText="Filter InfoUploaded column" HeaderText="InfoUploaded" SortExpression="InfoUploaded" UniqueName="InfoUploaded">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Printed" DataType="System.Int32" FilterControlAltText="Filter Printed column" HeaderText="Printed" SortExpression="Printed" UniqueName="Printed">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StatusID" DataType="System.Int32" FilterControlAltText="Filter StatusID column" HeaderText="StatusID" SortExpression="StatusID" UniqueName="StatusID">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CompanyID" DataType="System.Int32" FilterControlAltText="Filter CompanyID column" HeaderText="CompanyID" SortExpression="CompanyID" UniqueName="CompanyID">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PlanID" DataType="System.Int32" FilterControlAltText="Filter PlanID column" HeaderText="PlanID" SortExpression="PlanID" UniqueName="PlanID">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="cardPin" FilterControlAltText="Filter cardPin column" HeaderText="cardPin" SortExpression="cardPin" UniqueName="cardPin">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MemberType" FilterControlAltText="Filter MemberType column" HeaderText="MemberType" SortExpression="MemberType" UniqueName="MemberType">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Relationship" FilterControlAltText="Filter Relationship column" HeaderText="Relationship" SortExpression="Relationship" UniqueName="Relationship">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PrincipalID" DataType="System.Int32" FilterControlAltText="Filter PrincipalID column" HeaderText="PrincipalID" SortExpression="PrincipalID" UniqueName="PrincipalID">
                                            </telerik:GridBoundColumn>
                                           </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="memberSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Get_Data_To_upload" SelectCommandType="StoredProcedure">
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
