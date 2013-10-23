unit Title_Clear;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart;

type
  TTitleClear = class(TBaseForm)
    bClear: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    bApply: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
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

procedure TTitleClear.FormCreate(Sender: TObject);
begin
  inherited;

  with Chart1.Title do
  begin
    Font.Gradient.StartColor:=clBlack;
    Font.Gradient.Visible:=True;
    Font.Size:=22;
    Transparent:=False;
    Bevel := bvLowered;
    Caption:='My Chart Title';
  end;

  Edit1.Text:= Chart1.Title.Caption;
end;

procedure TTitleClear.bApplyClick(Sender: TObject);
begin
  Chart1.Title.Text.Text:=Edit1.Text;
end;

procedure TTitleClear.bClearClick(Sender: TObject);
begin
  Chart1.Title.Clear;
end;

initialization
  RegisterClass(TTitleClear);
end.
