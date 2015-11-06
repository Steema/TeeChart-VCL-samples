unit Tool_Fader;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeFilters,
  TeeFiltersEditor,TeeFaderTool, TeCanvas;


type
  TFaderToolForm = class(TBaseForm)
    Series1: TBarSeries;
    bReset: TButton;
    GroupBox1: TGroupBox;
    rbFadeIn: TRadioButton;
    rbFadeOut: TRadioButton;
    bEdit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure rbFadeInClick(Sender: TObject);
    procedure rbFadeOutClick(Sender: TObject);
    procedure bResetClick(Sender: TObject);
  private
    { Private declarations }
    Fader : TFaderTool;
  public
    { Public declarations }
  end;


implementation

uses EditChar;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFaderToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  Fader:=TFaderTool.Create(Self);
  Chart1.Tools.Add(Fader);
  with Fader do
  begin
    InitialDelay:=0;
    Speed:=1.0;
    Style:=fsFadeIn;
    Start;
  end;
end;

procedure TFaderToolForm.bEditClick(Sender: TObject);
begin
  EditChartTool(Self,Fader);
end;

procedure TFaderToolForm.rbFadeInClick(Sender: TObject);
begin
  Fader.Style:=fsFadeIn;
  Fader.Start;
end;

procedure TFaderToolForm.rbFadeOutClick(Sender: TObject);
begin
  Fader.Style:=fsFadeOut;
  Fader.Start;
end;

procedure TFaderToolForm.bResetClick(Sender: TObject);
begin
  Fader.Repaint;
end;

initialization
  RegisterClass(TFaderToolForm);
end.
