unit Chart_Actions;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QActnList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  ActnList,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeeChartActions;

type
  TChartActionsForm = class(TBaseForm)
    Series1: TBarSeries;
    ActionList1: TActionList;
    ChartAction3D1: TChartAction3D;
    ChartActionAxes1: TChartActionAxes;
    ChartActionCopy1: TChartActionCopy;
    ChartActionEdit1: TChartActionEdit;
    ChartActionLegend1: TChartActionLegend;
    ChartActionPrint1: TChartActionPrint;
    SeriesActionActive1: TSeriesActionActive;
    SeriesActionEdit1: TSeriesActionEdit;
    SeriesActionMarks1: TSeriesActionMarks;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    CheckBox3: TCheckBox;
    Button3: TButton;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button4: TButton;
    CheckBox6: TCheckBox;
    ChartActionGrid1: TChartActionGrid;
    procedure FormCreate(Sender: TObject);
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

procedure TChartActionsForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

initialization
  RegisterClass(TChartActionsForm);
end.
