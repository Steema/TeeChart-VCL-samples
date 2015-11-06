unit Chart_SeriesGroupsFindByName;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TChartSeriesGroupsFindByName = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    ButtonColor1: TButtonColor;
    bApply: TBitBtn;
    Series1: TAreaSeries;
    Series2: TAreaSeries;
    Series3: TPointSeries;
    Series4: TPointSeries;
    procedure FormCreate(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
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

procedure TChartSeriesGroupsFindByName.FormCreate(Sender: TObject);
begin
  inherited;

  with Chart1 do
  begin
    SeriesList.AddGroup('Group A');
    SeriesGroups.Items[0].Add(Series1);
    SeriesGroups.Items[0].Add(Series3);

    SeriesList.AddGroup('Group B');
    SeriesGroups.Items[1].Add(Series2);
    SeriesGroups.Items[1].Add(Series4);

    Legend.LegendStyle:=lsSeriesGroups;
  end;

  Edit1.Text:='Group A';
  ButtonColor1.LinkProperty(Series1,'Color');
end;

procedure TChartSeriesGroupsFindByName.bApplyClick(Sender: TObject);
var
  SGroup : TSeriesGroup;
  i      : Integer;
begin
  SGroup := Chart1.SeriesGroups.FindByName(Edit1.Text);

  if SGroup <> nil then
     for i :=0 to SGroup.Series.Count-1 do
        (SGroup.Series[i] as TCustomSeries).Color:=ButtonColor1.SymbolColor
  else
     ShowMessage('This Group name does not exist');
end;

initialization
  RegisterClass(TChartSeriesGroupsFindByName);
end.
