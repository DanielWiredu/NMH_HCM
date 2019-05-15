<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="BulkSMS.aspx.cs" Inherits="NMH_HCM.UserCommands.BulkSMS" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Bulk SMS </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upMembers">
                           <ProgressTemplate>
                            <div class="divWaiting">            
	                            <asp:Label ID="lblWait" runat="server" Text="Processing... " />
	                              <asp:Image ID="imgWait" runat="server" ImageAlign="Top" ImageUrl="/Content/dist/img/loader.gif" />
                                </div>
                             </ProgressTemplate>
                       </asp:UpdateProgress>

                         <asp:UpdatePanel runat="server" ID="upMembers" >
                    <ContentTemplate>
                        <div class="row">
                                        <div class="col-sm-4 pull-right">
                                           <asp:TextBox runat="server" ID="txtMsg" Width="100%"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <asp:Button runat="server" ID="btnSMS" CssClass="btn btn-success" Text="New SMS" OnClientClick="newModal();" CausesValidation="false" />  
                                            </div>
                                        </div>
                                    </div>
                        <hr />
                         <telerik:RadGrid ID="memberGrid" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowPaging="False" AllowSorting="True" CellSpacing="-1" DataSourceID="memeberSource" GridLines="Both">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                               <Scrolling AllowScroll="true" ScrollHeight="400px" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                           
                            <MasterTableView DataKeyNames="ID" DataSourceID="memeberSource" CommandItemDisplay="None" AllowAutomaticDeletes="false" PageSize="100">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ID" HeaderText="ID" SortExpression="ID" UniqueName="ID" >
                                        <HeaderStyle Width="110px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                                     <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Mphone" HeaderText="Mphone" SortExpression="Mphone" UniqueName="Mphone">
                                     <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                           
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="memeberSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Get_PrincipalMemberNo" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

    <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server" ID="upMessage">
            <ContentTemplate>
                  <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New SMS</h4>
                </div>
                        <div class="modal-body">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upMessage">
                                <ProgressTemplate>
                                    Sending....
                                    <img alt="" src="/Content/dist/img/loader.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                              <div class="form-group">
                               <label>Send As</label>
                               <asp:TextBox ID="txtHeader" runat="server" Width="100%" MaxLength="11" Text="NMI" Enabled="false"></asp:TextBox>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHeader" Display="Dynamic" ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true"></asp:RequiredFieldValidator>
                           </div>
                         <div class="form-group">
                               <label>Message</label>
                               <asp:TextBox ID="txtMessage" runat="server" Width="100%" TextMode="MultiLine" Rows="5" ></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" Display="Dynamic" ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                <div class="modal-footer">
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-success" OnClick="btnSend_Click" />
                    <%--<asp:Button ID="btnTestSend" runat="server" Text="Test SMS" CssClass="btn btn-info" OnClick="btnTestSend_Click" />--%>
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
