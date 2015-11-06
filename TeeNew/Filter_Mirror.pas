unit Filter_Mirror;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeFilters, TeeAntiAlias;

type
  TFilterMirror = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    ChartTool1: TAntiAliasTool;
    Label1: TLabel;
    cbDirection: TComboFlat;
    procedure FormCreate(Sender: TObject);
    procedure cbDirectionChange(Sender: TObject);
  private
    { Private declarations }
    MirrorFilter: TMirrorFilter;    
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterMirror.FormCreate(Sender: TObject);
begin
  inherited;

  MirrorFilter := TMirrorFilter.Create(ChartTool1.Filters);
  MirrorFilter.Direction:=mdLeft;
  cbDirection.ItemIndex := 3;
end;

procedure TFilterMirror.cbDirectionChange(Sender: TObject);
begin
  MirrorFilter.Direction:=TMirrorDirection(cbDirection.ItemIndex);
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterMirror);
end.
