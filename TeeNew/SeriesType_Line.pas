unit SeriesType_Line;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TLineSeriesForm = class(TBaseForm)
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Series2: TLineSeries;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    CheckBox5: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
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

procedure TLineSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Stairs:=CheckBox1.Checked;
  Series2.Stairs:=Series1.Stairs;
end;

procedure TLineSeriesForm.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;

  Series1.Clear;
  for t:=1 to 20 do Series1.Add( Random(100), '', clTeeColor );
  Series1.SetNull(3);   { <-- null point example }

  Series2.Clear;
  for t:=1 to 20 do Series2.Add( Random(100), '', clTeeColor);
  Series2.SetNull(10);  { <-- null point example }
end;

procedure TLineSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Series1.Marks.Visible:=CheckBox2.Checked;
  Series2.Marks.Visible:=CheckBox2.Checked;
end;

procedure TLineSeriesForm.CheckBox3Click(Sender: TObject);
begin
  Series1.Pointer.Visible:=CheckBox3.Checked;
  Series2.Pointer.Visible:=CheckBox3.Checked;
end;

procedure TLineSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self, Series1);
end;

procedure TLineSeriesForm.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then Series1.Stacked:=cssStack
                       else Series1.Stacked:=cssNone;
end;

procedure TLineSeriesForm.CheckBox5Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox5.Checked;
end;

initialization
  RegisterClass(TLineSeriesForm);
end.
