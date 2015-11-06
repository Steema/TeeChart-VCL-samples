unit Bar_SelfStack;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TBarSelfStack = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TBarSelfStack.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Add(100, 'Cars');
  Series1.Add(300, 'Phones');
  Series1.Add(200, 'Lamps');

  // Set "Self-Stacked":
  Series1.MultiBar:=mbSelfStack;

  // cosmetic
  Series1.Marks.Visible:=False;
  Series1.Marks.Style:=smsValue;
  Series1.ColorEachPoint:=True;
end;

procedure TBarSelfStack.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     Series1.MultiBar:=mbSelfStack
  else
     Series1.MultiBar:=mbNone;   // no stacking

  // show marks when not in self-stacking mode:
  Series1.Marks.Visible:=not CheckBox1.Checked;
end;

initialization
  RegisterClass(TBarSelfStack);
end.
