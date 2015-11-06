unit PolarRadar_Transparency;
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, Series, TeePolar;

type
  TPolarRadarTransp = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Series1: TPolarSeries;
    Series2: TPolarSeries;
    Series3: TPolarSeries;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
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

procedure TPolarRadarTransp.Edit1Change(Sender: TObject);
begin
  Series1.Transparency:=UpDown1.Position;
end;

procedure TPolarRadarTransp.Edit2Change(Sender: TObject);
begin
  Series2.Transparency:=UpDown2.Position;
end;

procedure TPolarRadarTransp.Edit3Change(Sender: TObject);
begin
  Series3.Transparency:=UpDown3.Position;
end;

procedure TPolarRadarTransp.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(10);
end;

initialization
  RegisterClass(TPolarRadarTransp);
end.
