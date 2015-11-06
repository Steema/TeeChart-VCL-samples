unit Series_Depth;
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
  Base, Series, TeCanvas, TeEngine, TeeProcs, Chart, TeeComma;

type
  TSeriesDepth = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TBarSeries;
    Series3: TLineSeries;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    TeeCommander1: TTeeCommander;
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TSeriesDepth.CheckBox1Click(Sender: TObject);
var tmp: Integer;
begin
  if CheckBox1.Checked then tmp:=-1
                       else tmp:=UpDown1.Position;
  Series1.Depth:=tmp;
  Series2.Depth:=tmp;
  Series3.Depth:=tmp;
end;

procedure TSeriesDepth.Edit1Change(Sender: TObject);
begin
  CheckBox1.Checked:=False;
  Series1.Depth:=UpDown1.Position;
  Series2.Depth:=UpDown1.Position;
  Series3.Depth:=UpDown1.Position;
end;

procedure TSeriesDepth.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  Series2.FillSampleValues(6);
  Series3.FillSampleValues(10);
end;

initialization
  RegisterClass(TSeriesDepth);
end.
