unit SeriesSource_LoadMode;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeURL,
  TeeSeriesTextEd;

type
  TSeriesSourceLoadMode = class(TBaseForm)
    Series1: TBarSeries;
    Label1: TLabel;
    cbLoadMode: TComboFlat;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo2: TMemo;
    Memo3: TMemo;
    SeriesTextSource1: TSeriesTextSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbLoadModeChange(Sender: TObject);
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

procedure TSeriesSourceLoadMode.FormCreate(Sender: TObject);
begin
  inherited;

  Memo2.WordWrap:=false;
  Memo3.WordWrap:=False;

  SeriesTextSource1.LoadMode:=lmAppend;
  cbLoadMode.ItemIndex:=1;
end;

procedure TSeriesSourceLoadMode.BitBtn1Click(Sender: TObject);
begin
  SeriesTextSource1.LoadFromStrings(Memo2.Lines);
end;

procedure TSeriesSourceLoadMode.BitBtn2Click(Sender: TObject);
begin
  SeriesTextSource1.LoadFromStrings(Memo3.Lines);
end;

procedure TSeriesSourceLoadMode.cbLoadModeChange(Sender: TObject);
begin
  SeriesTextSource1.LoadMode:=TSourceLoadMode(cbLoadMode.ItemIndex);
end;

initialization
  RegisterClass(TSeriesSourceLoadMode);
end.
