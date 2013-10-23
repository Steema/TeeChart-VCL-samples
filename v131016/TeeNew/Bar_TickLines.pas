unit Bar_TickLines;
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
  Base, TeEngine, Series, TeCanvas, TeePenDlg, TeeProcs, Chart;

type
  TBarTickLines = class(TBaseForm)
    ButtonPen1: TButtonPen;
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
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

procedure TBarTickLines.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues;

  ButtonPen1.LinkPen(Series1.TickLines);
  Series1.TickLines.Visible:=True;
end;

procedure TBarTickLines.CheckBox1Click(Sender: TObject);
begin
  Series1.TickLines.Visible:=CheckBox1.Checked;
  
  ButtonPen1.Invalidate;
end;

initialization
  RegisterClass(TBarTickLines);
end.
