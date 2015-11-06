unit Title_GenFormat;
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
  TTitleGenFormat = class(TBaseForm)
    PageControl1: TPageControl;
    Splitter1: TSplitter;
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

procedure TTitleGenFormat.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.Title.Transparent:=False;
end;

procedure TTitleGenFormat.FormShow(Sender: TObject);
begin
  inherited;
  InsertTeeObjectForm(PageControl1,Chart1.Title).RefreshControls(Chart1.Title);
end;

initialization
  RegisterClass(TTitleGenFormat);
end.
