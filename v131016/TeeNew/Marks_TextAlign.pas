unit Marks_TextAlign;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TMarksTextAlign = class(TBaseForm)
    Label1: TLabel;
    cbAlign: TComboFlat;
    Series1: TPointSeries;
    procedure cbAlignChange(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TMarksTextAlign.cbAlignChange(Sender: TObject);
begin
  Series1.Marks.TextAlign:=TAlignment(cbAlign.ItemIndex);
end;

procedure TMarksTextAlign.Series1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  MarkText := 'Point Info.' + TeeLineSeparator +
    'x : ' + FloatToStr(Series1.XValue[ValueIndex]) + TeeLineSeparator +
    'y : ' + FloatToStr(Series1.YValue[ValueIndex]);
end;

procedure TMarksTextAlign.FormCreate(Sender: TObject);
begin
  inherited;

  cbAlign.ItemIndex:=2;
  cbAlignChange(self);
end;

initialization
  RegisterClass(TMarksTextAlign);
end.
