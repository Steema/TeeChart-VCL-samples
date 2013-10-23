unit ValueList_Modified;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TValueListModified = class(TBaseForm)
    Button1: TButton;
    Series1: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TValueListModified.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(1000);
end;

procedure TValueListModified.Button1Click(Sender: TObject);
var t : Integer;
begin
  { Modify series values DIRECTLY accessing the dynamic array: }
  With Series1 do
  begin
    YValues.Value[0]:=Random(10000);
    for t:=1 to Count-1 do
        YValues.Value[t]:=YValues.Value[t-1]+Random(1000)-500;
  end;

  { setting "modified" to True forces the Axes to recalculate min and max }
  Series1.YValues.Modified:=True;

  { tell the Series to repaint }
  Series1.Repaint;
end;

initialization
  RegisterClass(TValueListModified);
end.
