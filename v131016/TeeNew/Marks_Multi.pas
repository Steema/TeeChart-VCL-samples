unit Marks_Multi;
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
  TMarksMulti = class(TBaseForm)
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
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

procedure TMarksMulti.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Add( 123, 'Hello'+TeeLineSeparator+'World');

  Series1.Marks.Style:=smsLabelValue;
  Series1.Marks.MultiLine:=True;

  Chart1.MarginBottom:=10;
end;

procedure TMarksMulti.CheckBox1Click(Sender: TObject);
begin
  Series1.Marks.MultiLine:=CheckBox1.Checked;

  if Series1.Marks.MultiLine then
     Series1.Labels[0]:='Hello'+TeeLineSeparator+'World'
  else
     Series1.Labels[0]:='Hello World';
end;

initialization
  RegisterClass(TMarksMulti);
end.
