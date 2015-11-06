{$I TeeDefs.inc}
unit Function_DownSampling;

interface

uses
  {$IFNDEF LINUX}
  Windows,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeDownSampling, Series, TeCanvas;

type
  TDownSampling = class(TBaseForm)
    Series1: TPointSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label3: TLabel;
    ComboBox1: TComboFlat;
    Series2: TLineSeries;
    Button1: TButton;
    Label4: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DownSampleFun: TDownSamplingFunction;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TDownSampling.ComboBox1Change(Sender: TObject);
begin
  DownSampleFun.DownSampleMethod := TDownSampleMethod(ComboBox1.ItemIndex);
  Label4.Caption := 'Number of reduced points: '+IntToStr(DownSampleFun.ReducedSize);
end;

procedure TDownSampling.Edit1Change(Sender: TObject);
var NumPoints: Integer;
begin
  NumPoints := StrToIntDef(Edit1.Text,200);
  Series1.FillSampleValues(NumPoints);
  UpDown1.Position := NumPoints;

  Series2.Clear;
  Label4.Caption := '';
end;

procedure TDownSampling.FormCreate(Sender: TObject);
begin
  inherited;

  // create and connect downsample function to series 2
  Series1.FillSampleValues(200);

  ComboBox1.ItemIndex:=0;

  DownSampleFun := TDownSamplingFunction.Create(Chart1);
  Series2.SetFunction(DownSampleFun);

  DownSampleFun.Tolerance := 4;
  DownSampleFun.DownSampleMethod := dsAverage;

  Series2.DataSource := Series1;
end;

procedure TDownSampling.Edit2Change(Sender: TObject);
begin
  DownSampleFun.Tolerance := StrToIntDef(Edit2.Text,4);
  UpDown2.Position := Round(DownSampleFun.Tolerance);
  Label4.Caption := 'Number of reduced points: '+IntToStr(DownSampleFun.ReducedSize);
end;

procedure TDownSampling.Button1Click(Sender: TObject);
begin
  Series2.CheckDataSource;
  Label4.Caption := 'Number of reduced points: '+IntToStr(DownSampleFun.ReducedSize);
end;

procedure TDownSampling.FormShow(Sender: TObject);
begin
  inherited;
  Series2.CheckDataSource;
  Label4.Caption := 'Number of reduced points: '+IntToStr(DownSampleFun.ReducedSize);
end;

initialization
  RegisterClass(TDownSampling);
end.
