unit Marks_DrawEvery;
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
  Base, TeeProcs, TeCanvas, TeEngine, Chart, Series;

type
  TMarksEvery = class(TBaseForm)
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TLineSeries;
    procedure Edit1Change(Sender: TObject);
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

procedure TMarksEvery.Edit1Change(Sender: TObject);
begin
  Series1.Marks.DrawEvery:=UpDown1.Position
end;

procedure TMarksEvery.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(50);
end;

initialization
  RegisterClass(TMarksEvery);
end.
