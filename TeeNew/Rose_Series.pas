unit Rose_Series;
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
  Base, TeEngine, Series, TeePolar, TeeRose, TeeProcs, Chart;

type
  TRoseForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    CheckBox2: TCheckBox;
    Series1: TRoseSeries;
    Series2: TRoseSeries;
    Series3: TRoseSeries;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RoseForm: TRoseForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TRoseForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox1.Checked;
end;

procedure TRoseForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TRoseForm.FormCreate(Sender: TObject);
begin
  inherited;

  ComboBox1.ItemIndex:=0;
    
  Series1.FillSampleValues;
  Series2.FillSampleValues;
  Series3.FillSampleValues;
end;

procedure TRoseForm.CheckBox2Click(Sender: TObject);
begin
  Series1.Circled:=CheckBox2.Checked;
end;

procedure TRoseForm.ComboBox1Change(Sender: TObject);
begin
  Series1.MultiRose:=TMultiRose(ComboBox1.ItemIndex);
end;

initialization
  RegisterClass(TRoseForm);
end.
