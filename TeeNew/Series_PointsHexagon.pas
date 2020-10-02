unit Series_PointsHexagon;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeGDIPlus;

type
  TSeriesPointsHexagon = class(TBaseForm)
    Series1: TLineSeries;
    cbVisible: TCheckBox;
    Label1: TLabel;
    cbStyle: TComboFlat;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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

procedure TSeriesPointsHexagon.FormCreate(Sender: TObject);
begin
  inherited;

  cbStyle.ItemIndex:=12;

  Series1.Pointer.Style:=psHexagon;
end;

procedure TSeriesPointsHexagon.cbVisibleClick(Sender: TObject);
begin
  Series1.Pointer.Visible:=cbVisible.Checked;
end;

procedure TSeriesPointsHexagon.cbStyleChange(Sender: TObject);
begin
  Series1.Pointer.Style:=TSeriesPointerStyle(cbStyle.ItemIndex);
end;

procedure TSeriesPointsHexagon.Edit1Change(Sender: TObject);
begin
  Series1.Pointer.VertSize:=StrToInt(edit1.Text);
end;

procedure TSeriesPointsHexagon.Edit2Change(Sender: TObject);
begin
  Series1.Pointer.HorizSize:=StrToInt(edit2.Text);
end;

initialization
  RegisterClass(TSeriesPointsHexagon);
end.
