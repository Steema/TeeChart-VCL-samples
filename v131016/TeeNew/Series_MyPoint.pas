unit Series_MyPoint;
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
  Base, TeCanvas, TeePenDlg, TeEngine, Series, MyPoint, TeeProcs,
  Chart, TeeTools;

type
  TMyPointSeriesForm = class(TBaseForm)
    Series1: TMyPointSeries;
    ButtonPen1: TButtonPen;
    Button1: TButton;
    CheckBox1: TCheckBox;
    ChartTool1: TMarksTipTool;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TMyPointSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  ButtonPen1.LinkPen(Series1.LinesPen);
end;

procedure TMyPointSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TMyPointSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked
end;

initialization
  RegisterClass(TMyPointSeriesForm);
end.
