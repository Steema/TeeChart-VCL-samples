unit SeriesType_Bezier;
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, Series, TeeBezie;

type
  TBezierSeriesForm = class(TBaseForm)
    Series1: TBezierSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Button1: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

procedure TBezierSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked
end;

procedure TBezierSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(30);
end;

procedure TBezierSeriesForm.Edit1Change(Sender: TObject);
begin
  if UpDown1.Position>0 then   // <-- for Kylix compatibility
     Series1.NumBezierPoints:=UpDown1.Position
end;

procedure TBezierSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TBezierSeriesForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.BezierStyle:=bsWindows;
    1: Series1.BezierStyle:=bsBezier3;
    2: Series1.BezierStyle:=bsBezier4;
  end;
end;

procedure TBezierSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TBezierSeriesForm);
end.
