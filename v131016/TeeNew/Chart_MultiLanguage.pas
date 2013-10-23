unit Chart_MultiLanguage;
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
  Base, TeeEdit, TeeProcs, TeEngine, Chart, Series;

type
  TChartMultiLanguage = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    ChartEditor1: TChartEditor;
    Series1: TPieSeries;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ChangeLanguage(ALanguage:Integer);
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses
    TeeConst, TeeProCo, { <-- English }

     // Languages
     TeeSpanish,
     TeeGerman,
     TeeCatalan,
     TeeFrench,
     TeeDanish,
     TeeDutch,
     TeeChinese,
     TeeChineseSimp,
     TeeBrazil,
     TeeSwedish,
     TeePortuguese,
     TeeRussian,
     TeeSlovene,
     TeeNorwegian,
     TeeJapanese,
     TeePolish,
     TeeTurkish,
     TeeHungarian,
     TeeItalian,
     TeeArabic,
     TeeHebrew,
     TeeUkrainian,
     TeeKorean,
     TeeIndonesian,
     TeeGalician,
     TeeFinnish,
     TeeSlovak,
     TeeHellenic,
     TeeRomanian,
     TeeSerbian,
     TeeFarsi,
     TeeCzech,
     TeeHindi,
     TeeUrdu,
     TeeBulgarian,

     // Ask Language editor dialog
     TeeTranslate, 
     TeeTranslateEditor;

procedure TChartMultiLanguage.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TChartMultiLanguage.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex:=0; { English = default }

  { Fill series with sample random values }
  Series1.FillSampleValues;
end;

class procedure TChartMultiLanguage.ChangeLanguage(ALanguage:Integer);
begin
  Case ALanguage of
    1: TeeSetBrazil;
    2: TeeSetCatalan;
    3: TeeSetChineseSimp;
    4: TeeSetChinese;
    5: TeeSetDanish;
    6: TeeSetDutch;
    7: TeeSetFrench;
    8: TeeSetGerman;
    9: TeeSetItalian;
   10: TeeSetPortuguese;
   11: TeeSetRussian;
   12: TeeSetSpanish;
   13: TeeSetSwedish;
   14: TeeSetNorwegian;
   15: TeeSetJapanese;
   16: TeeSetPolish;
   17: TeeSetSlovene;
   18: TeeSetTurkish;
   19: TeeSetHungarian;
   20: TeeSetGalician;
   21: TeeSetArabic;
   22: TeeSetHebrew;
   23: TeeSetUkrainian;
   24: TeeSetKorean;
   25: TeeSetIndonesian;
   26: TeeSetFinnish;
   27: TeeSetSlovak;
   28: TeeSetHellenic;
   29: TeeSetRomanian;
   30: TeeSetSerbian;
   31: TeeSetFarsi;
   32: TeeSetCzech;
   33: TeeSetHindi;
   34: TeeSetUrdu;
   35: TeeSetBulgarian;
  else
    TeeSetEnglish;
  end;
end;

procedure TChartMultiLanguage.ComboBox1Change(Sender: TObject);
begin
  ChangeLanguage(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));

  { Translation Examples: }

  { Translate the "Show Editor" button to the new selected
    language using a constant string }
  Button1.Caption:=TeeMsg_EditChart;

  { Reset label caption to English }
  Label1.Caption:='&Choose a Language:';

  { Translate the "Choose a Language" label to the new language }
  TeeTranslateControl(Label1);

  { Fill again the Series with translated values }
  Series1.FillSampleValues;

  { A whole form can also be translated: TeeTranslateControl(Form1) }
end;

procedure TChartMultiLanguage.FormCreate(Sender: TObject);
begin
  inherited;

  // Obtain the list of installed languages from the internal editor dialog:

  with TAskLanguage.Create(nil) do
  try
    Self.ComboBox1.Items.Assign(LBLangs.Items);
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TChartMultiLanguage);
end.
