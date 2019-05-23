<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ClaimsAttendance_ItemService.aspx.cs" Inherits="NMH_HCM.StatsDashboard.ClaimsAttendance_ItemService" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Dashboard (Today's Summary) - Item Service </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <div class="form-group">
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
                                     <div class="col-md-3">
                                         <label>Service</label>
                                         <telerik:RadDropDownList ID="dlService" runat="server" Width="100%" DataSourceID="serviceSource" DataTextField="ServiceName" DataValueField="ServiceID" DefaultMessage="Select Service" DropDownHeight="300px"></telerik:RadDropDownList>
                                         <asp:SqlDataSource ID="serviceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ServiceID], [ServiceName] FROM [Services]"></asp:SqlDataSource>
                                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Select Service" ControlToValidate="dlService" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                     <div class="col-md-3">
                                         <label>Click</label>
                                         <asp:Button runat="server" ID="btnRunReport" Text="RUN" CssClass="btn btn-success" OnClick="btnRunReport_Click" Width="100%" />
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
              <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-orange">
                <div class="inner">
                  <h3 runat="server" id="ClaimsMale"> 33 </h3>
                  <p>No of Claims - Male</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-maroon">
                <div class="inner">
                  <h3 runat="server" id="ClaimsAmountMale"> 33 </h3>
                  <p>Claim Amount - Male</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3 runat="server" id="ClaimsFemale"> 33 </h3>
                  <p>No Of Claims - Female</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-teal">
                <div class="inner">
                  <h3 runat="server" id="ClaimsAmountFemale"> 33 </h3>
                  <p>Claims Amount - Female</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
               
              </div>
            </div><!-- ./col -->
          </div>

                <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-envelope-o"></i></span>
            <div class="info-box-content">
              <span>No of Claims (Principal)</span>
              <span class="info-box-number" style="font-size:x-large; font-weight:bold" runat="server" id="ClaimsPrincipal">410</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-flag-o"></i></span>
            <div class="info-box-content">
              <span>Claim Amount (Principal)</span>
              <span style="font-size:x-large; font-weight:bold" runat="server" id="ClaimsAmountPrincipal">410</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-files-o"></i></span>
            <div class="info-box-content">
              <span>No of Claims(Dependent)</span>
              <span style="font-size:x-large; font-weight:bold" runat="server" id="ClaimsDependent">13,648</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
            <div class="info-box-content">
              <span>Claim Amount (Dependent)</span>
              <span style="font-size:x-large; font-weight:bold" runat="server" id="ClaimsAmountDependent">93,139</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>


                <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-olive"><i class="fa fa-comment-o"></i></span>
            <div class="info-box-content">
              <span>No of Items (Male)</span>
              <span class="info-box-number" style="font-size:x-large; font-weight:bold" runat="server" id="ItemsMale">410</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-purple"><i class="fa fa-download"></i></span>
            <div class="info-box-content">
              <span>No of Items (Female)</span>
              <span style="font-size:x-large; font-weight:bold" runat="server" id="ItemsFemale">410</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-teal-gradient"><i class="fa fa-gears"></i></span>
            <div class="info-box-content">
              <span>No of Items (Principal)</span>
              <span style="font-size:x-large; font-weight:bold" runat="server" id="ItemsPrincipal">13,648</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-navy"><i class="fa fa-pencil"></i></span>
            <div class="info-box-content">
              <span>No of Items (Dependent)</span>
              <span style="font-size:x-large; font-weight:bold" runat="server" id="ItemsDependent">93,139</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
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
                        <asp:SqlDataSource ID="topClmSubmitSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select top(10) ServiceProvider,count(distinct ID) as TotalClaims from vwStatsDashboard_ClaimItems WHERE (DateofAttendance BETWEEN @StartDate AND @EndDate) and ServiceID = @ServiceId GROUP BY ServiceProvider ORDER BY TotalClaims DESC" OnSelecting="topClmSubmitSource_Selecting">
                            <SelectParameters>
                                <%--<asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="StartDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="EndDate" PropertyName="SelectedValue" />--%>
                                <asp:ControlParameter ControlID="dpStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:SqlDataSource ID="topClmAmountSubmitSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select top(10) ServiceProvider,isnull(sum(SysAmountClaimed),0.0) as ClaimAmount from vwStatsDashboard_ClaimItems WHERE (DateofAttendance BETWEEN  @StartDate AND @EndDate) and ServiceID = @ServiceId GROUP BY ServiceProvider ORDER BY ClaimAmount DESC" OnSelecting="topClmAmountSubmitSource_Selecting">
                            <SelectParameters>
                                <%--<asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="StartDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="grdTopClaimsSubmitted" DefaultValue=" " Name="EndDate" PropertyName="SelectedValue" />--%>
                                <asp:ControlParameter ControlID="dpStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <div class="bg-teal">Age Band Claims Submitted - Items (Male)</div>
                        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" GroupPanelPosition="Top" ShowFooter="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AgeBand" FilterControlAltText="Filter AgeBand column" HeaderText="AgeBand" SortExpression="AgeBand" UniqueName="AgeBand">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Essential" DataType="System.Int32" FilterControlAltText="Filter Essential column" HeaderText="Essential" SortExpression="Essential" UniqueName="Essential" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Executive" DataType="System.Int32" FilterControlAltText="Filter Executive column" HeaderText="Executive" SortExpression="Executive" UniqueName="Executive" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Premier" DataType="System.Int32" FilterControlAltText="Filter Premier column" HeaderText="Premier" SortExpression="Premier" UniqueName="Premier" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PremierPlus" DataType="System.Int32" FilterControlAltText="Filter PremierPlus column" HeaderText="PremierPlus" SortExpression="PremierPlus" UniqueName="PremierPlus" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataType="System.Double" Aggregate="Sum" FooterText="Grand Total : " HeaderText="Total" DataFields="Essential, Executive, Premier, PremierPlus" Expression="{0}+{1}+{2}+{3}" HeaderStyle-Width="120px" DataFormatString="{0:N0}"/>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AgeBand, Essential, Executive, Premier, PremierPlus FROM dbo.vAgeBandBenefitClaimItems(@startdate, @enddate, 'Male', @serviceid) AS vAgeBandBenefitClaimItems_1" OnSelecting="SqlDataSource1_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <div class="bg-red-gradient">Age Band Claims Submitted - Amount (Male)</div>
                        <telerik:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDataSource2" GroupPanelPosition="Top" ShowFooter="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AgeBand" FilterControlAltText="Filter AgeBand column" HeaderText="AgeBand" SortExpression="AgeBand" UniqueName="AgeBand">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Essential" DataType="System.Int32" FilterControlAltText="Filter Essential column" HeaderText="Essential" SortExpression="Essential" UniqueName="Essential" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Executive" DataType="System.Int32" FilterControlAltText="Filter Executive column" HeaderText="Executive" SortExpression="Executive" UniqueName="Executive" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Premier" DataType="System.Int32" FilterControlAltText="Filter Premier column" HeaderText="Premier" SortExpression="Premier" UniqueName="Premier" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PremierPlus" DataType="System.Int32" FilterControlAltText="Filter PremierPlus column" HeaderText="PremierPlus" SortExpression="PremierPlus" UniqueName="PremierPlus" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataType="System.Double" Aggregate="Sum" FooterText="Grand Total : " HeaderText="Total" DataFields="Essential, Executive, Premier, PremierPlus" Expression="{0}+{1}+{2}+{3}" HeaderStyle-Width="120px" DataFormatString="{0:N2}"/>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AgeBand, Essential, Executive, Premier, PremierPlus FROM dbo.vAgeBandBenefitClaimItemAmount(@startdate, @enddate, 'Male', @serviceid) AS vAgeBandBenefitClaimItemAmount_1" OnSelecting="SqlDataSource2_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <br />
                <div class="row">
                    <div class="col-md-6">
                        <div class="bg-fuchsia">Age Band Claims Submitted - Items (Female)</div>
                        <telerik:RadGrid ID="RadGrid3" runat="server" DataSourceID="SqlDataSource1" GroupPanelPosition="Top" ShowFooter="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AgeBand" FilterControlAltText="Filter AgeBand column" HeaderText="AgeBand" SortExpression="AgeBand" UniqueName="AgeBand">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Essential" DataType="System.Int32" FilterControlAltText="Filter Essential column" HeaderText="Essential" SortExpression="Essential" UniqueName="Essential" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Executive" DataType="System.Int32" FilterControlAltText="Filter Executive column" HeaderText="Executive" SortExpression="Executive" UniqueName="Executive" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Premier" DataType="System.Int32" FilterControlAltText="Filter Premier column" HeaderText="Premier" SortExpression="Premier" UniqueName="Premier" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PremierPlus" DataType="System.Int32" FilterControlAltText="Filter PremierPlus column" HeaderText="PremierPlus" SortExpression="PremierPlus" UniqueName="PremierPlus" DataFormatString="{0:N0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataType="System.Double" Aggregate="Sum" FooterText="Grand Total : " HeaderText="Total" DataFields="Essential, Executive, Premier, PremierPlus" Expression="{0}+{1}+{2}+{3}" HeaderStyle-Width="120px" DataFormatString="{0:N0}"/>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AgeBand, Essential, Executive, Premier, PremierPlus FROM dbo.vAgeBandBenefitClaimItems(@startdate, @enddate, 'Female', @serviceid) AS vAgeBandBenefitClaimItems_1" OnSelecting="SqlDataSource3_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <div class="bg-aqua">Age Band Claims Submitted - Amount (Female)</div>
                        <telerik:RadGrid ID="RadGrid4" runat="server" DataSourceID="SqlDataSource4" GroupPanelPosition="Top" ShowFooter="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AgeBand" FilterControlAltText="Filter AgeBand column" HeaderText="AgeBand" SortExpression="AgeBand" UniqueName="AgeBand">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Essential" DataType="System.Int32" FilterControlAltText="Filter Essential column" HeaderText="Essential" SortExpression="Essential" UniqueName="Essential" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Executive" DataType="System.Int32" FilterControlAltText="Filter Executive column" HeaderText="Executive" SortExpression="Executive" UniqueName="Executive" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Premier" DataType="System.Int32" FilterControlAltText="Filter Premier column" HeaderText="Premier" SortExpression="Premier" UniqueName="Premier" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PremierPlus" DataType="System.Int32" FilterControlAltText="Filter PremierPlus column" HeaderText="PremierPlus" SortExpression="PremierPlus" UniqueName="PremierPlus" DataFormatString="{0:N2}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataType="System.Double" Aggregate="Sum" FooterText="Grand Total : " HeaderText="Total" DataFields="Essential, Executive, Premier, PremierPlus" Expression="{0}+{1}+{2}+{3}" HeaderStyle-Width="120px" DataFormatString="{0:N2}"/>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AgeBand, Essential, Executive, Premier, PremierPlus FROM dbo.vAgeBandBenefitClaimItemAmount(@startdate, @enddate, 'Female', @serviceid) AS vAgeBandBenefitClaimItemAmount_1" OnSelecting="SqlDataSource4_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2"
            DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="MALES" Name="Males" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N0}">
                            <TextStyle FontSize="13" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N0}" />
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="FEMALES" Name="Females" >
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
                    <TitleAppearance Text="Attendance">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Top">
                    <TextStyle  Bold="true" />
                </Appearance>
            </Legend>
            <ChartTitle Text="No of Items - Benefit Option">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BENEFITOPTION, MALES, FEMALES FROM dbo.vBenefitGenderClaimItems(@startdate, @enddate, @serviceid) AS vBenefitGenderClaimItems_1" OnSelecting="chartSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart1"
            DataSourceID="SqlDataSource5" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="MALES" Name="Males" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N02}">
                            <TextStyle FontSize="12" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N02}"/>
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="FEMALES" Name="Females" >
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BENEFITOPTION, MALES, FEMALES FROM dbo.vBenefitGenderClaimItemAmount(@startdate, @enddate, @serviceid) AS vBenefitGenderClaimItemAmount_1" OnSelecting="SqlDataSource5_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
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
                    <TitleAppearance Text="Attendance">
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
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BENEFITOPTION, ISNULL(COUNT(distinct ID),0) AS TOTALCLAIMS FROM dbo.vwStatsDashboard_ClaimItems WHERE (DateofAttendance BETWEEN @startdate AND @enddate) AND ActualPlanID in (31,2,3,18) and ServiceID = @serviceid GROUP BY BENEFITOPTION" OnSelecting="SqlDataSource6_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
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
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BENEFITOPTION, ISNULL(SUM(SysAmountClaimed),0.00) AS CLAIMAMOUNT FROM dbo.vwStatsDashboard_ClaimItems WHERE (DateofAttendance BETWEEN @startdate AND @enddate) AND ActualPlanID in (31,2,3,18) and ServiceID = @serviceid GROUP BY BENEFITOPTION" OnSelecting="SqlDataSource7_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart5"
            DataSourceID="SqlDataSource8" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:BarSeries DataFieldY="MALES" Name="Males" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N0}">
                            <TextStyle FontSize="13" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N0}" />
                    </telerik:BarSeries>
                    <telerik:BarSeries DataFieldY="FEMALES" Name="Females" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N0}">
                            <TextStyle FontSize="13" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N0}" />
                    </telerik:BarSeries>
                    
                </Series>
                <XAxis DataLabelsField="AGEBAND">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Age Band">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Attendance">
                        <TextStyle Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Top">
                    <TextStyle  Bold="true" />
                </Appearance>
            </Legend>
            <ChartTitle Text="No of Items - Age Band">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AGEBAND, MALES, FEMALES FROM dbo.vAgeBandGenderClaimItems(@startdate, @enddate, @serviceid) AS vAgeBandGenderClaimItems_1" OnSelecting="SqlDataSource8_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart6"
            DataSourceID="SqlDataSource9" Skin="Office2010Blue" >
                          
            <PlotArea>
                <Series>
                    <telerik:BarSeries DataFieldY="MALES" Name="Males" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N02}">
                            <TextStyle FontSize="12" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N02}" />
                    </telerik:BarSeries>
                    <telerik:BarSeries DataFieldY="FEMALES" Name="Females" >
                        <LabelsAppearance Visible="true" DataFormatString="{0:N02}">
                            <TextStyle FontSize="12" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" DataFormatString="{0:N02}" />
                    </telerik:BarSeries>
                    
                </Series>
                <XAxis DataLabelsField="AGEBAND">
                    <LabelsAppearance RotationAngle="25">
                        <TextStyle />
                    </LabelsAppearance>
                    <TitleAppearance Text="Age Band">
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
            <ChartTitle Text="Claim Amount - Age Band">
                <Appearance>
                    <TextStyle Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AGEBAND, MALES, FEMALES FROM dbo.vAgeBandGenderClaimItemAmount(@startdate, @enddate, @serviceid) AS vAgeBandGenderClaimItemAmount_1" OnSelecting="SqlDataSource9_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>

                                 <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="RadHtmlChart7" runat="server" Width="100%" Height="500px" DataSourceID="SqlDataSource10">
                                    <ChartTitle Text="No of Claims - Age Band">
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
                                            <telerik:DonutSeries Name="AGEBAND" StartAngle="90" DataFieldY="TOTALCLAIMS" NameField="AGEBAND" >
                                                <LabelsAppearance DataField="AGEBAND" Position="OutsideEnd" Visible="true"></LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N0}"></TooltipsAppearance>
                                            </telerik:DonutSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AGEBAND, TOTALCLAIMS FROM dbo.vAgeBandAllClaimItems(@startdate, @enddate, @serviceid) AS vAgeBandAllClaimItems_1" OnSelecting="SqlDataSource10_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtAgeBandAllClaimAmt" runat="server" Width="100%" Height="500px" DataSourceID="SqlDataSource11">
                                    <ChartTitle Text="Claim Amount - Age Band">
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
                                            <telerik:PieSeries Name="AGEBAND" StartAngle="90" DataFieldY="TOTALCLAIMAMOUNT" NameField="AGEBAND" >
                                                <LabelsAppearance DataField="AGEBAND" Position="OutsideEnd" Visible="true"></LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}"></TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AGEBAND, TOTALCLAIMAMOUNT FROM dbo.vAgeBandAllClaimItemAmount(@startdate, @enddate, @serviceid) AS vAgeBandAllClaimItemAmount_1" OnSelecting="SqlDataSource11_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dlService" Name="ServiceId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>

   

            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
