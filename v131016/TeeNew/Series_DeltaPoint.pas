unit Series_DeltaPoint;
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
  ExtDlgs,
  {$ENDIF}
  Base, TeEngine, Series, ImaPoint, TeeProcs, Chart;

type
  TDeltaPointForm = class(TBaseForm)
    Series1: TDeltaPointSeries;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
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

uses TeeBrushDlg;

procedure TDeltaPointForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);

  Image1.Picture.Assign(Series1.LowerImage);
  Image2.Picture.Assign(Series1.EqualImage);
  Image3.Picture.Assign(Series1.GreaterImage);
end;

procedure TDeltaPointForm.Image1Click(Sender: TObject);
var tmp : TImage;
    tmpSt : String;
begin
  tmpSt:=TeeGetPictureFileName(Self);
  if tmpSt<>'' then
  begin
    tmp:=(Sender as TImage);
    tmp.Picture.LoadFromFile(tmpSt);
    if tmp=Image1 then Series1.LowerImage.Assign(tmp.Picture)
    else
    if tmp=Image2 then Series1.EqualImage.Assign(tmp.Picture)
    else
    if tmp=Image3 then Series1.GreaterImage.Assign(tmp.Picture);
  end;
end;

initialization
  RegisterClass(TDeltaPointForm);
end.
