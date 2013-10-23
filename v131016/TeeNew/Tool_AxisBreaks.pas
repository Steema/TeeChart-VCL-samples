unit Tool_AxisBreaks;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeCanvas, TeePenDlg,
  TeeAxisBreaks;

type
  TTool_AxisBreaksForm = class(TBaseForm)
    Button1: TButton;
    ButtonPen1: TButtonPen;
    BBrush: TButton;
    TrackBar2: TTrackBar;
    TrackBar1: TTrackBar;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    cbAxis: TComboBox;
    Label1: TLabel;
    cbBreakStyle: TComboBox;
    Series1: TLineSeries;
    LblBreakSize: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure cbBreakStyleChange(Sender: TObject);
    procedure cbAxisChange(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure BBrushClick(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
  private
    { Private declarations }

    a : TAxisBreaksTool;

    procedure CheckAxis;
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
  TeeBrushDlg;

procedure TTool_AxisBreaksForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Add(0);
  Series1.Add(1);
  Series1.Add(5);
  Series1.Add(4);
  Series1.Add(7);
  Series1.Add(2);
  Series1.Add(3);
  Series1.Add(4);

  Chart1.Axes.Left.Increment := 0.2;
  Chart1.Axes.Bottom.Increment := 0.2;

  a:=TAxisBreaksTool.Create(Self);
  with a do
  begin
   Name:='AxisBreaks1';
   Axis := Chart1.Axes.Left;
   Pen.Width:=1;
   Pen.Color := clBlack;
   Brush.Gradient.EndColor := clGrayText;
   Brush.Gradient.Visible := true;
   GapSize := 15;
  end;

  ButtonPen1.LinkPen(a.Pen);
  Chart1.Walls.Back.Pen.Hide;
  Button1Click(self);

  cbAxis.ItemIndex:=0;
  cbBreakStyle.ItemIndex:=0;
end;

procedure TTool_AxisBreaksForm.Button1Click(Sender: TObject);
begin
  TrackBar1.Enabled := (a.Breaks.Count=0);
  TrackBar2.Enabled := (a.Breaks.Count=0);
  cbAxis.Enabled := (a.Breaks.Count=0);
  cbBreakStyle.Enabled := (a.Breaks.Count=0);
  BBrush.Enabled := (a.Breaks.Count=0);
  ButtonPen1.Enabled := (a.Breaks.Count=0);

  if a.Breaks.Count=0 then
  begin
    if a.Axis = Chart1.Axes.Left then
    begin
      a.Breaks.Add(2,4);
    end
    else begin
      a.Breaks.Add(2,4);
    end;

    Button1.Caption:='Clear breaks';

    TrackBar2.Position:=Round(a.Breaks.Item[0].EndValue - a.Breaks.Item[0].StartValue) * 10;
  end
  else
  begin
    a.Breaks.Clear;

    Button1.Caption:='Add break';
  end;
end;

procedure TTool_AxisBreaksForm.TrackBar1Change(Sender: TObject);
begin
  a.GapSize:=TrackBar1.Position;
end;

procedure TTool_AxisBreaksForm.cbBreakStyleChange(Sender: TObject);
begin
  a.Breaks.Item[0].AxisBreakStyle := TAxisBreakStyle(cbBreakStyle.ItemIndex);
end;

procedure TTool_AxisBreaksForm.cbAxisChange(Sender: TObject);
begin
  CheckAxis();
end;

procedure TTool_AxisBreaksForm.CheckAxis;
begin
  a.Breaks.Clear;

  if (cbAxis.ItemIndex=0) then
    a.Axis := Chart1.Axes.Left
  else
    a.Axis := Chart1.Axes.Bottom;

  Button1Click(Self);
  cbBreakStyleChange(Self);
end;

procedure TTool_AxisBreaksForm.TrackBar2Change(Sender: TObject);
begin
  if a.Breaks.Count > 0 then
    a.Breaks.Item[0].EndValue:=a.Breaks.Item[0].StartValue + TrackBar2.Position / 10
  else
    TrackBar2.Position := 0;

  LblBreakSize.Caption := FormatFloat('0.00', TrackBar2.Position / 10);
end;

procedure TTool_AxisBreaksForm.BBrushClick(Sender: TObject);
begin
  EditChartBrush(Self,a.Brush);
end;

procedure TTool_AxisBreaksForm.Chart1AfterDraw(Sender: TObject);
begin
  Application.ProcessMessages;
end;

initialization
  RegisterClass(TTool_AxisBreaksForm);
end.
