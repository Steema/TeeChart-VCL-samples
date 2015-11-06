unit HistogramYOrigin;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeCanvas, TeeComma, TeEngine, Series, StatChar, TeeProcs, Chart;

type
  THistogramYOriginForm = class(TBaseForm)
    Series1: THistogramSeries;
    TeeCommander1: TTeeCommander;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    CBUseOrigin: TCheckBox;
    EOrigin: TEdit;
    UDOrigin: TUpDown;
    ButtonColor1: TButtonColor;
    ButtonColor2: TButtonColor;
    procedure CBUseOriginClick(Sender: TObject);
    procedure EOriginChange(Sender: TObject);
    procedure ButtonColor1Click(Sender: TObject);
    procedure ButtonColor2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshColors;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure THistogramYOriginForm.CBUseOriginClick(Sender: TObject);
begin
  Series1.UseYOrigin:=CBUseOrigin.Checked;
  UDOrigin.Enabled := CBUseOrigin.Checked;
  EOrigin.Enabled := CBUseOrigin.Checked;
  RefreshColors;
end;

procedure THistogramYOriginForm.RefreshColors;
var i : integer;
begin
  for i := 0 to Series1.Count-1 do
  if Series1.UseYOrigin then
    if (Series1.YValue[i] >= Series1.YOrigin) then
      Series1.ValueColor[i] := ButtonColor1.SymbolColor
    else
      Series1.ValueColor[i] := ButtonColor2.SymbolColor
  else
    Series1.ValueColor[i] := ButtonColor1.SymbolColor;
end;

procedure THistogramYOriginForm.EOriginChange(Sender: TObject);
begin
  Series1.YOrigin := UDOrigin.Position;
  RefreshColors;
end;

procedure THistogramYOriginForm.ButtonColor1Click(Sender: TObject);
begin
  RefreshColors;
end;

procedure THistogramYOriginForm.ButtonColor2Click(Sender: TObject);
begin
  RefreshColors;
end;

procedure THistogramYOriginForm.FormCreate(Sender: TObject);
begin
  inherited;
  ButtonColor1.SymbolColor:=clGreen;
  ButtonColor2.SymbolColor:=clRed;
  Series1.AddArray([100,-200,-50,50,150,350,200,-100,-300,-150,-50,10,100,300,350,500] );

  Series1.UseYOrigin:=CBUseOrigin.Checked;
  series1.YOrigin:=0;

  RefreshColors;
end;

initialization
  RegisterClass(THistogramYOriginForm);

end.
