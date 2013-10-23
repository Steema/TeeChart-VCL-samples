unit Marks_GenFormat;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TMarksGenFormat = class(TBaseForm)
    PageControl1: TPageControl;
    Series1: TPointSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

Uses TeeCustomShapeEditor;

procedure TMarksGenFormat.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(4);
end;

procedure TMarksGenFormat.FormShow(Sender: TObject);
begin
  inherited;
  InsertTeeObjectForm(PageControl1,Series1.Marks).RefreshControls(Series1.Marks);
end;

initialization
  RegisterClass(TMarksGenFormat);
end.
