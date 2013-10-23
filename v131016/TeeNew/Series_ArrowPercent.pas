unit Series_ArrowPercent;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, ArrowCha;

type
  TSeriesArrowPercent = class(TBaseForm)
    Series1: TArrowSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TSeriesArrowPercent.FormCreate(Sender: TObject);
begin
  inherited;

  // Set arrow head size in pixels
  Series1.ArrowHeight:=50;
  Series1.ArrowWidth:=50;

  Edit1.Text:=IntToStr(Series1.ArrowPercent);
end;

procedure TSeriesArrowPercent.Edit1Change(Sender: TObject);
begin
  Series1.ArrowPercent:=StrToInt(Edit1.Text);
end;

initialization
  RegisterClass(TSeriesArrowPercent);
end.
