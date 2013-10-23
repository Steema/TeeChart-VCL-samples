unit Marks_Callout;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TMarksCallouts = class(TBaseForm)
    Series1: TBarSeries;
    Label1: TLabel;
    CBArrowStyle: TComboFlat;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CBArrowStyleChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses EditChar;

procedure TMarksCallouts.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
  Series1.Marks.Callout.Style:=psDownTriangle;
  CBArrowStyle.ItemIndex:=3;
end;

procedure TMarksCallouts.CBArrowStyleChange(Sender: TObject);
begin
  Series1.Marks.Callout.Style:=TSeriesPointerStyle(CBArrowStyle.ItemIndex);
end;

procedure TMarksCallouts.Button1Click(Sender: TObject);
begin
  EditSeriesMarks(Self,Series1);
end;

procedure TMarksCallouts.CheckBox1Click(Sender: TObject);
begin
  Series1.Marks.Callout.Visible:=CheckBox1.Checked
end;

initialization
  RegisterClass(TMarksCallouts);
end.
