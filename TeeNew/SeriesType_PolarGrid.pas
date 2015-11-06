unit SeriesType_PolarGrid;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas,
  TeePenDlg, TeePolarGrid, TeePolar;

type
  TSeriesTypePolarGrid = class(TBaseForm)
    Button1: TButton;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    cbClockWise: TCheckBox;
    cbAxisTop: TCheckBox;
    PolarGrid: TPolarGridSeries;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbClockWiseClick(Sender: TObject);
    procedure cbAxisTopClick(Sender: TObject);
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

Uses
  EditChar;

procedure TSeriesTypePolarGrid.Button1Click(Sender: TObject);
begin
  EditSeries(Self, PolarGrid);
end;

procedure TSeriesTypePolarGrid.FormCreate(Sender: TObject);
begin
  with PolarGrid do
  begin
    CircleLabels:=True;
    RadiusIncrement:=1;
  end;

  ScrollBar1Change(Self);
end;

procedure TSeriesTypePolarGrid.ScrollBar1Change(Sender: TObject);
var Sector, Track : Integer;
    tmp     : TChartValue;
begin
  with PolarGrid do
  begin
    Clear;

    NumSectors:=ScrollBar1.Position;
    NumTracks:=ScrollBar2.Position;

    BeginUpdate;

    for Sector:=0 to NumSectors-1 do
        for Track:=0 to NumTracks-1 do
        begin
          tmp:=0.5*Sqr(Cos(Sector/(NumSectors*0.2)))+
                   Sqr(Cos(Track/(NumTracks*0.2)))-
                   Cos(Track/(NumTracks*0.5));

          AddCell(Sector,Track,tmp);
        end;

    EndUpdate;

    AngleIncrement:=360/NumSectors;
  end;
end;

procedure TSeriesTypePolarGrid.cbClockWiseClick(Sender: TObject);
begin
  PolarGrid.ClockWiseLabels:=cbClockWise.Checked;
end;

procedure TSeriesTypePolarGrid.cbAxisTopClick(Sender: TObject);
begin
  Chart1.Axes.Behind:=not cbAxisTop.Checked;
end;

initialization
  RegisterClass(TSeriesTypePolarGrid);
end.
