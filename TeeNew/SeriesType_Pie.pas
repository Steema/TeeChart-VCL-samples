unit SeriesType_Pie;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TPieSeriesForm = class(TBaseForm)
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

Uses EditChar;

procedure TPieSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TPieSeriesForm.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked then
  begin
    Series1.AngleSize:=180;
    CheckBox4.Checked:=False;
    CheckBox4Click(Self);
  end
  else Series1.AngleSize:=360;
end;

procedure TPieSeriesForm.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
  begin
    Series1.Shadow.HorizSize:=40;
    Series1.Shadow.VertSize:=40;
  end
  else
  begin
    Series1.Shadow.HorizSize:=0;
    Series1.Shadow.VertSize:=0;
  end;
end;

procedure TPieSeriesForm.CheckBox3Click(Sender: TObject);
begin
  Series1.Marks.Visible:=CheckBox3.Checked;
end;

procedure TPieSeriesForm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then Series1.ExplodeBiggest:=30
                       else Series1.ExplodeBiggest:=0;
end;

procedure TPieSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;
end;

procedure TPieSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);

  Series1.EdgeStyle := edCurved;
end;

initialization
  RegisterClass(TPieSeriesForm);
end.
