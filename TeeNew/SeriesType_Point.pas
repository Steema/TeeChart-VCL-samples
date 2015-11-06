unit SeriesType_Point;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus, TeeTools;

type
  TPointSeriesForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Timer1: TTimer;
    GridBandTool1: TGridBandTool;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

procedure TPointSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;
end;

procedure TPointSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox2.Checked;
end;

procedure TPointSeriesForm.Timer1Timer(Sender: TObject);
var t    : Integer;
    tmpX : Double;
begin
  { stop timer }
  Timer1.Enabled:=False;

  { add a new point to each series }
  With Chart1 do
  begin
    for t:=0 to SeriesCount-1 do
    With Series[t] do
    begin
      tmpX:=XValues[1]-XValues[0];
      Delete(0);
      AddXY( XValues.Last+tmpX,
             YValues.Last+Random(100)-50,'',clTeeColor);
    end;
  end;

  { re-enable timer again }
  Timer1.Enabled:=True;
end;

procedure TPointSeriesForm.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;
  With Chart1 do
  for t:=0 to SeriesCount-1 do
     Series[t].FillSampleValues(20);
end;

initialization
  RegisterClass(TPointSeriesForm);
end.
