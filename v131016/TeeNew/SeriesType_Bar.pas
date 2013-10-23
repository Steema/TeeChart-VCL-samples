unit SeriesType_Bar;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools;

type
  TBarSeriesForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

Uses EditChar;

procedure TBarSeriesForm.ComboBox1Change(Sender: TObject);
var tmp : Boolean;
begin
  Case ComboBox1.ItemIndex of
    0: Series1.MultiBar:=mbNone;
    1: Series1.MultiBar:=mbSide;
    2: Series1.MultiBar:=mbStacked;
    3: Series1.MultiBar:=mbStacked100;
    4: Series1.MultiBar:=mbSideAll;
    5:
    begin
      Series1.MultiBar:=mbSelfStack;
      Series1.BarWidthPercent:=20;
      Series2.BarWidthPercent:=20;
      Series3.BarWidthPercent:=20;
    end;
  end;

  { remove "Marks" when stacking... }
  tmp:=(Series1.MultiBar<>mbStacked) and
       (Series1.MultiBar<>mbStacked100) and
       (Series1.MultiBar<>mbSelfStack);
       
  Series1.Marks.Visible:=tmp;
  Series2.Marks.Visible:=tmp;
  Series3.Marks.Visible:=tmp;
end;

procedure TBarSeriesForm.ComboBox2Change(Sender: TObject);
begin
  Case ComboBox2.ItemIndex of
    0: Series1.BarStyle:=bsRectangle;
    1: Series1.BarStyle:=bsPyramid;
    2: Series1.BarStyle:=bsInvPyramid;
    3: Series1.BarStyle:=bsCilinder;
    4: Series1.BarStyle:=bsEllipse;
    5: Series1.BarStyle:=bsArrow;
    6: Series1.BarStyle:=bsRectGradient;
    7: Series1.BarStyle:=bsCone;
  end;
end;

procedure TBarSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TBarSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(6);
end;

procedure TBarSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
end;

initialization
  RegisterClass(TBarSeriesForm);
end.
