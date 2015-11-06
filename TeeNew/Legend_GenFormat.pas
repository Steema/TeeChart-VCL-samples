unit Legend_GenFormat;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeDonut;

type
  TLegendGenFormat = class(TBaseForm)
    PageControl1: TPageControl;
    Series1: TDonutSeries;
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

procedure TLegendGenFormat.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
end;

procedure TLegendGenFormat.FormShow(Sender: TObject);
begin
  inherited;
  InsertTeeObjectForm(PageControl1,Chart1.Legend).RefreshControls(Chart1.Legend);
end;

initialization
  RegisterClass(TLegendGenFormat);
end.
