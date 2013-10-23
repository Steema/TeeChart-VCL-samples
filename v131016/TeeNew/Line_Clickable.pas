unit Line_Clickable;
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
  TLineClickableForm = class(TBaseForm)
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TLineClickableForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
  Series1.ClickableLine:=False;
end;

procedure TLineClickableForm.CheckBox1Click(Sender: TObject);
begin
  Series1.ClickableLine:=CheckBox1.Checked
end;

procedure TLineClickableForm.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  tmp:=Series1.Clicked(x,y);
  if tmp=-1 then Label1.Caption:=''
            else Label1.Caption:='Point: '+IntToStr(tmp);
end;

initialization
  RegisterClass(TLineClickableForm);
end.
