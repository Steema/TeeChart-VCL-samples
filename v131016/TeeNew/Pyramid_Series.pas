unit Pyramid_Series;
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
  Base, TeCanvas, TeEngine, TeePyramid, TeeProcs, Chart, TeeOpenGL;

type
  TPyramidForm = class(TBaseForm)
    Series1: TPyramidSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Button1: TButton;
    CheckBox3: TCheckBox;
    TeeOpenGL1: TTeeOpenGL;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

Uses EditChar;

procedure TPyramidForm.CheckBox2Click(Sender: TObject);
begin
  Series1.ColorEachPoint:=CheckBox2.Checked
end;

procedure TPyramidForm.CheckBox3Click(Sender: TObject);
begin
  Chart1.LeftAxis.Inverted:=CheckBox3.Checked 
end;

procedure TPyramidForm.CheckBox1Click(Sender: TObject);
begin
  // same as: Series1.ValueColor[2]:=clNone;
  Series1.SetNull(2,CheckBox1.Checked);

  // same as: Series1.ValueColor[5]:=clNone;
  Series1.SetNull(5,CheckBox1.Checked);
end;

procedure TPyramidForm.Edit1Change(Sender: TObject);
begin
  if Showing then Series1.SizePercent:=UpDown1.Position
end;

procedure TPyramidForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TPyramidForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

initialization
  RegisterClass(TPyramidForm);
end.
