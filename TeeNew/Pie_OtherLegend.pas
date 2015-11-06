unit Pie_OtherLegend;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TPieOtherLegend = class(TBaseForm)
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses TeeEdiLege, TeCanvas;

procedure TPieOtherLegend.FormCreate(Sender: TObject);
begin
  inherited;

  // add data
  Series1.Add(134, 'Google');
  Series1.Add( 65, 'Yahoo');
  Series1.Add( 23, 'AltaVista');
  Series1.Add( 12, 'AllTheWeb');
  Series1.Add(  9, 'Terra');
  Series1.Add(  6, 'Lycos');
  Series1.Add(  3, 'Ask Jeeves');

  // prepare "Other" to group values below 10
  Series1.OtherSlice.Style:=poBelowValue;
  Series1.OtherSlice.Value:=10;

  // Display "Other" legend:
  with Series1.OtherSlice.Legend do
  begin
    Visible:=True;
    Left:=340;
    Top:=150;
  end;
end;

procedure TPieOtherLegend.CheckBox1Click(Sender: TObject);
begin
  // Show / Hide "Other" legend
  Series1.OtherSlice.Legend.Visible:=CheckBox1.Checked;
end;

procedure TPieOtherLegend.Button1Click(Sender: TObject);
begin
  // Show Legend editor dialog...
  with TFormTeeLegend.CreateLegend(Self,Series1.OtherSlice.Legend) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TPieOtherLegend.Chart1AfterDraw(Sender: TObject);
var tmpX : Integer;
begin
  // cosmetic line from normal legend to "other" legend

  if Series1.OtherSlice.Legend.Visible then
  with Chart1.Canvas do
  begin
    Pen.Style:=psDot;
    Pen.Width:=2;
    Pen.Color:=clNavy;

    tmpX:=Chart1.Legend.Left;

    MoveTo(tmpX,Chart1.Legend.ShapeBounds.Bottom-4);
    LineTo(tmpX-10,Chart1.Legend.ShapeBounds.Bottom);
    LineTo(tmpX-10,Series1.OtherSlice.Legend.Top+4);
    LineTo(Series1.OtherSlice.Legend.Left,Series1.OtherSlice.Legend.Top+4);
  end;
end;

initialization
  RegisterClass(TPieOtherLegend);
end.
