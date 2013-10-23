unit Function_CCI;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, OHLChart, CandleCh,
  TeeCCIFunction, TeCanvas, StatChar;

type
  TCCIFuncDemo = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    Edit2: TEdit;
    Series1: TCandleSeries;
    Series2: TLineSeries;
    TeeFunction1: TCCIFunction;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TCCIFuncDemo.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
end;

procedure TCCIFuncDemo.Edit2Change(Sender: TObject);
begin
  TeeFunction1.Constant:=StrToFloatDef(Edit2.Text,TeeFunction1.Constant);
end;

procedure TCCIFuncDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues; // <--- candle

  Edit2.Text:=FloatToStr(TeeFunction1.Constant);
end;

initialization
  RegisterClass(TCCIFuncDemo);
end.
