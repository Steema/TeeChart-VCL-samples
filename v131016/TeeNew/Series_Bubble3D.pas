unit Series_Bubble3D;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls, 
  {$ENDIF}
  Base, TeeOpenGL, TeEngine, TeeSurfa, TeePoin3, TeeProcs, Chart, TeeTools;

type
  TBubble3DSeriesForm = class(TBaseForm)
    Series1: TBubble3DSeries;
    TeeOpenGL1: TTeeOpenGL;
    ChartTool1: TRotateTool;
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

procedure TBubble3DSeriesForm.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;

  Series1.Clear;
  for t:=1 to 10 do
      Series1.AddBubble(Random(100),Random(100),Random(100),Random(100));
end;

initialization
  RegisterClass(TBubble3DSeriesForm);
end.
