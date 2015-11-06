unit Legend_Symbol;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeSurfa, TeCanvas, TeeTools;

type
  TLegendSymbol = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Series1: TContourSeries;
    CheckBox1: TCheckBox;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TLegendSymbol.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  Series1.ValueFormat:='0.000';
end;

procedure TLegendSymbol.Edit1Change(Sender: TObject);
begin
  inherited;
  Chart1.Legend.Symbol.Width:=UpDown1.Position
end;

procedure TLegendSymbol.ComboBox1Change(Sender: TObject);
begin
  inherited;
  if ComboBox1.ItemIndex=0 then Chart1.Legend.Symbol.Position:=spLeft
                           else Chart1.Legend.Symbol.Position:=spRight;
end;

procedure TLegendSymbol.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.Symbol.Continuous:=CheckBox1.Checked
end;

procedure TLegendSymbol.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TLegendSymbol);
end.
