<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="testQRCode.aspx.cs" Inherits="NMH_HCM.UserCommands.testQRCode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">QR Code Test</h3>
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

                   <asp:Panel runat="server" DefaultButton="btnGenerate">
            <asp:UpdatePanel runat="server" ID="upProcess">
            <ContentTemplate>
                 <div class="modal-content">
                        <div class="modal-body">
                             <div class="form-group">
                                        <label> Number </label>
                                       <asp:TextBox runat="server" ID="txtNumber" Width="100%" MaxLength="50" ></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter No" ControlToValidate="txtNumber" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             </div>

                          <div class="form-group">
                                <asp:PlaceHolder ID="plBarCode" runat="server" />
                          </div>

                            <div class="form-group">
                                <asp:Button ID="btnGenerate" runat="server" Text="Generate" CssClass="btn btn-success"  OnClick="btnGenerate_Click" />
                            </div>
                            
                            <div class="form-group">
                             <div class="row">
                                 <div class="col-md-6">
                                 <label>Serial Number</label>
                                 <telerik:RadDropDownList ID="dlSNo" runat="server" Width="100%" DefaultMessage="Select One" DataSourceID="codeSource" DataTextField="barcodeNo" DataValueField="barcodeNo" OnItemSelected="dlSNo_ItemSelected" AutoPostBack="true" CausesValidation="false"></telerik:RadDropDownList>
                                 <asp:SqlDataSource ID="codeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [barcodeNo] FROM [tblBarcode]"></asp:SqlDataSource>
                             </div>
                             <div class="col-md-6">
                                 <label>Image</label>
                                 <asp:Image ID="image" runat="server" Width="200px" Height="200px" />
                             </div>
                             </div>
                         </div>
                       </div>
                     
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
