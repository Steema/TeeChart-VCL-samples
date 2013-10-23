unit SeriesType_Gantt;
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
  Base, TeeProcs, TeEngine, Chart, Series, GanttCh;

type
  TGanttSeriesForm = class(TBaseForm)
    Series1: TGanttSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

Uses EditChar;

procedure TGanttSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TGanttSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;
end;

procedure TGanttSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TGanttSeriesForm);
end.
