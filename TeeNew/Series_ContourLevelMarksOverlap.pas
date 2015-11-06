unit Series_ContourLevelMarksOverlap;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas,
  Series_ContourLevelMarks, TeeSurfa;

type
  TSeriesContourLevelMarksOverlap = class(TSeriesContourLevelMarks)
    cbAntiOverlap: TCheckBox;
    procedure cbAntiOverlapClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TSeriesContourLevelMarksOverlap.cbAntiOverlapClick(
  Sender: TObject);
begin
  Series1.ContourMarks.AntiOverlap:=cbAntiOverlap.Checked;
end;

procedure TSeriesContourLevelMarksOverlap.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.ContourMarks.AntiOverlap:=true;
end;

initialization
  RegisterClass(TSeriesContourLevelMarksOverlap);
end.

