unit Tool_DrawLineClickedTolerance;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, CandleCh, OHLChart,
  TeeTools;

type
  TToolDrawLineClickedTolerance = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TCandleSeries;
    Series2: TVolumeSeries;
    cbEnableDraw: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbEnableDrawClick(Sender: TObject);
  private
    { Private declarations }
    Tool : TDrawLineTool;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TToolDrawLineClickedTolerance.FormCreate(Sender: TObject);
begin
  inherited;

  // Create tool
  Tool:=TDrawLineTool.Create(Self);

  // Set Series
  Tool.Series:=Series1;

  // Add to chart
  Chart1.Tools.Add(Tool);

  with Tool do
  begin
    EnableDraw:=False;
    Pen.Width:=4;
    Pen.Color:=clNavy;

    Lines.AddLine( Round(Series1.DateValues[8]),Round(Series1.HighValues[1]),
                   Round(Series1.DateValues[20]),Round(Series1.HighValues[20]));
  end;
end;

procedure TToolDrawLineClickedTolerance.Chart1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dline : TDrawLine;
  i     : integer;
begin
  for i := 0 to Tool.Lines.Count-1 do
      Tool.Lines[i].Pen.Color:=clNavy;

  dline:=Tool.Clicked(x,y,UpDown1.Position);

  if dline <> nil then
  begin
    Chart1.Title.Text[0]:= 'DrawLine index : '+ IntToStr(dline.Index) + ' Clicked !';
    dline.Pen.Color:=clRed;
  end;
end;

procedure TToolDrawLineClickedTolerance.cbEnableDrawClick(Sender: TObject);
begin
  Tool.EnableDraw:=cbEnableDraw.Checked;
end;

initialization
  RegisterClass(TToolDrawLineClickedTolerance);
end.
