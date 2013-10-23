unit WindRose_Series;
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
  TWindRoseForm = class(TBaseForm)
    Series1: TWindRoseSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Series2: TWindRoseSeries;
    CheckBox2: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TWindRoseForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox1.Checked;
end;

procedure TWindRoseForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TWindRoseForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Clear;
  Series1.AddXY(  30, 100, '', clTeeColor );
  Series1.AddXY(  60, 200, '', clTeeColor );
  Series1.AddXY(  90,  50, '', clTeeColor );
  Series1.AddXY( 120, 150, '', clTeeColor );

  Series2.Clear;
  Series2.AddXY( 130, 100, '', clTeeColor );
  Series2.AddXY( 160, 200, '', clTeeColor );
  Series2.AddXY( 190,  50, '', clTeeColor );
  Series2.AddXY( 220, 150, '', clTeeColor );
end;

procedure TWindRoseForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.AngleIncrement:=15;
    1: Series1.AngleIncrement:=30;
    2: Series1.AngleIncrement:=45;
    3: Series1.AngleIncrement:=90;
  end;
end;

procedure TWindRoseForm.CheckBox2Click(Sender: TObject);
begin
  Series1.Circled:=CheckBox2.Checked;
end;

procedure TWindRoseForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;
end;

initialization
  RegisterClass(TWindRoseForm);
end.
