<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="BarcodesReport.aspx.cs" Inherits="NMH_HCM.BarcodesReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Barcode Report</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="rptBarcodes.rpt">
                    </Report>
                </CR:CrystalReportSource>
                </div>
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ReuseParameterValuesOnRefresh="True" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" BestFitPage="False" />
                  
                
                  
            </div><!-- /.box-body -->
         
          </div><!-- /.box -->
</asp:Content>
