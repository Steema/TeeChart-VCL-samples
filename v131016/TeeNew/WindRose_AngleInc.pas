unit WindRose_AngleInc;
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
  TWindAngleInc = class(TBaseForm)
    Series1: TWindRoseSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
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

procedure TWindAngleInc.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TWindAngleInc.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.AngleIncrement:=15;
    1: Series1.AngleIncrement:=30;
    2: Series1.AngleIncrement:=45;
    3: Series1.AngleIncrement:=90;
  end;
end;

procedure TWindAngleInc.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;
end;

initialization
  RegisterClass(TWindAngleInc);
end.
