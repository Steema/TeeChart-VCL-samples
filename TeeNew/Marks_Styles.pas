unit Marks_Styles;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TMarksStyles = class(TBaseForm)
    Label1: TLabel;
    cbStyle: TComboFlat;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
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

procedure TMarksStyles.FormCreate(Sender: TObject);
begin
  inherited;
  cbStyle.ItemIndex:=10;
  cbStyleChange(Self);
end;

procedure TMarksStyles.cbStyleChange(Sender: TObject);
begin
  Series1.Marks.Style:=TSeriesMarksStyle(cbStyle.ItemIndex);
end;

initialization
  RegisterClass(TMarksStyles);
end.
