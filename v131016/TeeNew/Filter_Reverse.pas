unit Filter_Reverse;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeFilters,
  TeeAntiAlias;

type
  TFilterReverse = class(TBaseForm)
    Series1: THorizBarSeries;
    cbReverse: TCheckBox;
    ChartTool1: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure cbReverseClick(Sender: TObject);
  private
    { Private declarations }
    ReverseFilter: TReverseFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterReverse.FormCreate(Sender: TObject);
begin
  inherited;

  ReverseFilter := TReverseFilter.Create(ChartTool1.Filters);
end;

procedure TFilterReverse.cbReverseClick(Sender: TObject);
begin
  ChartTool1.Active:=cbReverse.Checked;
end;

initialization
  RegisterClass(TFilterReverse);
end.
