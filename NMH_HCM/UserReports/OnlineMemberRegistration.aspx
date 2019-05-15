<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="OnlineMemberRegistration.aspx.cs" Inherits="NMH_HCM.UserReports.OnlineMemberRegistration" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Online Member Registration </h3>
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
                <div class="row">
                                        <div class="col-sm-4 pull-right">
                                           <asp:TextBox runat="server" ID="txtSearch" Width="100%" placeholder="Name / Company..." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                       </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <%--<asp:Button runat="server" ID="btnAdd" CssClass="btn-primary" Text="Add New" CausesValidation="false" OnClientClick="newModal()"/>--%>  
                                            </div>
                                        </div>
                                    </div>
                        <hr />

                            <telerik:RadGrid ID="memberGrid" runat="server" AllowFilteringByColumn="false" AllowSorting="True" DataSourceID="memberSource" GroupPanelPosition="Top" OnItemCommand="memberGrid_ItemCommand" OnItemDataBound="memberGrid_ItemDataBound">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="true" ScrollHeight="400px" UseStaticHeaders="true" />
                                </ClientSettings>
                                <GroupingSettings CaseSensitive="false" />
                                <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" HideStructureColumns="true" FileName="OnlineRegistration">
                                    
                                    </ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="memberSource" AllowPaging="true" PageSize="50">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="id" DataType="System.Int32" HeaderText="id" SortExpression="id" UniqueName="id">
                                        <HeaderStyle Width="50px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="member_plan" HeaderText="member_plan" SortExpression="member_plan" UniqueName="member_plan">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="surname" HeaderText="surname" SortExpression="surname" UniqueName="surname">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="othernames" HeaderText="othernames" SortExpression="othernames" UniqueName="othernames">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="sex" HeaderText="sex" SortExpression="sex" UniqueName="sex">
                                        <HeaderStyle Width="80px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="date_of_birth"  HeaderText="date_of_birth" SortExpression="date_of_birth" UniqueName="date_of_birth" DataFormatString="{0:dd-MMM-yyyy}">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="telephone_no" HeaderText="telephone_no" SortExpression="telephone_no" UniqueName="telephone_no">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="email" HeaderText="email" SortExpression="email" UniqueName="email">
                                        <HeaderStyle Width="180px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="employer" HeaderText="employer" SortExpression="employer" UniqueName="employer">
                                        <HeaderStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="principal_id" HeaderText="principal_id" SortExpression="principal_id" UniqueName="principal_id">
                                        <HeaderStyle Width="80px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="member_type" HeaderText="member_type" SortExpression="member_type" UniqueName="member_type">
                                        <HeaderStyle Width="110px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="relationship_type" HeaderText="relationship_type" SortExpression="relationship_type" UniqueName="relationship_type">
                                        <HeaderStyle Width="100px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="join_date" HeaderText="join_date" SortExpression="join_date" UniqueName="join_date" DataFormatString="{0:dd-MMM-yyyy}">
                                        <HeaderStyle Width="110px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="no_of_dependents" HeaderText="no_of_dependents" SortExpression="no_of_dependents" UniqueName="no_of_dependents">
                                        <HeaderStyle Width="110px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridImageColumn Exportable="false" DataType="System.String" DataImageUrlFields="picpath" AlternateText="Member Pix" DataAlternateTextField="othernames" ImageAlign="Middle" ImageHeight="50px" ImageWidth="52px" HeaderText="Pix">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridImageColumn>
                                        <telerik:GridBoundColumn Display="false" DataField="pull_status" HeaderText="pull_status" SortExpression="pull_status" UniqueName="pull_status">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn Text="Complete" CommandName="Complete" UniqueName="Complete" ConfirmText="Complete this registration?" ButtonType="PushButton" ButtonCssClass="btn-success" Exportable="false">
                                        <HeaderStyle Width="70px" />
                                    </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="memberSource" runat="server" ConnectionString="<%$ ConnectionStrings:rxConnectionString %>" ProviderName="<%$ ConnectionStrings:rxConnectionString.ProviderName %>" SelectCommand="SELECT id, member_plan, surname, othernames, sex, date_of_birth, telephone_no, email, employer, principal_id, member_type, relationship_type, join_date, no_of_dependents, pull_status, picpath FROM patient_info_registration WHERE (surname LIKE CONCAT('%', @SearchValue, '%') OR othernames LIKE CONCAT('%', @SearchValue, '%') OR employer LIKE CONCAT('%', @SearchValue, '%')) ORDER BY id desc LIMIT 50">
                                 <SelectParameters>
                                                <asp:ControlParameter ControlID="txtSearch" Name="SearchValue" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                            </SelectParameters>
                            </asp:SqlDataSource>

                <div class="modal-footer">
                    <asp:Button ID="btnExcelExport" runat="server" Text="Excel" CssClass="btn btn-success" OnClick="btnExcelExport_Click" CausesValidation="false" />
                </div>

            </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnExcelExport" />
                </Triggers>
        </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
