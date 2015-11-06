unit Tool_CursorSize;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, CandleCh,
  TeCanvas;


type
  TCursorSizeForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TVolumeSeries;
    ChartTool1: TCursorTool;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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

procedure TCursorSizeForm.Edit1Change(Sender: TObject);
begin
  ChartTool1.VertSize:=StrToInt(Edit1.Text);
end;

procedure TCursorSizeForm.Edit2Change(Sender: TObject);
begin
  ChartTool1.HorizSize:=StrToInt(Edit2.Text);
end;

initialization
  RegisterClass(TCursorSizeForm);
end.
