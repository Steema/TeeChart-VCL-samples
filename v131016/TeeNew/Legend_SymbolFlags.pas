unit Legend_SymbolFlags;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeePenDlg;

type
  TLegendSymbolDraw = class(TBaseForm)
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    ButtonPen1: TButtonPen;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LegendDraw(Sender: TObject; Series:TChartSeries;
                         ValueIndex:Integer; R:TRect);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TLegendSymbolDraw.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Clear;
  Series1.Add(Random(100),'USA');
  Series1.Add(Random(100),'France');
  Series1.Add(Random(100),'Germany');
  Series1.Add(Random(100),'India');
  Series1.Add(Random(100),'Italy');
  Series1.Add(Random(100),'Japan');
  Series1.Add(Random(100),'Portugal');
  Series1.Add(Random(100),'U.K.');

  // Set event to display custom legend symbols:
  Chart1.Legend.Symbol.OnDraw:=LegendDraw;

  ButtonPen1.LinkPen(Chart1.Legend.Symbol.Pen);

  // Make space bigger for flags
  Chart1.Legend.Font.Size:=10;
  Chart1.Legend.VertSpacing:=8;
  Chart1.Legend.Symbol.Width:=30;
  Chart1.Legend.Symbol.WidthUnits:=lcsPixels;
end;

procedure TLegendSymbolDraw.LegendDraw(Sender: TObject; Series:TChartSeries;
                            ValueIndex:Integer; R:TRect);
var Flag : TBitmap;
begin
  if CheckBox1.Checked then
  begin

    Flag:=TBitmap.Create;  // create flag bitmap
    try
      Dec(R.Top,3);
      Inc(R.Bottom,3);

      // copy image from imagelist
      ImageList1.GetBitmap(ValueIndex,Flag);

      with Chart1.Canvas do
      begin
        StretchDraw(R,Flag);  // draw image to legend

        // draw border
        if Chart1.Legend.Symbol.Pen.Visible then
        begin
          Brush.Style:=bsClear;
          AssignVisiblePen(Chart1.Legend.Symbol.Pen);
          Rectangle(R,0);
        end;
      end;

    finally
      Flag.Free;  // destroy bitmap
    end;
  end;
end;

procedure TLegendSymbolDraw.CheckBox1Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TLegendSymbolDraw);
end.
