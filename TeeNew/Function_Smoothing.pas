unit Function_Smoothing;
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
  Base, TeEngine, TeeSpline, Series, TeeProcs, Chart, TeCanvas;

type
  TSmoothingFunctionDemo = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TSmoothingFunction;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Label1: TLabel;
    UDFactor: TUpDown;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSmoothingFunctionDemo.CheckBox3Click(Sender: TObject);
begin
  Series1.Pointer.Visible:=CheckBox3.Checked;
end;

procedure TSmoothingFunctionDemo.CheckBox2Click(Sender: TObject);
begin
  Series1.Visible:=CheckBox2.Checked;
end;

procedure TSmoothingFunctionDemo.CheckBox1Click(Sender: TObject);
begin
  TeeFunction1.Interpolate:=CheckBox1.Checked;
end;

procedure TSmoothingFunctionDemo.Edit2Change(Sender: TObject);
begin
  TeeFunction1.Factor:=UDFactor.Position;
end;

procedure TSmoothingFunctionDemo.Button2Click(Sender: TObject);
begin
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TSmoothingFunctionDemo);
end.
