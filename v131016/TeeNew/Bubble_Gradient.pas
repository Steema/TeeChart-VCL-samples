unit Bubble_Gradient;
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
  Base, TeeProcs, TeEngine, Chart, Series, BubbleCh;

type
  TBubbleGradient = class(TBaseForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    Series1: TBubbleSeries;
    Button2: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses TeeEdiGrad, TeCanvas;

procedure TBubbleGradient.CheckBox1Click(Sender: TObject);
begin
  Series1.Pointer.Gradient.Visible:=CheckBox1.Checked;
end;

procedure TBubbleGradient.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
  Series1.Pointer.Gradient.Visible:=True;
  Series1.Pointer.Gradient.Direction:=gdRadial;
  Series1.ValueColor[4]:=clAqua;
end;

procedure TBubbleGradient.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Series1.Pointer.Gradient,True,False)
end;

// Expand horizontal axis to fit first and last bubble...
procedure TBubbleGradient.Button2Click(Sender: TObject);
var tmp:Integer;
begin
  with Series1 do
  begin
    tmp:=GetVertAxis.CalcSizeValue(RadiusValues.First);
    GetHorizAxis.MinimumOffset:=tmp;
    tmp:=GetVertAxis.CalcSizeValue(RadiusValues.Last);
    GetHorizAxis.MaximumOffset:=tmp;
  end;
end;

initialization
  RegisterClass(TBubbleGradient);
end.
