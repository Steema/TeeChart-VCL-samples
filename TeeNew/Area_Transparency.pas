unit Area_Transparency;
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
  TAreaTransparency = class(TBaseForm)
    Series1: TAreaSeries;
    Series2: TAreaSeries;
    Series3: TAreaSeries;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
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

procedure TAreaTransparency.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  Series2.FillSampleValues(20);
  Series3.FillSampleValues(20);

  Series1.Transparency:=35;
  Series2.Transparency:=35;
  Series3.Transparency:=35;
end;

procedure TAreaTransparency.TrackBar1Change(Sender: TObject);
begin
  Series1.Transparency:=TrackBar1.Position;
end;

procedure TAreaTransparency.TrackBar2Change(Sender: TObject);
begin
  Series2.Transparency:=TrackBar2.Position;
end;

procedure TAreaTransparency.TrackBar3Change(Sender: TObject);
begin
  Series3.Transparency:=TrackBar3.Position;
end;

procedure TAreaTransparency.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Series1.Transparency:=TrackBar1.Position;
    Series2.Transparency:=TrackBar2.Position;
    Series3.Transparency:=TrackBar3.Position;
  end
  else
  begin
    Series1.Transparency:=0;
    Series2.Transparency:=0;
    Series3.Transparency:=0;
  end;
end;

initialization
  RegisterClass(TAreaTransparency);
end.
