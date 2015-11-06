unit Brush_Styles;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TBrushStyleForm = class(TBaseForm)
    Series1: TBarSeries;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Button1: TButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeBrushDlg;

procedure TBrushStyleForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);

  GetTeeBrush(0,SpeedButton1.Glyph);
  GetTeeBrush(1,SpeedButton2.Glyph);
  GetTeeBrush(2,SpeedButton3.Glyph);
  GetTeeBrush(3,SpeedButton4.Glyph);
  GetTeeBrush(4,SpeedButton5.Glyph);
  GetTeeBrush(5,SpeedButton6.Glyph);
  GetTeeBrush(6,SpeedButton7.Glyph);
  GetTeeBrush(7,SpeedButton8.Glyph);
  GetTeeBrush(8,SpeedButton9.Glyph);
  GetTeeBrush(9,SpeedButton10.Glyph);
  GetTeeBrush(10,SpeedButton11.Glyph);
  GetTeeBrush(11,SpeedButton12.Glyph);
end;

procedure TBrushStyleForm.SpeedButton1Click(Sender: TObject);
begin
  Series1.BarBrush.Image.Assign((Sender as TSpeedButton).Glyph);
end;

procedure TBrushStyleForm.Button1Click(Sender: TObject);
begin
  EditChartBrush(Self,Series1.BarBrush);
end;

initialization
  RegisterClass(TBrushStyleForm);
end.
