unit SeriesType_Tower;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, EditChar, TeCanvas, TeeTools;

type
  TTowerSeriesForm = class(TBaseForm)
    Series1: TTowerSeries;
    Button1: TButton;
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    ChartTool1: TRotateTool;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
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

procedure TTowerSeriesForm.FormCreate(Sender: TObject);
var x,z:Integer;
begin
  inherited;

  Series1.Clear;
  for x:=1 to 10 do
      for z:=1 to 10 do
          Series1.Value[x,z]:=Random(1000)-100;

  // example:
  Series1.Origin:=500;
  Series1.UseOrigin:=True;

  ComboFlat1.ItemIndex:=0;
end;

procedure TTowerSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TTowerSeriesForm.ComboFlat1Change(Sender: TObject);
begin
  Series1.TowerStyle:=TTowerStyle(ComboFlat1.ItemIndex);
end;

procedure TTowerSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Series1.UseOrigin:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TTowerSeriesForm);
end.
