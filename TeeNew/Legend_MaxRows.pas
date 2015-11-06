unit Legend_MaxRows;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, TeCanvas, Chart;

type
  TLegendMaxRowsForm = class(TBaseForm)
    Series1: TFastLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
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

procedure TLegendMaxRowsForm.Edit1Change(Sender: TObject);
begin
  if Assigned(Series1) then
     Chart1.Legend.MaxNumRows := UpDown1.Position;
end;

procedure TLegendMaxRowsForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues(100);

  Chart1.Axes.Left.Increment := Series1.YValues.MaxValue / 5;
  Chart1.Axes.Bottom.Increment := Series1.XValues.MaxValue / 5;
end;

initialization
  RegisterClass(TLegendMaxRowsForm);
end.
