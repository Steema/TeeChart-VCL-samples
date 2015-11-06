unit Canvas_GrayScale;
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
  TGrayScaleForm = class(TBaseForm)
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    CBMethod: TComboBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBMethodChange(Sender: TObject);
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

Uses 
  TeCanvas, TeeFilters;  // <--- TeeGrayScale proc

procedure TGrayScaleForm.CheckBox1Click(Sender: TObject);
begin
  CheckBox2.Enabled:=CheckBox1.Checked;
  Chart1.Repaint;
end;

procedure TGrayScaleForm.Chart1AfterDraw(Sender: TObject);
begin
  {$IFDEF CLX}
  if Assigned(CBMethod) then
  {$ENDIF}
  if CheckBox1.Checked then { do gray scale... }
     TeeGrayScale( (Chart1.Canvas as TTeeCanvas3D).Bitmap,
                   CheckBox2.Checked,
                   CBMethod.ItemIndex);
end;

procedure TGrayScaleForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
  {$IFDEF CLX}
  CBMethod.OnSelect:=CBMethod.OnChange;
  {$ENDIF}
end;

procedure TGrayScaleForm.CBMethodChange(Sender: TObject);
begin
  Chart1.Repaint;
end;

procedure TGrayScaleForm.FormShow(Sender: TObject);
begin
  inherited;
  CBMethod.ItemIndex:=0;
end;

initialization
  RegisterClass(TGrayScaleForm);
end.
