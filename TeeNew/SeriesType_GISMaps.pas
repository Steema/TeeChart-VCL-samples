unit SeriesType_GISMaps;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF D16}
  System.UITypes,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeCanvas, TeePenDlg, TeEngine, Series, CandleCh, TeeProcs, Chart,
  TeeSurfa, TeeMapSeries, TeeWorldSeries;

type
  TSeriesTypeWorld = class(TBaseForm)
    ButtonPen1: TButtonPen;
    Button1: TButton;
    Series1: TWorldSeries;
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonPen1Click(Sender: TObject);
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

Uses 
  EditChar;

procedure TSeriesTypeWorld.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);

  ButtonPen1.LinkPen(Series1.Pen);
end;

procedure TSeriesTypeWorld.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TSeriesTypeWorld.ButtonPen1Click(Sender: TObject);
begin
  inherited;
  Series1.SeriesColor:=Series1.Pen.Color;
end;

procedure TSeriesTypeWorld.ComboFlat1Change(Sender: TObject);
begin
  // Change the map:

  Series1.Map:=TWorldMap(ComboFlat1.ItemIndex);

  // Now fill the new map with some sample values:

  Series1.FillSampleValues;
end;

procedure TSeriesTypeWorld.CheckBox1Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TSeriesTypeWorld);
end.
