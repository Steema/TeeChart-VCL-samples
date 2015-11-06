unit ChartImage_Demo;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  TeEngine, TeeEditPro;

// NOTE:
// The ChartImage class resides at TeeEditPro.pas unit.
// It is automatically registered into VCL image formats.
//
// If you wish to remove ChartImage from the list of registered
// formats, do this:
//
//  TPicture.UnRegisterGraphicClass(TChartImage);
//

type
  TChartImageForm = class(TForm)
    Memo1: TMemo;
    Image1: TImage;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses Series, EditChar;

procedure TChartImageForm.CheckBox1Click(Sender: TObject);
begin
  Image1.Stretch:=CheckBox1.Checked;
end;

// Access the Internal chart property:
procedure TChartImageForm.Button1Click(Sender: TObject);
var tmp : TChartImage;
begin
  tmp:=TChartImage(Image1.Picture.Graphic);
  EditChart(Self,tmp.Chart);
  Image1.Invalidate;
end;

procedure TChartImageForm.FormShow(Sender: TObject);
var tmp : TChartImage;
begin
   // Example:
   // Access the internal chart and fill sample values:

  tmp:=TChartImage(Image1.Picture.Graphic);
  tmp.Chart.AddSeries(TLineSeries.Create(Self));
  tmp.Chart.Series[0].FillSampleValues(5);
end;

initialization
  RegisterClass(TChartImageForm);
end.
