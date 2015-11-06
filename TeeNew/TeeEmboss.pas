unit TeeEmboss;
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
  Base, TeEngine, Series, BubbleCh, TeeProcs, Chart, TeeTools, TeeSubChart,
  TeeThemes, TeeComma, TeCanvas;

type
  TTeeEmbossForm = class(TBaseForm)
    Series1: TBarSeries;
    CBVisible: TCheckBox;
    BColor: TButton;
    UpDown1: TUpDown;
    Edit1: TEdit;
    Label1: TLabel;
    CBEmbossSmooth: TCheckBox;
    CBShadow: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CBVisibleClick(Sender: TObject);
    procedure BColorClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CBEmbossSmoothClick(Sender: TObject);
    procedure CBShadowClick(Sender: TObject);
  private
    Embosses: Array[0..2] of TTeeEmboss;
    Shadows: Array[0..2] of TTeeShadow;
  public
    { Public declarations }
  end;

var
  TeeEmbossForm: TTeeEmbossForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TTeeEmbossForm.BColorClick(Sender: TObject);
var AColor: TColor;
    t: Integer;
begin
  EditColorDialog(Self, AColor);

  for t := 0 to 2 do
    Embosses[t].Color:=AColor;
end;

procedure TTeeEmbossForm.CBEmbossSmoothClick(Sender: TObject);
var t: Integer;
begin
  for t := 0 to 2 do
    Embosses[t].Smooth:=CBEmbossSmooth.Checked;
end;

procedure TTeeEmbossForm.CBShadowClick(Sender: TObject);
var t: Integer;
begin
  for t := 0 to 2 do
    Shadows[t].Visible:=CBShadow.Checked;
end;

procedure TTeeEmbossForm.CBVisibleClick(Sender: TObject);
var t: Integer;
begin
  for t := 0 to 2 do
    Embosses[t].Visible:=CBVisible.Checked;
end;

procedure TTeeEmbossForm.Edit1Change(Sender: TObject);
var t: Integer;
begin
  for t := 0 to 2 do
    Embosses[t].Size:=UpDown1.Position;
end;

procedure TTeeEmbossForm.FormCreate(Sender: TObject);
var t: Integer;
begin
  inherited;

  Series1.FillSampleValues();
  Series1.Shadow.Size:=3;
  Series1.Shadow.Visible:=true;

  ApplyChartTheme(TOperaTheme,Chart1,7);

  Shadows[0]:=Chart1.Legend.Shadow;
  Shadows[1]:=Series1.Marks.Shadow;
  Shadows[2]:=Series1.Shadow;

  Embosses[0]:=Chart1.Legend.Emboss;
  Embosses[1]:=Series1.Marks.Emboss;
  Embosses[2]:=Series1.Emboss;

  for t := 0 to 2 do
  begin
    Embosses[t].Color:=clRed;
    Embosses[t].Visible:=true;
  end;
end;

initialization
  RegisterClass(TTeeEmbossForm);
end.
