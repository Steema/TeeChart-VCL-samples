unit Canvas_CompactChart;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeSeriesBandTool, Series, TeeSeriesRegion,
  TeCanvas, TeeTools, TeeAnimations;

type
  TCanvas_CompactChartForm = class(TBaseForm)
    Button1: TButton;
    Series1: TLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    EWidth: TEdit;
    EHeight: TEdit;
    UDHeight: TUpDown;
    UDWidth: TUpDown;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeFlexCanvas;

procedure TCanvas_CompactChartForm.Button1Click(Sender: TObject);
begin
  if FileExists(Edit1.Text+'\mxmlc.exe') then
  begin
    TeeSaveStringOption('FlexCanvas_Compiler',Edit1.Text);
    TeeSaveStringOption('FlexCanvas_Temp',Edit2.Text);

    TFlexOptions.Compile(Chart1, UDWidth.Position, UDHeight.Position,
                         Edit1.Text, Edit2.Text, Chart1.Name);
  end
  else
    ShowMessage('Adobe Flex compiler (mxmlc.exe) cannot be found at path: '+#13+
                Edit1.Text+#13+
                'Please download and install the Flex SDK from www.adobe.com'); 
end;

procedure TCanvas_CompactChartForm.FormCreate(Sender: TObject);
var Animation1:TExpandAnimation;
    Tool1: TMarksTipTool;
begin
  inherited;

  Series1.FillSampleValues(8);
  Chart1.Legend.Hide;
  
  Tool1:=TMarksTipTool.Create(Self);
  Tool1.Series:=Series1;
  Chart1.Tools.Add(Tool1);

  Animation1:=TExpandAnimation.Create(Self);
  Animation1.Target:=cpSeriesPointer;
  Animation1.Trigger:=atMouseOver;
  Chart1.Animations.Add(Animation1);

  Edit1.Text:=TeeReadStringOption('FlexCanvas_Compiler',Edit1.Text);
  Edit2.Text:=TeeReadStringOption('FlexCanvas_Temp',Edit2.Text);
end;

initialization
  RegisterClass(TCanvas_CompactChartForm);
end.
