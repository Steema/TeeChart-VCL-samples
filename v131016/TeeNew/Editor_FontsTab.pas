unit Editor_FontsTab;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, StatChar;

type
  TEditorFontsTab = class(TBaseForm)
    Button1: TButton;
    Series1: THistogramSeries;
    procedure Button1Click(Sender: TObject);
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
  TeeEdiFont;

procedure TEditorFontsTab.Button1Click(Sender: TObject);
begin
  EditTeeFontEx(Self,Chart1.Axes.Left.LabelsFont);
end;

initialization
  RegisterClass(TEditorFontsTab);
end.
