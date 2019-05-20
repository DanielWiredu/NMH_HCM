<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ClaimsReceived1.aspx.cs" Inherits="NMH_HCM.ClaimsDashboard.ClaimsReceived1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Claims Received  </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
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
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 runat="server" id="ClaimsTotal" > 256 </h3>
                  <p>Number of Claims</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-teal">
                <div class="inner">
                  <h3 runat="server" id="ClaimsAmountTotal"> 65 <sup style="font-size: 20px"></sup></h3>
                  <p>Claim Amount (GHC)</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-teal">
                <div class="inner">
                  <h3 runat="server" id="AwardedAmountTotal"> 65 <sup style="font-size: 20px"></sup></h3>
                  <p>Awarded Amount (GHC)</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3 runat="server" id="FacilitiesTotal"> 42 </h3>
                  <p>Number of Facilities</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bonfire"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
          </div>

                <div class="row">
              <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3 runat="server" id="ClaimsElectronic"> 33 </h3>
                  <p> No Of Claims - Electronic</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-gray">
                <div class="inner">
                  <h3 runat="server" id="ClaimsAmountElectronic"> 33 </h3>
                  <p>Claim Amount - Electronic</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-fuchsia">
                <div class="inner">
                  <h3 runat="server" id="ClaimsPaper"> 33 </h3>
                  <p>No Of Claims - Paper</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-purple">
                <div class="inner">
                  <h3 runat="server" id="ClaimsAmountPaper"> 33 </h3>
                  <p>Claim Amount - Paper</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
          </div>


                <div class="row">
                    <div class="col-md-6">
                        <div class="bg-purple">Top 10 Claims Submitted - Volume</div>
                        <telerik:RadGrid ID="grdTopClaimsSubmitted" runat="server" DataSourceID="topClmSubmitSource" GroupPanelPosition="Top" ShowFooter="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="topClmSubmitSource">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" ReadOnly="True" SortExpression="ServiceProvider" UniqueName="ServiceProvider">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalClaims" Aggregate="Sum" DataType="System.Int32" FilterControlAltText="Filter TotalClaims column" HeaderText="No. of Claims" ReadOnly="True" SortExpression="TotalClaims" UniqueName="TotalClaims" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="topClmSubmitSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (10) ServiceProvider, COUNT(ID) as TotalClaims FROM vwClaimsDashboard_Received WHERE (DateOfClaim BETWEEN @StartDate AND @EndDate) AND ServiceProvideID <> 379 GROUP BY ServiceProvider ORDER BY TotalClaims DESC" OnSelecting="topClmSubmitSource_Selecting">
                            <SelectParameters>
                                <%--<asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="StartDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="EndDate" PropertyName="SelectedValue" />--%>
                                <asp:ControlParameter ControlID="dpStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <div class="bg-maroon">Top 10 Claims Submitted - Amount</div>
                        <telerik:RadGrid ID="grdTopClaimAmountSubmitted" runat="server" DataSourceID="topClmAmountSubmitSource" GroupPanelPosition="Top" ShowFooter="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="topClmAmountSubmitSource">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ServiceProvider" FilterControlAltText="Filter ServiceProvider column" HeaderText="ServiceProvider" ReadOnly="True" SortExpression="ServiceProvider" UniqueName="ServiceProvider">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ClaimAmount" Aggregate="Sum" DataType="System.Decimal" FilterControlAltText="Filter ClaimAmount column" HeaderText="Claim Amount" SortExpression="ClaimAmount" UniqueName="ClaimAmount" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="topClmAmountSubmitSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (10) ServiceProvider, SUM(SysAmountClaimed) as ClaimAmount FROM vwClaimsDashboard_Received WHERE (DateOfClaim BETWEEN @StartDate AND @EndDate) AND ServiceProvideID <> 379 GROUP BY ServiceProvider ORDER BY ClaimAmount DESC" OnSelecting="topClmAmountSubmitSource_Selecting">
                            <SelectParameters>
                                <%--<asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="StartDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="EndDate" PropertyName="SelectedValue" />--%>
                                <asp:ControlParameter ControlID="dpStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>


                 <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart3"
            DataSourceID="SqlDataSource6" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="TOTALCLAIMS" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N0}">
                            <TextStyle FontSize="13" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N0}" />
                    </telerik:ColumnSeries>                    
                </Series>
                <XAxis DataLabelsField="BENEFITOPTION">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Benefit Option">
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
            <ChartTitle Text="No of Claims - Benefit Option">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BENEFITOPTION, ISNULL(COUNT(ID),0) AS TOTALCLAIMS FROM dbo.vwClaimsDashboard_Received WHERE (DateofClaim BETWEEN @startdate AND @enddate) AND ActualPlanID in (31,2,3,18) AND ServiceProvideID <> 379 GROUP BY BENEFITOPTION" OnSelecting="SqlDataSource6_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart4"
            DataSourceID="SqlDataSource7" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="CLAIMAMOUNT"  >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N02}">
                            <TextStyle FontSize="12" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N02}" />
                    </telerik:ColumnSeries> 
                </Series>
                <XAxis DataLabelsField="BENEFITOPTION">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Benefit Option">
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
            <ChartTitle Text="Claim Amount - Benefit Option">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BENEFITOPTION, ISNULL(SUM(SysAmountClaimed),0.00) AS CLAIMAMOUNT FROM dbo.vwClaimsDashboard_Received WHERE (DateofClaim BETWEEN @startdate AND @enddate) AND ActualPlanID in (31,2,3,18) AND ServiceProvideID <> 379 GROUP BY BENEFITOPTION" OnSelecting="SqlDataSource7_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>


                                 <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="RadHtmlChart7" runat="server" Width="100%" Height="500px" DataSourceID="SqlDataSource10">
                                    <ChartTitle Text="No of Claims">
                                        <Appearance Visible="True"  >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="True" Position="Right">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:DonutSeries Name="SERVICETYPE" StartAngle="90" DataFieldY="TOTALCLAIMS" NameField="SERVICETYPE" >
                                                <LabelsAppearance DataField="SERVICETYPE" Position="OutsideEnd" Visible="true"></LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N0}"></TooltipsAppearance>
                                            </telerik:DonutSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICETYPE, ISNULL(COUNT(ID),0) AS TOTALCLAIMS FROM dbo.vwClaimsDashboard_Received WHERE (DateOfClaim between @startdate and @enddate) AND ServiceProvideID <> 379 GROUP BY SERVICETYPE" OnSelecting="SqlDataSource10_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtAgeBandAllClaimAmt" runat="server" Width="100%" Height="500px" DataSourceID="SqlDataSource11">
                                    <ChartTitle Text="Claim Amount">
                                        <Appearance Visible="True" >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="True" Position="Right">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries Name="SERVICETYPE" StartAngle="90" DataFieldY="TOTALCLAIMAMOUNT" NameField="SERVICETYPE" >
                                                <LabelsAppearance DataField="SERVICETYPE" Position="OutsideEnd" Visible="true"></LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}"></TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICETYPE, ISNULL(SUM(SYSAMOUNTCLAIMED),0) AS TOTALCLAIMAMOUNT FROM dbo.vwClaimsDashboard_Received WHERE (DateOfClaim between @startdate and @enddate) AND ServiceProvideID <> 379 GROUP BY SERVICETYPE" OnSelecting="SqlDataSource11_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>


                   <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart1"
            DataSourceID="clmByStatusSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="TOTALCLAIMS" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N0}">
                            <TextStyle FontSize="13" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N0}" />
                    </telerik:ColumnSeries>                    
                </Series>
                <XAxis DataLabelsField="STATUS">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Status">
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
            <ChartTitle Text="No of Claims - STATUS">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="clmByStatusSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT STATUS, ISNULL(COUNT(ID),0) AS TOTALCLAIMS FROM dbo.vwClaimsDashboard_Received WHERE (DateofClaim BETWEEN @startdate AND @enddate) AND ServiceProvideID <> 379 GROUP BY STATUS" OnSelecting="clmByStatusSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2"
            DataSourceID="amountByStatusSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="CLAIMAMOUNT"  >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N02}">
                            <TextStyle FontSize="12" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N02}" />
                    </telerik:ColumnSeries> 
                </Series>
                <XAxis DataLabelsField="STATUS">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Status">
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
            <ChartTitle Text="Claim Amount - STATUS">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="amountByStatusSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT STATUS, ISNULL(SUM(SysAmountClaimed),0.00) AS CLAIMAMOUNT FROM dbo.vwClaimsDashboard_Received WHERE (DateofClaim BETWEEN @startdate AND @enddate) AND ServiceProvideID <> 379 GROUP BY STATUS" OnSelecting="amountByStatusSource_Selecting">
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
