unit WaterFall_Series;
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
  Base, TeCanvas, TeEngine, TeeSurfa, TeeProcs, Chart, TeePenDlg;

type
  TWaterFallForm = class(TBaseForm)
    Series1: TWaterFallSeries;
    ButtonPen1: TButtonPen;
    ButtonPen2: TButtonPen;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
Uses EditChar;

procedure TWaterFallForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  ButtonPen1.LinkPen(Series1.Pen);
  ButtonPen2.LinkPen(Series1.WaterLines);
end;

procedure TWaterFallForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TWaterFallForm);
end.
