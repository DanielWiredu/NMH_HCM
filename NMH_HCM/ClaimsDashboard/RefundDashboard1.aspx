<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RefundDashboard1.aspx.cs" Inherits="NMH_HCM.ClaimsDashboard.RefundDashboard1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Refunds Dashboard - Date Received</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="form-group">
                    <div class="col-md-2">

                    </div>
                                 <div class="row">
                                    <div class="col-md-3">
                                    <label>Start Date</label>
                                        <telerik:RadDatePicker ID="dpStartDate" runat="server" Width="100%"></telerik:RadDatePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpStartDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3">
                                     <label>End Date</label>
                                    <telerik:RadDatePicker ID="dpEndDate" runat="server" Width="100%"></telerik:RadDatePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEndDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                     <div class="col-md-2">
                                         <label>Click</label>
                                         <asp:Button runat="server" ID="btnRunReport" Text="RUN" CssClass="btn btn-success" OnClick="btnRunReport_Click" Width="100%" />
                                     </div> 
                                     <div class="col-md-2">

                    </div>
                                 </div>
                                  
                             </div>

                
                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart3"
            DataSourceID="refundCountSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="TOTALCLAIMS" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N0}">
                            <TextStyle FontSize="13" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N0}" />
                    </telerik:ColumnSeries>                    
                </Series>
                <XAxis DataLabelsField="REFUNDCLAIMSTATUS">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Refund Status">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Received">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Top">
                    <TextStyle  Bold="true" />
                </Appearance>
            </Legend>
            <ChartTitle Text="No of Claims - Refunds">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="refundCountSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT REFUNDCLAIMSTATUS, ISNULL(COUNT(ID),0) AS TOTALCLAIMS FROM dbo.Vw_RefundHeader WHERE (DateOfClaim between @startdate AND @enddate) GROUP BY REFUNDCLAIMSTATUS" OnSelecting="refundCountSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart4"
            DataSourceID="refundClaimAmtSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="TOTALCLAIMAMOUNT"  >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N02}">
                            <TextStyle FontSize="12" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N02}" />
                    </telerik:ColumnSeries> 
                </Series>
                <XAxis DataLabelsField="REFUNDCLAIMSTATUS">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Refund Status">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Amount">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Top">
                    <TextStyle  Bold="true" />
                </Appearance>
            </Legend>
            <ChartTitle Text="Claim Amount - Refunds">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="refundClaimAmtSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT REFUNDCLAIMSTATUS, ISNULL(SUM(ProviderAmountClaimed),0) AS TOTALCLAIMAMOUNT FROM dbo.Vw_RefundHeader WHERE (DateOfClaim between @startdate AND @enddate) GROUP BY REFUNDCLAIMSTATUS" OnSelecting="refundClaimAmtSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>

            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
