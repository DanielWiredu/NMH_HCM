<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Drug_Mapping.aspx.cs" Inherits="NMH_HCM.UserCommands.Drug_Mapping" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="/Content/dist/css/telerikCombo.css" rel="stylesheet" />
    <link href="/Content/dist/css/updateProgress.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Drug Mapping </h3>
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

                   <asp:Panel runat="server">
            <asp:UpdatePanel runat="server" ID="upProcess">
            <ContentTemplate>
                 <div class="modal-content">
                        <div class="modal-body">
                        
                            <div class="form-group">
                               <div class="row">
                                   <div class="col-md-12">
                                       <label>Drug</label>
                                       <telerik:RadComboBox ID="dlDrug" runat="server" Width="100%" DataSourceID="drugSource" MaxHeight="300" EmptyMessage="Select Drug" Filter="Contains"
                                           OnItemDataBound="dlDrug_ItemDataBound" OnDataBound="dlDrug_DataBound" OnItemsRequested="dlDrug_ItemsRequested" EnableLoadOnDemand="true"
                                            OnClientItemsRequested="UpdateDrugItemCountField" HighlightTemplatedItems="true" MarkFirstMatch="true"  >
                                            <HeaderTemplate>
                <ul>
                    <li class="ncol2">Drug Name</li>
                    <li class="ncol1">Price</li>
                </ul>
            </HeaderTemplate>
            <ItemTemplate>
                <ul>
                    <li class="ncol2">
                        <%# DataBinder.Eval(Container.DataItem, "DrugName")%></li>
                    <li class="ncol1">
                        <%# DataBinder.Eval(Container.DataItem, "DrugPrice")%></li>
                </ul>
            </ItemTemplate>
            <FooterTemplate>
                A total of
                <asp:Literal runat="server" ID="drugCount" />
                items
            </FooterTemplate>
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="drugSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top (1000) DrugID, DrugName, DrugPrice FROM [DrugPriceList] WHERE Mapped = 0"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dlDrug" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                   </div>
                               </div>
                            </div>

                                 <div class="form-group">
                                 <div class="row">
                                      <div class="col-md-12">
                                     <label>NMH Tariff</label>
                                     <telerik:RadComboBox ID="dlTariff" runat="server" Width="100%" DataSourceID="tariffSource" MaxHeight="300" EmptyMessage="Select Tariff" Filter="Contains"
                                           OnItemDataBound="dlTariff_ItemDataBound" OnDataBound="dlTariff_DataBound" OnItemsRequested="dlTariff_ItemsRequested" EnableLoadOnDemand="true"
                                            OnClientItemsRequested="UpdateTariffItemCountField" HighlightTemplatedItems="true" MarkFirstMatch="true"  >
                                            <HeaderTemplate>
                <ul>
                    <li class="ncol1">Tariff ID</li>
                    <li class="ncol2">Tariff Name</li>
                </ul>
            </HeaderTemplate>
            <ItemTemplate>
                <ul>
                    <li class="ncol1">
                        <%# DataBinder.Eval(Container.DataItem, "TariffID")%></li>
                    <li class="ncol2">
                        <%# DataBinder.Eval(Container.DataItem, "TariffName")%></li>
                </ul>
            </ItemTemplate>
            <FooterTemplate>
                A total of
                <asp:Literal runat="server" ID="tariffCount" />
                items
            </FooterTemplate>
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="tariffSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top (100) TariffID, TariffName FROM [Tariff] WHERE ServiceID = 5"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dlTariff" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                                 </div>
                                  
                             </div>
                       </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success"  OnClick="btnSave_Click" />
                </div>

                     <div>
                         <telerik:RadGrid ID="mapGrid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="mapSource" GroupPanelPosition="Top" OnDeleteCommand="mapGrid_DeleteCommand">
                             <ClientSettings>
                                 <Selecting AllowRowSelect="True" />
                             </ClientSettings>
                             <GroupingSettings CaseSensitive="false" />
                             <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="mapSource">
                                 <Columns>
                                     <telerik:GridBoundColumn Display="false" DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn Display="false" DataField="DrugId" DataType="System.Int32" SortExpression="DrugId" UniqueName="DrugId">
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="DrugName" FilterControlAltText="Filter DrugName column" HeaderText="Drug Name" SortExpression="DrugName" UniqueName="DrugName" AutoPostBackOnFilter="true" FilterControlWidth="250px" ShowFilterIcon="false">
                                     <HeaderStyle Width="300px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="DrugPrice" DataType="System.Double" FilterControlAltText="Filter DrugPrice column" HeaderText="Drug Price" SortExpression="DrugPrice" UniqueName="DrugPrice" AllowFiltering="false">
                                     <HeaderStyle Width="80px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="TariffName" FilterControlAltText="Filter TariffName column" HeaderText="NMH TariffName" SortExpression="TariffName" UniqueName="TariffName" AutoPostBackOnFilter="true" FilterControlWidth="250px" ShowFilterIcon="false">
                                     <HeaderStyle Width="300px" />
                                     </telerik:GridBoundColumn>
                                     <telerik:GridButtonColumn ButtonCssClass="btn-danger" ConfirmText="Delete Mapping?" CommandName="Delete" ButtonType="PushButton" Text="Delete" UniqueName="Delete">
                                         <HeaderStyle Width="60px" />
                                     </telerik:GridButtonColumn>
                                 </Columns>
                             </MasterTableView>
                         </telerik:RadGrid>
                         <asp:SqlDataSource ID="mapSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT     NMH_DrugMap.Id, DrugPriceList.DrugId, DrugPriceList.DrugName, DrugPriceList.DrugPrice, Tariff.TariffName
FROM         NMH_DrugMap INNER JOIN
                      DrugPriceList ON NMH_DrugMap.DrugID = DrugPriceList.DrugId INNER JOIN
                      Tariff ON NMH_DrugMap.NMH_TariffID = Tariff.TariffID"></asp:SqlDataSource>
                     </div>
            </div>
            </ContentTemplate>
                
        </asp:UpdatePanel>
        </asp:Panel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function UpdateTariffItemCountField(sender, args) {
                //Set the footer text.
                sender.get_dropDownElement().lastChild.innerHTML = "A total of " + sender.get_items().get_count() + " items";
            }
            function UpdateDrugItemCountField(sender, args) {
                //Set the footer text.
                sender.get_dropDownElement().lastChild.innerHTML = "A total of " + sender.get_items().get_count() + " items";
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
