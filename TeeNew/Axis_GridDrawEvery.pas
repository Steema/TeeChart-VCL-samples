unit Axis_GridDrawEvery;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, BubbleCh;

type
  TAxisGridDrawEveryForm = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    cbAxis: TComboFlat;
    Series1: TBubbleSeries;
    procedure Edit1Change(Sender: TObject);
    procedure cbAxisChange(Sender: TObject);
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

procedure TAxisGridDrawEveryForm.Edit1Change(Sender: TObject);
begin
  case cbAxis.ItemIndex of
    0 : Chart1.Axes.Left.Grid.DrawEvery:=StrToInt(Edit1.Text);
    1 : Chart1.Axes.Bottom.Grid.DrawEvery:=StrToInt(Edit1.Text);
  end;
end;

procedure TAxisGridDrawEveryForm.cbAxisChange(Sender: TObject);
begin
  case cbAxis.ItemIndex of
    0 : Edit1.Text:=IntToStr(Chart1.Axes.Left.Grid.DrawEvery);
    1 : Edit1.Text:=IntToStr(Chart1.Axes.Bottom.Grid.DrawEvery);
  end;
end;

procedure TAxisGridDrawEveryForm.FormCreate(Sender: TObject);
begin
  inherited;

  cbAxis.ItemIndex:=0;
  UpDown1.Position:=Chart1.Axes.Left.Grid.DrawEvery;
end;

initialization
  RegisterClass(TAxisGridDrawEveryForm);
end.
