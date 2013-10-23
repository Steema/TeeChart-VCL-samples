unit ColorGrid_Marks;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart;

type
  TColorGridMarks = class(TBaseForm)
    Series1: TColorGridSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

uses EditChar;

procedure TColorGridMarks.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
  Series1.CenteredPoints:=True;
  Series1.Marks.Style:=smsValue;
  Series1.Marks.Visible:=True;
  Series1.Marks.Shadow.Transparency:=70;
end;

procedure TColorGridMarks.CheckBox1Click(Sender: TObject);
begin
  Series1.Marks.Visible:=CheckBox1.Checked;
end;

procedure TColorGridMarks.Button1Click(Sender: TObject);
begin
  EditSeriesMarks(Self,Series1);
  CheckBox1.Checked:=Series1.Marks.Visible;
end;

procedure TColorGridMarks.CheckBox2Click(Sender: TObject);
begin
  Series1.CenteredPoints:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TColorGridMarks);
end.
