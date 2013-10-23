unit Area_Origin;
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
  Base, TeEngine, TeCanvas, Series, TeeProcs, Chart;

type
  TAreaOriginForm = class(TBaseForm)
    Series1: TAreaSeries;
    CBUseOrigin: TCheckBox;
    Label1: TLabel;
    EOrigin: TEdit;
    UDOrigin: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure CBUseOriginClick(Sender: TObject);
    procedure EOriginChange(Sender: TObject);
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

procedure TAreaOriginForm.FormCreate(Sender: TObject);
var tmp : Integer;
begin
  inherited;
  Series1.FillSampleValues(20);

  { calc middle point as an example... }
  With Series1.YValues do tmp:=Round((MaxValue+MinValue)/2.0);

  UDOrigin.Position:=tmp;
  Series1.YOrigin:=tmp;
end;

procedure TAreaOriginForm.CBUseOriginClick(Sender: TObject);
begin
  Series1.UseYOrigin:=CBUseOrigin.Checked;
  Series1.YOrigin:=UDOrigin.Position;
end;

procedure TAreaOriginForm.EOriginChange(Sender: TObject);
begin
  if Showing then Series1.YOrigin:=UDOrigin.Position
end;

initialization
  RegisterClass(TAreaOriginForm);
end.
