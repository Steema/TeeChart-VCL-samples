unit Series_AreaStackGroups;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TSeriesAreaStackGroups = class(TBaseForm)
    Edit1: TEdit;
    cbStacked: TCheckBox;
    Label1: TLabel;
    UpDown1: TUpDown;
    Series1: TAreaSeries;
    Series2: TAreaSeries;
    Series3: TAreaSeries;
    Series4: TAreaSeries;
    Label2: TLabel;
    ComboFlat1: TComboFlat;
    procedure FormCreate(Sender: TObject);
    procedure cbStackedClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
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

uses
  Math;

procedure TSeriesAreaStackGroups.FormCreate(Sender: TObject);
var i : integer;
begin
  inherited;

  Series1.StackGroup:=0;
  Series3.StackGroup:=0;
  Series2.StackGroup:=1;
  Series4.StackGroup:=1;

  for i :=0 to Chart1.SeriesCount -1 do
  begin
    ComboFlat1.Add(Chart1[i].Name);

    (Chart1[i] as TAreaSeries).MultiArea:=maStacked;
    (Chart1[i] as TAreaSeries).Transparency:=30;
  end;

  ComboFlat1.ItemIndex:=0;
end;

procedure TSeriesAreaStackGroups.cbStackedClick(Sender: TObject);
var i : integer;
begin
  for i:=0 to Chart1.SeriesCount-1 do
      if cbStacked.Checked then
         (Chart1[i] as TAreaSeries).MultiArea := maStacked
      else
         (Chart1[i] as TAreaSeries).MultiArea := maNone;

  ComboFlat1.Enabled:=cbStacked.Checked;
  Edit1.Enabled:=cbStacked.Checked;
  UpDown1.Enabled:=cbStacked.Checked;
end;

procedure TSeriesAreaStackGroups.Edit1Change(Sender: TObject);
begin
  (Chart1[ComboFlat1.ItemIndex] as TAreaSeries).StackGroup:=UpDown1.Position;
end;

procedure TSeriesAreaStackGroups.ComboFlat1Change(Sender: TObject);
begin
  Edit1.Text:=IntToStr((Chart1[ComboFlat1.ItemIndex] as TAreaSeries).StackGroup);
end;

initialization
  RegisterClass(TSeriesAreaStackGroups);
end.

