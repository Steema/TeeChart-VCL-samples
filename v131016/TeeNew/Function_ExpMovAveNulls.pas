unit Function_ExpMovAveNulls;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, StatChar;

type
  TFunctionExpMovAveNulls = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TExpMovAveFunction;
    bSetNulls: TButton;
    cbIgnoreNulls: TCheckBox;
    cbPointers: TCheckBox;
    procedure bSetNullsClick(Sender: TObject);
    procedure cbIgnoreNullsClick(Sender: TObject);
    procedure cbPointersClick(Sender: TObject);
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

procedure TFunctionExpMovAveNulls.bSetNullsClick(Sender: TObject);
begin
  with Series1 do
  begin
    SetNull(0,True);
    SetNull(4,True);
    SetNull(8,True);
    SetNull(9,True);
    SetNull(10,True);
    SetNull(Series1.Count-1,True);
  end;

  Series2.CheckDataSource;
end;

procedure TFunctionExpMovAveNulls.cbIgnoreNullsClick(Sender: TObject);
begin
  If cbIgnoreNulls.Checked then
    Series1.TreatNulls:=tnIgnore
  else
    Series1.TreatNulls:=tnDontPaint;
end;

procedure TFunctionExpMovAveNulls.cbPointersClick(Sender: TObject);
begin
  Series2.Pointer.Visible:=cbPointers.Checked;
end;

procedure TFunctionExpMovAveNulls.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  Series2.CheckDataSource;
end;

initialization
  RegisterClass(TFunctionExpMovAveNulls);
end.
