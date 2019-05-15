<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ArchivePolicy_Delete.aspx.cs" Inherits="NMH_HCM.UserCommands.ArchivePolicy_Delete" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Save Member</h3>
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
                                        <label>Member ID</label>
                                       <asp:TextBox runat="server" ID="txtMemberId" Width="100%" MaxLength="50" ></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter Member ID" ControlToValidate="txtMemberId" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             </div>
                            <div>
                                <telerik:RadGrid ID="archiveGrid" runat="server" ShowFooter="true" AutoGenerateColumns="false" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="archiveSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" OnItemDeleted="archiveGrid_ItemDeleted">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <MasterTableView DataSourceID="archiveSource" AllowAutomaticDeletes="true" DataKeyNames="ID">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ID" HeaderText="ID" SortExpression="ID" UniqueName="ID">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" UniqueName="MemberId">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PolicyStatus" HeaderText="PolicyStatus" SortExpression="PolicyStatus" UniqueName="PolicyStatus">
                                         <HeaderStyle Width="70px" />
                                         </telerik:GridBoundColumn>
                                            <telerik:GridDateTimeColumn DataField="PolicyStartDate" HeaderText="PolicyStartDate" SortExpression="PolicyStartDate" UniqueName="PolicyStartDate">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridDateTimeColumn>
                                            <telerik:GridDateTimeColumn DataField="PolicyEndDate" HeaderText="PolicyEndDate" SortExpression="PolicyEndDate" UniqueName="PolicyEndDate">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridDateTimeColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn-danger" Text="Delete" CommandName="Delete" ButtonType="PushButton" UniqueName="Delete" ConfirmText="Are you sure you want to delete?">
                                                <HeaderStyle Width="60px" />
                                            </telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="archiveSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID,MemberId,PolicyStatus,PolicyStartDate,PolicyEndDate FROM ArchivePolicy WHERE MemberId = @MemberId order by ID" DeleteCommand="DELETE FROM ArchivePolicy WHERE ID = @ID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtMemberId" DefaultValue="0" Name="MemberId" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                       </div>
                     <div class="modal-footer">
                    <asp:Button ID="btnSearch" runat="server" Text="Find" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
