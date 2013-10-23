unit SeriesType_HorizBar;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  THorizBarSeriesForm = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    Series1: THorizBarSeries;
    Series3: THorizBarSeries;
    Series2: THorizBarSeries;
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

procedure THorizBarSeriesForm.ComboBox1Change(Sender: TObject);
var tmp : Boolean;
begin
  Case ComboBox1.ItemIndex of
    0: Series1.MultiBar:=mbNone;
    1: Series1.MultiBar:=mbSide;
    2: Series1.MultiBar:=mbStacked;
    3: Series1.MultiBar:=mbStacked100;
    4: Series1.MultiBar:=mbSideAll;
  end;

  { remove "Marks" when stacking... }
  tmp:=(Series1.MultiBar<>mbStacked) and (Series1.MultiBar<>mbStacked100);
  Series1.Marks.Visible:=tmp;
  Series2.Marks.Visible:=tmp;
  Series3.Marks.Visible:=tmp;
end;

procedure THorizBarSeriesForm.ComboBox2Change(Sender: TObject);
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

procedure THorizBarSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure THorizBarSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(3);
end;

procedure THorizBarSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
end;

initialization
  RegisterClass(THorizBarSeriesForm);
end.
