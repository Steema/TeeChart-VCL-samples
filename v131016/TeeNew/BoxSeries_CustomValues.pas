unit BoxSeries_CustomValues;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeBoxPlot, TeeProcs, Chart;

type
  TBoxCustomForm = class(TBaseForm)
    Series1: TBoxSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateDisplay;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TBoxCustomForm.CheckBox1Click(Sender: TObject);
begin
  Series1.UseCustomValues := CheckBox1.Checked;
  if Series1.UseCustomValues then
  begin
    Series1.Median := 15;
    Series1.Quartile1 := 13;
    Series1.Quartile3 := 17;
    Series1.InnerFence1 := 12;
    Series1.InnerFence3 := 18;
    Series1.OuterFence1 := 10;
    Series1.OuterFence3 := 20;
  end;
  Chart1.Repaint;
  UpdateDisplay;
end;

procedure TBoxCustomForm.FormCreate(Sender: TObject);
begin
  inherited;
  // add sample data
  With Series1 do
  begin
    Clear;
    AddArray([12, 14, 18, 18.5, 18.6, 18.6, 19, 24]);
    UseCustomValues := False; // by default, use internal calculating algorithms
  end;
  UpdateDisplay;
end;

procedure TBoxCustomForm.UpdateDisplay;
begin
  Label1.Caption := 'Median = ' + FormatFloat('0.00',Series1.Median);
  Label2.Caption := 'Inner Fences = ['+FormatFloat('0.00',Series1.InnerFence1)+
    ' ; '+FormatFloat('0.00',Series1.InnerFence3)+']';
  Label3.Caption := 'Outer Fences = ['+FormatFloat('0.00',Series1.OuterFence1)+
    ' ; '+FormatFloat('0.00',Series1.OuterFence3)+']';
end;

procedure TBoxCustomForm.Chart1AfterDraw(Sender: TObject);
begin
  inherited;
  CheckBox1Click(Self);
end;

initialization
  RegisterClass(TBoxCustomForm);
end.
