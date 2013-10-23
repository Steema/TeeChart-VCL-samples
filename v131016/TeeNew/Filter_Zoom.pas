unit Filter_Zoom;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeFilters, TeCanvas;

type
  TFilterZoom = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    cbSmooth: TCheckBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditLeft: TEdit;
    EditTop: TEdit;
    EditWidth: TEdit;
    EditHeight: TEdit;
    UpLeft: TUpDown;
    UpWidth: TUpDown;
    UpTop: TUpDown;
    UpHeight: TUpDown;
    Series1: TPointSeries;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbSmoothClick(Sender: TObject);
    procedure EditLeftChange(Sender: TObject);
    procedure EditWidthChange(Sender: TObject);
    procedure EditTopChange(Sender: TObject);
    procedure EditHeightChange(Sender: TObject);
  private
    { Private declarations }
    ZoomFilter: TZoomFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterZoom.FormCreate(Sender: TObject);
begin
  inherited;

  ZoomFilter := TZoomFilter.Create(Chart1.Walls.Back.Picture.Filters);

  with ZoomFilter do
  begin
    with Region do
    begin
      Left:=300;
      Top:=60;
      Width:=200;
      Height:=200;

      UpLeft.Position:=Left;
      UpWidth.Position:=Width;
      UpTop.Position:=Top;
      UpHeight.Position:=Height;
    end;

    Percent:=55;
    ScrollBar1.Position:=Round(Percent);
    Smooth:= True;
  end;
end;

procedure TFilterZoom.ScrollBar1Change(Sender: TObject);
begin
  ZoomFilter.Percent:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
  Chart1.Invalidate;
end;

procedure TFilterZoom.cbSmoothClick(Sender: TObject);
begin
  ZoomFilter.Smooth:=cbSmooth.Checked;
  Chart1.Invalidate;
end;

procedure TFilterZoom.EditLeftChange(Sender: TObject);
begin
  ZoomFilter.Region.Left:=UpLeft.Position;
  Chart1.Invalidate;
end;

procedure TFilterZoom.EditWidthChange(Sender: TObject);
begin
  ZoomFilter.Region.Width:=UpWidth.Position;
  Chart1.Invalidate;
end;

procedure TFilterZoom.EditTopChange(Sender: TObject);
begin
  ZoomFilter.Region.Top:=UpTop.Position;
  Chart1.Invalidate;
end;

procedure TFilterZoom.EditHeightChange(Sender: TObject);
begin
  ZoomFilter.Region.Height:=UpHeight.Position;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterZoom);
end.
