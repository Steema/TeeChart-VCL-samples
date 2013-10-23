unit Legend_Widths;
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
  Base, TeEngine, Series, OHLChart, CandleCh, TeeProcs, Chart, TeCanvas;

type
  TLegendWidths = class(TBaseForm)
    Series1: TCandleSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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

procedure TLegendWidths.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  Chart1.Draw;
end;

procedure TLegendWidths.Edit1Change(Sender: TObject);
begin
  Chart1.Legend.ColumnWidths[0]:=UpDown1.Position;
  Chart1.Repaint;
end;

procedure TLegendWidths.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    Chart1.Legend.ColumnWidthAuto:=true;
  end
  else begin
    Chart1.Legend.ColumnWidthAuto:=false;
    Chart1.Legend.ColumnWidths[0]:=UpDown1.Position;
    Chart1.Legend.ColumnWidths[1]:=UpDown2.Position;
  end;
  Chart1.Repaint;

  UpDown1.Enabled:=not CheckBox1.Checked;
  UpDown2.Enabled:=not CheckBox1.Checked;
  Edit1.Enabled:=not CheckBox1.Checked;
  Edit2.Enabled:=not CheckBox1.Checked;
end;

procedure TLegendWidths.Edit2Change(Sender: TObject);
begin
  Chart1.Legend.ColumnWidths[1]:=UpDown2.Position;
  Chart1.Repaint;
end;

initialization
  RegisterClass(TLegendWidths);
end.
