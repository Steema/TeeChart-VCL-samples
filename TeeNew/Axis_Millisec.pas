unit Axis_Millisec;
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
  TAxisMillisec = class(TBaseForm)
    Series1: TPointSeries;
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

{ Warning: Milliseconds format is not supported in Delphi version 3 }

procedure TAxisMillisec.FormCreate(Sender: TObject);
begin
  inherited;

  With Series1 do
  begin
    XValues.DateTime:=True;
    Clear;
    AddXY( EncodeTime(0,0,0,0), 100);
    AddXY( EncodeTime(0,0,0,1), 200);
    AddXY( EncodeTime(0,0,0,2), 100);
    AddXY( EncodeTime(0,0,0,3), 200);
  end;

  With Chart1.BottomAxis do
  begin
    Increment:=DateTimeStep[dtOneMilliSecond];
    DateTimeFormat:='ss.zzz';
    RoundFirstLabel:=False;
  end;
end;

initialization
  RegisterClass(TAxisMillisec);
end.
 
