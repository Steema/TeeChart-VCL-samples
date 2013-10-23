unit ColorRange_Bug;
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
  TColorRangeBug = class(TBaseForm)
    Series1: TLineSeries;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

procedure TColorRangeBug.Button1Click(Sender: TObject);
begin
  Series1.ColorRange( Series1.YValues, 100, 200, clYellow );
  Series1.ColorRange( Series1.YValues, 300, 400, clBlue );
end;

procedure TColorRangeBug.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;

  { fill series with points and null points }

  With Series1 do
  begin
    for t:=1 to 20 do Add( 100+{$IFNDEF CLR}System.{$ENDIF}Random(200));
    AddNull;
    AddNull;
    AddNull;
    for t:=1 to 20 do Add( 300+{$IFNDEF CLR}System.{$ENDIF}Random(200));
    AddNull;
    AddNull;
    AddNull;
    for t:=1 to 20 do Add( 100+{$IFNDEF CLR}System.{$ENDIF}Random(200));
  end;
end;

initialization
  RegisterClass(TColorRangeBug);
end.
