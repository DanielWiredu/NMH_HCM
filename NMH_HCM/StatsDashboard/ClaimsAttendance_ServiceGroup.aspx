<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ClaimsAttendance_ServiceGroup.aspx.cs" Inherits="NMH_HCM.StatsDashboard.ClaimsAttendance_ServiceGroup" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Dashboard (Today's Summary) - Services </h3>
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
                                         <asp:Button runat="server" ID="btnRunReport" Text="RUN" CssClass="btn btn-success" Width="100%" />
                                     </div> 
                                     <div class="col-md-2">

                    </div>
                                 </div>
                                  
                             </div>

                                 <div class="row">
              
                    <div class="col-md-12">
                        <telerik:RadHtmlChart ID="chtServiceGroup" runat="server" Width="100%" Height="500px" DataSourceID="serviceGroupSource">
                                    <ChartTitle Text="Claim Amount - Service Group">
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
                                            <telerik:PieSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME">
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true" >
                                                    <ClientTemplate>
                                                       #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                        <%-- #= kendo.format(\'{0:P02}\', percentage)# - (#= dataItem.CLAIMAMOUNT# )--%>
                                                       <%-- #= dataItem.percentageValue # % - (#= dataItem.CLAIMAMOUNT# units)--%>
                                                        <%--#= percentage * 100 # %--%>
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="serviceGroupSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) GROUP BY SERVICENAME" OnSelecting="serviceGroupSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServiceMale" runat="server" Width="100%" Height="500px" DataSourceID="serviceMaleSource">
                                    <ChartTitle Text="Claim Amount - Male">
                                        <Appearance Visible="True"  >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:DonutSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:DonutSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="serviceMaleSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND Gender='MALE' GROUP BY SERVICENAME" OnSelecting="serviceMaleSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServiceFemale" runat="server" Width="100%" Height="500px" DataSourceID="serviceFemaleSource">
                                    <ChartTitle Text="Claim Amount - Female">
                                        <Appearance Visible="True" >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="serviceFemaleSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND Gender='FEMALE' GROUP BY SERVICENAME" OnSelecting="serviceFemaleSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServicePrincipal" runat="server" Width="100%" Height="500px" DataSourceID="servicePrincipalSource">
                                    <ChartTitle Text="Claim Amount - Principal">
                                        <Appearance Visible="True"  >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:DonutSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:DonutSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="servicePrincipalSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND MemberTypeID = 1 GROUP BY SERVICENAME" OnSelecting="servicePrincipalSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServiceDependent" runat="server" Width="100%" Height="500px" DataSourceID="serviceDependentSource">
                                    <ChartTitle Text="Claim Amount - Dependent">
                                        <Appearance Visible="True" >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="serviceDependentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND MemberTypeID = 2 GROUP BY SERVICENAME" OnSelecting="serviceDependentSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServiceEssential" runat="server" Width="100%" Height="500px" DataSourceID="serviceEssentialSource">
                                    <ChartTitle Text="Claim Amount - Essential">
                                        <Appearance Visible="True"  >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:DonutSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:DonutSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="serviceEssentialSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND BenefitOption='ESSENTIAL' GROUP BY SERVICENAME" OnSelecting="serviceEssentialSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServiceExecutive" runat="server" Width="100%" Height="500px" DataSourceID="serviceExecutiveSource">
                                    <ChartTitle Text="Claim Amount - Executive">
                                        <Appearance Visible="True" >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="serviceExecutiveSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND BenefitOption='EXECUTIVE' GROUP BY SERVICENAME" OnSelecting="serviceExecutiveSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServicePremier" runat="server" Width="100%" Height="500px" DataSourceID="servicePremierSource">
                                    <ChartTitle Text="Claim Amount - Premier">
                                        <Appearance Visible="True"  >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:DonutSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:DonutSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="servicePremierSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND BenefitOption='PREMIER' GROUP BY SERVICENAME" OnSelecting="servicePremierSource_Selecting">
                    <SelectParameters>
                                <asp:ControlParameter ControlID="dpStartDate" Name="startdate" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="dpEndDate" Name="enddate" PropertyName="SelectedDate" />
                            </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <telerik:RadHtmlChart ID="chtServicePremierPlus" runat="server" Width="100%" Height="500px" DataSourceID="servicePremierPlusSource">
                                    <ChartTitle Text="Claim Amount - Premier Plus">
                                        <Appearance Visible="True" >
                                            <TextStyle Bold="true" />
                                        </Appearance>
                                    </ChartTitle>
                                    <Legend>
                                        <Appearance Visible="true" Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries Name="SERVICENAME" StartAngle="90" DataFieldY="CLAIMAMOUNT" NameField="SERVICENAME" >
                                                <LabelsAppearance DataField="SERVICENAME" Position="OutsideEnd" Visible="true">
                                                    <ClientTemplate>
                                                        #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)# - (#= kendo.format(\'{0:P02}\', percentage)#)
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance DataFormatString="{0:N02}">
                                                    <ClientTemplate>
                                                         #= dataItem.SERVICENAME# - #= kendo.format(\'{0:N02}\', dataItem.CLAIMAMOUNT)#
                                                    </ClientTemplate>
                                                </TooltipsAppearance>
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
             
                <asp:SqlDataSource ID="servicePremierPlusSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SERVICENAME, sum(SysAmountClaimed) as CLAIMAMOUNT from vwStatsDashboard_ClaimItems WHERE (DateofAttendance between @startdate AND @enddate) AND BenefitOption='PREMIER PLUS' GROUP BY SERVICENAME" OnSelecting="servicePremierPlusSource_Selecting">
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
