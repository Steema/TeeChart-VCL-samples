unit Filter_Flip;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeAntiAlias,
  TeeFilters, TeeCalendar;

type
  TFilterFlip = class(TBaseForm)
    cbFlip: TCheckBox;
    Series1: TCalendarSeries;
    ChartTool1: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure cbFlipClick(Sender: TObject);
  private
    { Private declarations }
    FlipFilter: TFlipFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterFlip.FormCreate(Sender: TObject);
begin
  inherited;

  FlipFilter := TFlipFilter.Create(ChartTool1.Filters);
end;

procedure TFilterFlip.cbFlipClick(Sender: TObject);
begin
  FlipFilter.Enabled:=cbFlip.Checked;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterFlip);
end.

