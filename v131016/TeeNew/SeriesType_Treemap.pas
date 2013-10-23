unit SeriesType_Treemap;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeSurfa, TeeTernary,
  TeeOrgSeries, TeeTreeMapSeries;

type
  TTreemapSeriesForm = class(TBaseForm)
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    Series1: TTreeMapSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

Uses EditChar;

procedure TTreemapSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TTreemapSeriesForm.FormCreate(Sender: TObject);
var tmp,
    tmp1,
    tmp2 : Integer;
begin
  inherited;

  With Series1 do
  begin
    Clear;

    tmp:=Add(100, 'A');
      tmp1:=Add(38, 'B', tmp);
        tmp2:=Add(40, 'H', tmp1);
          Add(20, 'N', tmp2);
          Add(30, 'O', tmp2);
      Add(10, 'I', tmp1);
      Add(13, 'J', tmp1);
      Add(10, 'C', tmp);
      tmp1:=Add(35, 'D', tmp);
        tmp2:=Add(20, 'K', tmp1);
          Add(40, 'P', tmp2);
        tmp2:=Add(34, 'L', tmp1);
          Add(24, 'Q', tmp2);
      Add(13, 'E', tmp);
      Add(10, 'F', tmp);
      tmp1:=Add(19, 'G', tmp);
        Add(16, 'M', tmp1);

    Format.Shadow.Visible:=True;
  end;

  ComboBox1.ItemIndex:=0;
end;

procedure TTreemapSeriesForm.ComboBox1Change(Sender: TObject);
begin
  Series1.MapStyle:=TTreeMapTiling(ComboBox1.ItemIndex);
end;

procedure TTreemapSeriesForm.Series1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var t : Integer;
begin
  for t:=0 to Series1.Count-1 do
      Series1[t].Format.Gradient.Visible:=t=ValueIndex;
end;

initialization
  RegisterClass(TTreemapSeriesForm);
end.
