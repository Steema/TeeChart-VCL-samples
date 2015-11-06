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
    TeeLanguages,

    // Ask Language editor dialog
    TeeTranslate, TeeTranslateEditor;

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
  TeeSetLanguage(True,ALanguage);
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
