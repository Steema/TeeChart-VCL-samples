unit Chart_Gallery;
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
  Base, TeePenDlg, TeeProcs, TeEngine, Chart, Series, TeeGally;

type
  TChartGallery = class(TBaseForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Gallery: TTeeGallery;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartGallery.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.Visible:=False;
  Panel1.Visible:=False;

  Gallery:=TTeeGallery.Create(Self);
  Gallery.P1.Visible:=False;

  {$IFDEF CLX}
  AddFormTo(Gallery,Self);
  {$ELSE}
  With Gallery do
  begin
    Align:=alClient;
    BorderStyle:=bsNone;
    Parent:=Self;
  end;
  {$ENDIF}
end;

procedure TChartGallery.FormShow(Sender: TObject);
begin
  inherited;
  Gallery.Show;
end;

initialization
  RegisterClass(TChartGallery);
end.
