unit ColorGrid_Clicked;
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
  Base, TeeProcs, TeEngine, Chart, TeeSurfa;

type
  TColorGridClicked = class(TBaseForm)
    Series1: TColorGridSeries;
    Label1: TLabel;
    LabelCell: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

procedure TColorGridClicked.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);
end;

procedure TColorGridClicked.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  tmp:=Series1.Clicked(x,y);
  if tmp=-1 then
     LabelCell.Caption:=''
  else
     LabelCell.Caption:='x:'+IntToStr(Round(Series1.XValues[tmp]))+' '+
                        'z:'+IntToStr(Round(Series1.ZValues[tmp]))+
                        ' Value is: '+FloatToStr(Series1.YValues[tmp]);
end;

initialization
  RegisterClass(TColorGridClicked);
end.
