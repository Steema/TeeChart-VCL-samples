unit Bar_Image;
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
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  ImgList,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TBarImage = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    ImageList1: TImageList;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TBarImage.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(3);
  Series2.FillSampleValues(3);

  CheckBox1Click(Self);
end;

procedure TBarImage.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    { the ImageList contains the patterns for this example }
    ImageList1.GetBitmap(0,Series1.BarBrush.Image.Bitmap);
    ImageList1.GetBitmap(1,Series2.BarBrush.Image.Bitmap);
  end
  else
  begin
    Series1.BarBrush.Image.Assign(nil);
    Series2.BarBrush.Image.Assign(nil);
  end;
end;

initialization
  RegisterClass(TBarImage);
end.
