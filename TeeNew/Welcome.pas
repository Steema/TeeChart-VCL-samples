unit Welcome;
{$I TeeDefs.inc}

{ Animation of Pie and Bar / Line series... }

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls, QMenus,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus,
  {$ENDIF}
  TeEngine, Series, TeCanvas, TeeProcs,

  {$IFNDEF TEELITE}
  TeeThemes,
  TeeAntiAlias,
  {$ENDIF}

  Chart, TeeGDIPlus;

type
  TBannerText=packed record
    tmpSize   : Integer;
    DeltaSize : Integer;
    tmpSizeCount:Integer;
    tmpX      : Integer;
    tmpY      : Integer;
    DeltaX    : Integer;
    DeltaY    : Integer;
    SomeText  : String;
  end;

  TWelcomeForm = class(TForm)
    Chart1: TChart;
    Series1: TPieSeries;
    Timer1: TTimer;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TFastLineSeries;
    PopupMenu1: TPopupMenu;
    ApplyTheme: TMenuItem;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Chart1BeforeDrawChart(Sender: TObject);
    procedure ApplyThemeClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    BannerText: Array[1..3] of TBannerText;
    Delta     : Integer;
    DeltaRot  : Integer;
    DeltaElev : Integer;
    NewRotation : Integer;
    TheSeries : TChartSeries;

    {$IFNDEF TEELITE}
    AntiAlias1 : TAntiAliasTool;
    {$ENDIF}

    Procedure DrawBannerText;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

const MaxFontSize=40;

procedure TWelcomeForm.FormCreate(Sender: TObject);
begin
  { constants to rotate... }
  Delta:=1;
  DeltaElev:=1;
  DeltaRot:=1;
  NewRotation:=30;

  Series1.DarkPen:=192;
  Series1.Transparency:=50;
  Series1.BevelPercent:=30;
  Series1.Shadow.Visible:=false;

  { sample values... }
  Series1.FillSampleValues(8);
  Series2.FillSampleValues(30);
  Series3.FillSampleValues(30);
  Series4.FillSampleValues(50);

  { the series to animate... }
  TheSeries:=Series1;

  { start with a very small view... }
  Chart1.View3DOptions.Zoom:=1;

  Series1.Gradient.Direction:=gdTopBottom;

  {$IFNDEF TEELITE}
  AntiAlias1:=TAntiAliasTool.Create(Self);
  AntiAlias1.ParentChart:=Chart1;
  {$ENDIF}
end;

{ Do animation... }
procedure TWelcomeForm.Timer1Timer(Sender: TObject);

  { add a new point to the series and remove the first point }
  Procedure AddPoint(ASeries:TChartSeries);
  begin
    with ASeries do
    begin
      AddXY(XValues.Last+1,YValues.Last+Random(20)-10);
      Delete(0);
    end;
  end;

var t : Integer;
    ColorDelta : Integer;
begin
  Timer1.Enabled:=False;

  { Pie series, do rotation... }
  if TheSeries is TPieSeries then
  begin
    With TheSeries as TPieSeries do
         RotationAngle:=RotationAngle+2;
  end
  else
  { scroll points... }
  begin
    AddPoint(Series2);
    AddPoint(Series3);
    AddPoint(Series4);

    { change 3D view (rotation / elevation) ... }
    With Chart1.View3DOptions do
    begin
      Elevation:=Elevation+DeltaElev;
      if (Elevation>350) or (Elevation<280) then
         DeltaElev:=-DeltaElev;

      Inc(NewRotation,DeltaRot);
      if (NewRotation>358) or (NewRotation<1) then
         DeltaRot:=-DeltaRot;

      Rotation:=NewRotation;
    end;
  end;

  { change view Zoom... }
  With Chart1.View3DOptions do
  begin
    Zoom:=Zoom+Delta;

    { reverse zoom-in / zoom-out }
    if (Zoom>100) or (Zoom<2) then
       Delta:=-Delta;

    if Zoom>100 then
    begin
      Series1.Active:=False;
      Series2.Active:=False;
      Series3.Active:=False;
      Series4.Active:=False;

      { change from Pie to Lines... }
      if TheSeries=Series1 then
      begin
        TheSeries:=Series2;
        Series2.Active:=True;
        Series3.Active:=True;
        Series4.Active:=True;
        Chart1.View3DOptions.Perspective:=85;
        Chart1.View3DOptions.Rotation:=300;
        NewRotation:=30;
      end
      else
      begin
        // Change from Lines to Pie...
        TheSeries:=Series1;
        Chart1.View3DOptions.Rotation:=360;
        TheSeries.Active:=True;

        // Change Pie colors to Blue
        ColorDelta:=255 div TheSeries.Count;
        for t:=0 to TheSeries.Count-1 do
            TheSeries.ValueColor[t]:=ApplyBright(clNavy,t*ColorDelta);
      end;
    end;
  end;

  { re-start the timer... }
  Timer1.Enabled:=True;
