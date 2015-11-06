unit Series_BarShadow;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TSeriesBarShadow = class(TBaseForm)
    cbVisible: TCheckBox;
    bShadow: TButton;
    Label1: TLabel;
    cbStyle: TComboFlat;
    Series1: TBarSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bShadowClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
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
  TeeShadowEditor;

procedure TSeriesBarShadow.FormCreate(Sender: TObject);
begin
  inherited;

  with Series1.Shadow do
  begin
    Visible:=true;
    HorizSize:=5;
    VertSize:=5;
  end;

  with Series1.Emboss do
  begin
    Visible:=true;
    HorizSize:=5;
    VertSize:=5;
  end;

  cbStyle.ItemIndex:=0;
end;

procedure TSeriesBarShadow.bShadowClick(Sender: TObject);
begin
  EditTeeShadow(Self, Series1.Shadow);
end;

procedure TSeriesBarShadow.cbVisibleClick(Sender: TObject);
begin
  Series1.Shadow.Visible:=cbVisible.Checked;
end;

procedure TSeriesBarShadow.cbStyleChange(Sender: TObject);
var tmp: TChartSeries;
begin
  tmp := Chart1.Series[0];

  if cbStyle.ItemIndex=0 then
     ChangeSeriesType(tmp,TBarSeries)
  else
     ChangeSeriesType(tmp,THorizBarSeries);
end;

procedure TSeriesBarShadow.Button1Click(Sender: TObject);
begin
  EditTeeShadow(Self, Series1.Emboss);
end;

initialization
  RegisterClass(TSeriesBarShadow);
end.
