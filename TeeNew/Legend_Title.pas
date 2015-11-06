unit Legend_Title;
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
  Base, TeEngine, Series, TeeProcs, Chart, EditChar;

type
  TLegendTitleForm = class(TBaseForm)
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TLegendTitleForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.Title.Visible:=CheckBox1.Checked;
end;

procedure TLegendTitleForm.Button1Click(Sender: TObject);
begin
  EditChartLegend(Self,Chart1);
end;

procedure TLegendTitleForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TLegendTitleForm);
end.
