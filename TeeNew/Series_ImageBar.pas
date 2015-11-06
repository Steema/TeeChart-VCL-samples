unit Series_ImageBar;
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
  Base, TeEngine, Series, ImageBar, TeeProcs, Chart, TeCanvas, TeePenDlg;

type
  TImageBarForm = class(TBaseForm)
    Series1: TImageBarSeries;
    Label1: TLabel;
    Image1: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ButtonColor1: TButtonColor;
    procedure CheckBox1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TImageBarForm.CheckBox1Click(Sender: TObject);
begin
  Series1.ImageTiled:=CheckBox1.Checked
end;

procedure TImageBarForm.Image1Click(Sender: TObject);
var tmpSt : String;
begin
  tmpSt:=TeeGetPictureFileName(Self);
  if tmpSt<>'' then
  begin
    Series1.Image.LoadFromFile(tmpSt);
    Image1.Picture.Assign(Series1.Image);
  end;
end;

procedure TImageBarForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
  Image1.Picture.Assign(Series1.Image);
  ButtonColor1.LinkProperty(Series1,'SeriesColor');
end;

procedure TImageBarForm.CheckBox2Click(Sender: TObject);
begin
  Series1.ColorEachPoint:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TImageBarForm);
end.
