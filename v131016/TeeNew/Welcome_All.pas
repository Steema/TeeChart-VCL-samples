unit Welcome_All;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  SysUtils, Classes,
  TeeProcs, TeeDraw3D, TeEngine, Series, Chart;

type
  TWelcomeAllForm = class(TForm)
    Draw3D1: TDraw3D;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Image1: TImage;
    Chart1: TChart;
    Series1: TLineSeries;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

procedure TWelcomeAllForm.FormShow(Sender: TObject);
var t : Integer;
begin

  for t:=2 to 14 do
  With TImage.Create(Self) do
  begin
    Left:=Image1.Left;
    Transparent:=True;
    Top:=Image1.Top+(Label2.Top-Label1.Top)*(t-1);
    Picture.Assign(Image1.Picture);
    Parent:=Image1.Parent;
  end;

  { Set axis... }
  Chart1.LeftAxis.SetMinMax(-100,100);
  Chart1.BottomAxis.SetMinMax(0,360);

  { Start animation }
  Timer1.Enabled:=True;
end;

procedure TWelcomeAllForm.Timer1Timer(Sender: TObject);
begin
  if Series1.Count=360 then Series1.Clear
  else
  begin
    Series1.Add( 100.0*Sin(Series1.Count*Pi/180.0));
  end;
end;

initialization
  RegisterClass(TWelcomeAllForm);
end.
