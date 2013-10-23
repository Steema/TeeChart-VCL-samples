unit Canvas_SmoothStretch;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TCanvasSmoothStretch = class(TBaseForm)
    RadioGroup1: TRadioGroup;
    Series1: TPieSeries;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TCanvasSmoothStretch.RadioGroup1Click(Sender: TObject);
var B : TBitmap;
begin
  B:=TBitmap.Create;
  try
    B.Width:={$IFDEF CLX}177{$ELSE}Image2.Width{$ENDIF};
    B.Height:={$IFDEF CLX}105{$ELSE}Image2.Height{$ENDIF};

    if RadioGroup1.ItemIndex=0 then
       SmoothStretch(Image1.Picture.Bitmap, B)  // smooth
    else
       // normal
       B.Canvas.StretchDraw(Rect(0,0,B.Width,B.Height),Image1.Picture.Bitmap);

    Image2.Picture.Assign(B);
  finally
    B.Free;
  end;
end;

procedure TCanvasSmoothStretch.FormCreate(Sender: TObject);
begin
  inherited;

  // Draw a chart onto Image1 for this example:
  Chart1.Legend.Visible:=False;

  Chart1.Width:={$IFDEF CLX}228{$ELSE}Image1.Width{$ENDIF};
  Chart1.Height:={$IFDEF CLX}174{$ELSE}Image1.Height{$ENDIF};

  Image1.Picture.Assign(Chart1);

  {$IFDEF CLX}
  RadioGroup1.ItemIndex:=0;
  {$ENDIF}
  
  RadioGroup1Click(Self);
end;

initialization
  RegisterClass(TCanvasSmoothStretch);
end.
