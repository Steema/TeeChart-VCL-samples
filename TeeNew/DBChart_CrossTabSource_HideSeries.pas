unit DBChart_CrossTabSource_HideSeries;
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
  DB, DBTables,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas,
  DBChart_CrossTabSource, TeeDBEdit, TeeDBCrossTab, DBChart;

type
  TDBCrossTabSourceDemoHideSeries = class(TDBCrossTabSourceDemo)
    cbHideSeries: TCheckBox;
    bEdit: TButton;
    procedure cbHideSeriesClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
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

uses
  EditChar;

procedure TDBCrossTabSourceDemoHideSeries.cbHideSeriesClick(
  Sender: TObject);
begin
  DBCrossTabSource1.HideSeries:=cbHideSeries.Checked;
  DBCrossTabSource1.Refresh;
end;

procedure TDBCrossTabSourceDemoHideSeries.bEditClick(Sender: TObject);
begin
  EditChart(Self,DBChart1);
end;

initialization
  RegisterClass(TDBCrossTabSourceDemoHideSeries);
end.
