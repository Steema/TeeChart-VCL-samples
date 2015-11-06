unit Tools_ColorBand;
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
  Base, TeEngine, Series, TeeTools, TeeProcs, Chart, TeCanvas;

type
  TColorBandToolForm = class(TBaseForm)
    ChartTool1: TColorBandTool;
    Series1: TBarSeries;
    ChartTool2: TColorBandTool;
    ChartTool3: TColorBandTool;
    ChartTool4: TColorBandTool;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartTool5: TColorBandTool;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    CheckBox5: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    function SelectedBand:TColorBandTool;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TColorBandToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.AddArray([30,150,75,280,600]);

  UpDown1.Max:=Chart1.Tools.Count-1;
end;

procedure TColorBandToolForm.CheckBox1Click(Sender: TObject);
begin
  { show / hide color bands }
  ChartTool1.Active:=CheckBox1.Checked;
  ChartTool2.Active:=CheckBox1.Checked;
  ChartTool3.Active:=CheckBox1.Checked;
  ChartTool4.Active:=CheckBox1.Checked;
  ChartTool5.Active:=CheckBox1.Checked;
end;

procedure TColorBandToolForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.LeftAxis.Inverted:=CheckBox2.Checked
end;

procedure TColorBandToolForm.CheckBox3Click(Sender: TObject);
begin
  SelectedBand.Gradient.Visible:=CheckBox3.Checked;
end;

procedure TColorBandToolForm.CheckBox4Click(Sender: TObject);
begin
  SelectedBand.DrawBehind:=CheckBox4.Checked;
end;

procedure TColorBandToolForm.CheckBox5Click(Sender: TObject);
begin
  SelectedBand.DrawBehindAxes:=CheckBox5.Checked;
end;

function TColorBandToolForm.SelectedBand:TColorBandTool;
begin
  result:=Chart1.Tools[UpDown1.Position] as TColorBandTool;
end;

procedure TColorBandToolForm.Edit1Change(Sender: TObject);
begin
  CheckBox3.Checked:=SelectedBand.Gradient.Visible;
  CheckBox4.Checked:=SelectedBand.DrawBehind;
  CheckBox5.Checked:=SelectedBand.DrawBehindAxes;
end;

initialization
  RegisterClass(TColorBandToolForm);
end.
