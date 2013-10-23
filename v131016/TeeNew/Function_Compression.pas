unit Function_Compression;
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
  Base, TeeProcs, TeEngine, Chart, Series, OHLChart, CandleCh, TeeCompressOHLC;

type
  TCompressionDemo = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Series1: TCandleSeries;
    Series2: TCandleSeries;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Compression : TCompressFunction;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCompressionDemo.FormCreate(Sender: TObject);
begin
  inherited;

  // Example: How to create a Compression function
  Compression:=TCompressFunction.Create(Self);

  // Set function to Series2
  Series2.DataSource:=Series1;
  Series2.SetFunction(Compression);

  // Sample Candle values
  Series1.FillSampleValues(500);

  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=1;
end;

procedure TCompressionDemo.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then  // No Compression
  begin
    // Show original data and hide compression series
    Series1.Visible:=True;
    Series2.Visible:=False;
  end
  else
  begin
    // Show compression series and hide original data
    Series1.Visible:=False;
    Series2.Visible:=True;

    // Set compression datetime period:

    case ComboBox1.ItemIndex of
      1: Compression.Compress:=ocWeek;
      2: Compression.Compress:=ocMonth;
      3: Compression.Compress:=ocBiMonth;
      4: Compression.Compress:=ocQuarter;
      5: Compression.Compress:=ocYear;
    end;
  end;
end;

procedure TCompressionDemo.ComboBox2Change(Sender: TObject);
begin
  // Switch between different display modes
  Case ComboBox2.ItemIndex of
    0: Series1.CandleStyle:=csCandleStick;
    1: Series1.CandleStyle:=csCandleBar;
  else
    Series1.CandleStyle:=csOpenClose;
  end;

  // Set compression Series2 style
  Series2.CandleStyle:=Series1.CandleStyle;
end;

initialization
  RegisterClass(TCompressionDemo);
end.
