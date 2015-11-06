unit Marks_FontSeriesColor;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TMarksFontSeriesColor = class(TBaseForm)
    Series1: TPieSeries;
    CBMarksFontSeriesColor: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CBMarksFontSeriesColorClick(Sender: TObject);
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

procedure TMarksFontSeriesColor.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Marks.FontSeriesColor := true;
end;

procedure TMarksFontSeriesColor.CBMarksFontSeriesColorClick(
  Sender: TObject);
begin
  Series1.Marks.FontSeriesColor := CBMarksFontSeriesColor.Checked;
end;

initialization
  RegisterClass(TMarksFontSeriesColor);
end.
