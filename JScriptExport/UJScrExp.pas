unit UJScrExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls, VCLTee.TeeComma,
  VCLTee.Series, VCLTee.TeeHTML5Canvas, VCLTee.TeeJavascriptEditor, VCLTee.TeeJavascript,
  Vcl.ComCtrls, ShellAPI;

  //TeeChart HTML5 Javascript export formats.
  //VCLTee.TeeHTML5Canvas: canvas methods, moveTo,lineTo,etc, converted to jscript html5-canvas instructions.
  //VCLTee.TeeJavascript: Uses TeeChart's jscript charting library to plot live chart.

type
  TForm1 = class(TForm)
    TeeCommander1: TTeeCommander;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    Memo1: TMemo;
    Button2: TButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    Memo3: TMemo;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  desWidth, desHeight: Integer;
  AppDir : String;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var exporter:  TJavascriptExportFormat;
    CustCodeStr : TStringlist;
    srcLinks : TStrings;
begin
  //Javascript - "live" chart export.
  exporter:=TJavascriptExportFormat.Create;

  exporter.Width := DesWidth;
  exporter.Height := DesHeight;


  exporter.SaveToFile(Chart1,AppDir + 'output\2_Chartfromcode.htm');

  Memo2.Lines := exporter.JScript;

  //add some modifications
  CustCodeStr := TStringlist.Create;
  CustCodeStr.Add('  addFeatures('+exporter.ChartName+');');
  exporter.CustomCode := CustCodeStr;

  //add some source links
  With Memo3 do
  Begin
    Lines := exporter.JScript;
    Lines.Insert(6,'<script src="jutils.js" type="text/javascript"></script>');
    Lines.Insert(6,'<script src="'+exporter.SourceScriptPath+'/teechart-animations.js" type="text/javascript"></script>');
    Lines.Insert(6,'<script src="'+exporter.SourceScriptPath+'/teechart-extras.js" type="text/javascript"></script>');
    Lines.SaveToFile(AppDir + 'output\3_Chart_JScript_mods.htm');
  End;

end;

procedure TForm1.Button2Click(Sender: TObject);
var exporter:  THTML5ExportFormat;
begin
  //HTML5 Canvas fixed graphic
  exporter:=  THTML5ExportFormat.Create;

  TeeSaveToHTML5File(Chart1,AppDir + 'output\1_HTML5_Canvas_Chart.htm', DesWidth, DesHeight);

  exporter.Width := DesWidth;
  exporter.Height := DesHeight;
  exporter.Panel := Chart1;
  Memo1.Lines := exporter.HTML5;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //open the folder where the html output files are
  ShellExecute(Application.Handle,
      nil,
      'explorer.exe',
      PChar(AppDir + 'output'), //wherever you want the window to open to
      nil,
      SW_NORMAL
      );
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Series1.FillSampleValues();
  Chart1.Axes.Left.SetMinMax(0,Series1.MaxYValue+20);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Series1.FillSampleValues();
  Chart1.Axes.Left.SetMinMax(0,Series1.MaxYValue+20);

  AppDir := GetCurrentDir() + '..\..\..\';

  DesWidth := 1500;
  DesHeight:= 700;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Panel1.Width := Form1.ClientWidth div 2;
end;

end.
