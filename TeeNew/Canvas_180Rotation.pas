unit Canvas_180Rotation;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeGDIPlus;

type
  TCanvas180Rotation = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    procedure ScrollBar1Change(Sender: TObject);
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

//NOTE: In version 7 this method is not necessary, as 
//      each Wall object has an "AutoHide" boolean property. 
//      Set them to true, example: Chart1.Walls.Right.AutoHide:=True

type
  TChartAccess=class(TCustomChart);

Procedure AutoHideWalls(Chart:TCustomChart);
begin
  with Chart do
  begin
    // Right wall
    Walls.Right.Visible:=not TChartAccess(Chart).DrawRightWallAfter;

    if Walls.Right.Visible then Axes.Right.ZPosition:=0
                           else Axes.Right.ZPosition:=100;

    with Axes.Right do Grid.ZPosition:=ZPosition;

    // Left wall
    Walls.Left.Visible:=not TChartAccess(Chart).DrawLeftWallFirst;

    if Walls.Left.Visible then Axes.Left.ZPosition:=0
                          else Axes.Left.ZPosition:=100;

    with Axes.Left do Grid.ZPosition:=ZPosition;
  end;
end;

procedure TCanvas180Rotation.ScrollBar1Change(Sender: TObject);
begin
  Chart1.View3DOptions.Rotation:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(Chart1.View3DOptions.Rotation);

  if CheckBox1.Checked then AutoHideWalls(Chart1);
end;

procedure TCanvas180Rotation.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(4);
  AutoHideWalls(Chart1);
end;

initialization
  RegisterClass(TCanvas180Rotation);
end.
