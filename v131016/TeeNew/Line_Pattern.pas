unit Line_Pattern;
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
  {$IFDEF CLR}
  Variants,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TLinePatternForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure Image1Click(Sender: TObject);
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

Uses TeeBrushDlg;

procedure TLinePatternForm.Image1Click(Sender: TObject);
var tmpFileName : String;
begin
  tmpFileName:=TeeGetPictureFileName(Self);
  if tmpFileName<>'' then
  With (Sender as TImage) do
  begin
    Picture.LoadFromFile(tmpFileName);
    {$IFNDEF D4}
    // HelpContext is used here just as a dummy property to
    // store the Image index (0, 1 or 2).
    Chart1.Series[HelpContext].Brush.Image.Assign(Picture);
    {$ELSE}
    // In Delphi4 does not exist the HelpContext property.
    Chart1.Series[tag].Brush.Image.Assign(Picture);
    {$ENDIF}
  end;
end;

procedure TLinePatternForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(8);

  Series1.Brush.Image.Assign(Image1.Picture);
  Series2.Brush.Image.Assign(Image2.Picture);
  Series3.Brush.Image.Assign(Image3.Picture);
end;

initialization
  RegisterClass(TLinePatternForm);
end.


