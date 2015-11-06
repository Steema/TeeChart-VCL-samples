unit Legend_PositionPercent;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeCanvas, TeeProcs, Chart, TeeVolumePipe;

type
  TLegendPositionPercentForm = class(TBaseForm)
    cbCustom: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    cbPercent: TCheckBox;
    Series1: TVolumePipeSeries;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure cbCustomClick(Sender: TObject);
    procedure cbPercentClick(Sender: TObject);
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

uses
  Math;

procedure TLegendPositionPercentForm.Edit1Change(Sender: TObject);
begin
  if cbPercent.Checked then
     Chart1.Legend.LeftPercent:=StrToInt(edit1.Text)
  else
     Chart1.Legend.Left:=StrToInt(edit1.Text);
end;

procedure TLegendPositionPercentForm.Edit2Change(Sender: TObject);
begin
  if cbPercent.Checked then
     Chart1.Legend.TopPercent:=StrToInt(edit2.Text)
  else
     Chart1.Legend.Top:=StrToInt(edit2.Text);
end;

procedure TLegendPositionPercentForm.cbCustomClick(Sender: TObject);
begin
  Chart1.Legend.CustomPosition:=cbCustom.Checked;

  Edit1.Enabled:=cbCustom.Checked;
  Edit2.Enabled:=cbCustom.Checked;
  cbPercent.Enabled:=cbCustom.Checked;
end;

procedure TLegendPositionPercentForm.cbPercentClick(Sender: TObject);
begin
  if cbPercent.Checked then
  begin
    Chart1.Legend.PositionUnits:=muPercent;

    Edit1.Text:=IntToStr(Chart1.Legend.LeftPercent);
    Edit2.Text:=IntToStr(Chart1.Legend.TopPercent);
  end
  else
  begin
    Chart1.Legend.PositionUnits:=muPixels;

    Edit1.Text:=IntToStr(Chart1.Legend.Left);
    Edit2.Text:=IntToStr(Chart1.Legend.Top);
  end;
end;

initialization
  RegisterClass(TLegendPositionPercentForm);
end.
