unit Tool_PageNumShowButtons;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeePageNumTool;

type
  TToolPageNumShowButtons = class(TBaseForm)
    bEdit: TBitBtn;
    Series1: TBarSeries;
    cbButtons: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure cbButtonsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tool : TPageNumTool;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar;

procedure TToolPageNumShowButtons.FormCreate(Sender: TObject);
begin
  inherited;

  // Create tool
  Tool:=TPageNumTool.Create(Self);

  // Add to chart
  Chart1.Tools.Add(Tool);
end;

procedure TToolPageNumShowButtons.bEditClick(Sender: TObject);
begin
  EditChartTool(Self,Tool);
end;

procedure TToolPageNumShowButtons.cbButtonsClick(Sender: TObject);
begin
  Tool.ShowButtons:=cbButtons.Checked;
end;

initialization
  RegisterClass(TToolPageNumShowButtons);
end.
