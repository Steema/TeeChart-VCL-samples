unit Series3D_AddArray;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart;

type
  TAddArray3D = class(TBaseForm)
    Series1: TColorGridSeries;
    procedure FormCreate(Sender: TObject);
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

procedure TAddArray3D.FormCreate(Sender: TObject);
var A : TArrayGrid;
    x,z : Integer;
begin
  inherited;

  // initialize dynamic array grid
  SetLength( A, 5, 7 ) ;

  // fill with random values
  for x:=0 to 4 do
      for z:= 0 to 6 do
          A[x,z] := Random ;

  // add to 3D series:
  Series1.AddArray( A );
end;

initialization
  RegisterClass(TAddArray3D);
end.
