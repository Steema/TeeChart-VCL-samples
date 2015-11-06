unit Shape_VertAlign;
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
  Base, TeEngine, TeeShape, TeeProcs, Chart;

type
  TShapeVertAlign = class(TBaseForm)
    Series1: TChartShape;
    Series2: TChartShape;
    Series3: TChartShape;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
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

procedure TShapeVertAlign.RadioGroup1Click(Sender: TObject);
var Align : TTeeVertAlign;
    St    : String;
begin
  Align:=vaTop;

  Case RadioGroup1.ItemIndex of
    0: begin Align:=vaTop;    St:='Text at Top';    end;
    1: begin Align:=vaCenter; St:='Text at Center'; end;
    2: begin Align:=vaBottom; St:='Text at Bottom'; end;
  end;

  Series1.VertAlign:=Align; Series1.Text.Text:=St;
  Series2.VertAlign:=Align; Series2.Text.Text:=St;
  Series3.VertAlign:=Align; Series3.Text.Text:=St;
end;

initialization
  RegisterClass(TShapeVertAlign);
end.
