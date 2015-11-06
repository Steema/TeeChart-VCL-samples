unit Legend_TextStyle;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TLegendStyle = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Series1: TPieSeries;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TLegendStyle.ComboBox1Change(Sender: TObject);
begin
  inherited;
  Case ComboBox1.ItemIndex of
    0: Chart1.Legend.TextStyle:=ltsPercent;
    1: Chart1.Legend.TextStyle:=ltsXAndValue;
    2: Chart1.Legend.TextStyle:=ltsXAndPercent;
  end;
end;

procedure TLegendStyle.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
  Chart1.Legend.TextStyle:=ltsPercent;
end;

procedure TLegendStyle.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TLegendStyle);
end.
