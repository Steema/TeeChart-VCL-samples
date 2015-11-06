unit Line_TreatNulls;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeFrameTool, TeCanvas;

type
  TLineTreatNulls = class(TBaseForm)
    Series1: TLineSeries;
    cbHoriz: TCheckBox;
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    LValue: TLabel;
    Edit1: TEdit;
    procedure cbHorizClick(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TLineTreatNulls.cbHorizClick(Sender: TObject);
var tmp : TChartSeries;
begin
  tmp:=Series1;

  if cbHoriz.Checked then
     ChangeSeriesType(tmp,THorizLineSeries)
  else
     ChangeSeriesType(tmp,TLineSeries)
end;

procedure TLineTreatNulls.ComboFlat1Change(Sender: TObject);
begin
  Edit1.Enabled:=ComboFlat1.ItemIndex=2;
  LValue.Enabled:=Edit1.Enabled;

  Series1.TreatNulls:=TTreatNullsStyle(ComboFlat1.ItemIndex);
end;

procedure TLineTreatNulls.Edit1Change(Sender: TObject);
begin
  with Series1 do
  begin
    MandatoryValueList[12]:=StrToFloat(Edit1.Text);
    MandatoryValueList[13]:=StrToFloat(Edit1.Text);

    Repaint;
  end;
end;

procedure TLineTreatNulls.FormCreate(Sender: TObject);
begin
  inherited;

  ComboFlat1.ItemIndex:=0;

  with Series1 do
  begin
    YValues[12]:=0;
    SetNull(12);

    YValues[13]:=0;
    SetNull(13);
  end;
end;

initialization
  RegisterClass(TLineTreatNulls);
end.
