unit Editor_PixelsPerInch;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeEdit;

type
  TEditorPixelsPerInch = class(TBaseForm)
    bEdit: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    cbDefault: TCheckBox;
    Series1: TLineSeries;
    ChartEditor1: TChartEditor;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cbDefaultClick(Sender: TObject);
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

procedure TEditorPixelsPerInch.FormCreate(Sender: TObject);
begin
  inherited;
  UpDown1.Position:=150;
end;

procedure TEditorPixelsPerInch.bEditClick(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TEditorPixelsPerInch.Edit1Change(Sender: TObject);
begin
  ChartEditor1.PixelsPerInch:=UpDown1.Position;

  cbDefault.Checked:=ChartEditor1.PixelsPerInch=0;
  cbDefault.Enabled:=not cbDefault.Checked;
end;

procedure TEditorPixelsPerInch.cbDefaultClick(Sender: TObject);
begin
  if cbDefault.Checked then
     UpDown1.Position:=0;

  cbDefault.Enabled:=not cbDefault.Checked;
end;

initialization
  RegisterClass(TEditorPixelsPerInch);
end.
