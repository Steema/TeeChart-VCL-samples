unit Canvas_FontPicture;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, 

  jpeg,

  TeeFilters, TeeGDIPlus;

type
  TCanvasFontPicture = class(TBaseForm)
    Series1: TPieSeries;
    Image1: TImage;
    BBrowse: TButton;
    sbZoom: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbZoomChange(Sender: TObject);
    procedure BBrowseClick(Sender: TObject);
  private
    { Private declarations }
    zoomFilter:TZoomFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeBrushDlg;

procedure TCanvasFontPicture.FormCreate(Sender: TObject);
begin
  Chart1.Gradient.Visible:=True;
  Chart1.Gradient.EndColor:=clRed;

  Chart1.Title.Font.Size:=48;
  Chart1.Title.Font.Picture.Assign(Image1.Picture);
  Chart1.Title.Font.OutLine.Visible:=True;

  ZoomFilter :=TZoomFilter.Create(Chart1.Title.Font.Picture.Filters);

  Chart1.View3DOptions.FontZoom:=160;
  Chart1.Chart3DPercent:=50;

  Series1.Gradient.Visible:=True;
  Series1.Marks.Callout.Length:=50;
end;

procedure TCanvasFontPicture.sbZoomChange(Sender: TObject);
begin
  zoomFilter.Percent:=sbZoom.Position;
  Chart1.Invalidate;
  Label2.Caption:=IntToStr(sbZoom.Position);
end;

procedure TCanvasFontPicture.BBrowseClick(Sender: TObject);
begin
  Image1.Picture.Assign(nil);
  TeeLoadClearImage(Self,Image1.Picture);
  Chart1.Title.Font.Picture.Assign(Image1.Picture);
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TCanvasFontPicture);
end.
