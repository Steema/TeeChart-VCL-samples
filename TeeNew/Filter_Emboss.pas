unit Filter_Emboss;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeAntiAlias, TeeSurfa,
  TeeFilters;

type
  TFilterEmboss = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TContourSeries;
    ChartTool1: TAntiAliasTool;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EmbossFilter: TEmbossFilter;    
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterEmboss.FormCreate(Sender: TObject);
begin
  inherited;

  EmbossFilter := TEmbossFilter.Create(ChartTool1.Filters);
end;

procedure TFilterEmboss.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TFilterEmboss);
end.