end;

procedure TWelcomeForm.FormShow(Sender: TObject);
begin
  With BannerText[1] do
  begin
    tmpSizeCount:=0;
    tmpSize:=4;
    DeltaSize:=1;
    tmpX:=0;
    tmpY:=0;
    DeltaX:=1;
    DeltaY:=1;
    SomeText:='100% Source Code';
  end;

  With BannerText[2] do
  begin
    tmpSizeCount:=1;
    tmpSize:=12;
    DeltaSize:=-1;
    tmpX:=0;
    tmpY:=Chart1.Height-30;
    DeltaX:=1;
    DeltaY:=-1;
    SomeText:='For Embarcadero / CodeGear RAD Studio, Visual Studio.NET, Delphi, C++ Builder, Java, PHP and Kylix';
  end;

  With BannerText[3] do
  begin
    tmpSizeCount:=3;
    tmpSize:=2;
    DeltaSize:=1;
    tmpX:=Chart1.Width-50;
    tmpY:=Chart1.Height-30;
    DeltaX:=-1;
    DeltaY:=-1;
    SomeText:='Visit our Web Site !';
  end;

  {$IFDEF CLX}
  Timer1.Interval:=100; { CLX is much slower than VCL, so lets increment delay }
  {$ENDIF}

  Timer1.Enabled:=True;  { start animation... }
end;

procedure TWelcomeForm.Chart1AfterDraw(Sender: TObject);
begin
  if TheSeries is TPieSeries then DrawBannerText;
end;

procedure TWelcomeForm.Chart1BeforeDrawChart(Sender: TObject);
begin
  if not (TheSeries is TPieSeries) then DrawBannerText;
end;

type
  TTeeCanvasAccess=class(TTeeCanvas);

Procedure TWelcomeForm.DrawBannerText;
var t : Integer;
begin
  With TTeeCanvasAccess(Chart1.Canvas) do
  begin
    Font.Color:=clDkGray;

    with Series1.Marks.Font.Shadow do
    begin
      HorizSize:=2;
      VertSize:=2;
      Smooth:=False;
      Color:=clSilver;
      SmoothBlur:=0;
      Visible:=True;
    end;

    for t:=Low(BannerText) to High(BannerText) do
    with BannerText[t] do
    begin
      Inc(tmpSizeCount);

      if tmpSizeCount>=6 then
      begin
        tmpSizeCount:=0;

        Inc(tmpSize,DeltaSize);
        if tmpSize<2 then DeltaSize:=1
                     else
        if tmpSize>MaxFontSize then DeltaSize:=-1;
      end;

      Font.Size:=tmpSize;

      Inc(tmpX,DeltaX);
      if (tmpX<-30) or (tmpX>Chart1.Width) then
         DeltaX:=-DeltaX;

      Inc(tmpY,DeltaY);

      if (tmpY<0) or (tmpY>Chart1.Height) then
         DeltaY:=-DeltaY;

      TextOut(tmpX,tmpY,SomeText);
    end;
  end;
end;

procedure TWelcomeForm.ApplyThemeClick(Sender: TObject);
begin
  {$IFNDEF TEELITE}
  with TWindowsXPTheme.Create(Chart1) do
  try
    Apply;
  finally
    Free;
  end;
  {$ENDIF}
end;

procedure TWelcomeForm.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled:=False;
  ApplyThemeClick(Self);
end;

initialization
  RegisterClass(TWelcomeForm)
end.
