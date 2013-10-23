unit Chart_Axes;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TChartAxesForm = class(TBaseForm)
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TChartAxesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox1.Checked
end;

procedure TChartAxesForm.CheckBox2Click(Sender: TObject);
var t : Integer;
begin
  With Chart1 do
  for t:=0 to Axes.Count-1 do
     Axes[t].Grid.Visible:=CheckBox2.Checked;

  CheckBox5.Enabled:=CheckBox2.Checked;
end;

procedure TChartAxesForm.CheckBox4Click(Sender: TObject);
begin
  Chart1.DepthAxis.Visible:=CheckBox4.Checked;
  if CheckBox4.Checked then Chart1.MarginRight:=15
                       else Chart1.MarginRight:=3;
end;

procedure TChartAxesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

procedure TChartAxesForm.CheckBox5Click(Sender: TObject);
begin
  Chart1.Axes.Behind:=CheckBox5.Checked;
end;

procedure TChartAxesForm.CheckBox6Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox6.Checked;
end;

procedure TChartAxesForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.HorizAxis:=aTopAxis;
    1: Series1.HorizAxis:=aBottomAxis;
  else
    Series1.HorizAxis:=aBothHorizAxis;
  end;
end;

procedure TChartAxesForm.ComboBox2Change(Sender: TObject);
begin
  inherited;
  Case ComboBox2.ItemIndex of
    0: Series1.VertAxis:=aLeftAxis;
    1: Series1.VertAxis:=aRightAxis;
  else
    Series1.VertAxis:=aBothVertAxis;
  end;
end;

procedure TChartAxesForm.Button1Click(Sender: TObject);
begin
  EditChartAxis(Self,Chart1.LeftAxis);
end;

procedure TChartAxesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;
  ComboBox2.ItemIndex:=0;
end;

initialization
  RegisterClass(TChartAxesForm);
end.
