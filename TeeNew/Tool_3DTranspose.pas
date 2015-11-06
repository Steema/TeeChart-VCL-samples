unit Tool_3DTranspose;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeTransposeTool;

type
  TTransposeToolDemo = class(TBaseForm)
    Button1: TButton;
    Series1: TSurfaceSeries;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function GetXZValue(x,z:Integer):Double;
  public
    { Public declarations }
    Tool : TGridTransposeTool;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TTransposeToolDemo.Button1Click(Sender: TObject);
begin
  Tool.Transpose;
end;

procedure TTransposeToolDemo.FormCreate(Sender: TObject);
var x,z: Integer;
begin
  inherited;
  // This code is optional.  It can be done at design-time.

  // Create tool
  Tool:=TGridTransposeTool.Create(Self);

  // Set Series
  Tool.Series:=Series1;

  // Add to chart
  Chart1.Tools.Add(Tool);

  // Fill Series with sample values
  for z:=1 to 30 do
      for x:=1 to 20 do
          Series1.AddXYZ(X,GetXZValue(X,Z),Z);
end;

Function TTransposeToolDemo.GetXZValue(x,z:Integer):Double;
begin
  result:=0.5*Sqr(Cos(x/(20*0.2)))+
                 Sqr(Cos(z/(30*0.2)))-
                 Cos(z/(30*0.5));
end;

initialization
  RegisterClass(TTransposeToolDemo);
end.
