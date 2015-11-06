unit DesignTime_Options;
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
  Base, TeeProcs, TeEngine, Chart, TeeDesignOptions, TeeEditCha, TeeGally, TeeEdit;

type
  TDesignTimeOptions = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ChartEditor1: TChartEditor;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Chart_MultiLanguage, TeeTranslate;

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

procedure TDesignTimeOptions.Button1Click(Sender: TObject);
begin
  // Show the Options editor.
  // If user presses OK, settings are stored at Registry (or Inifile in Linux).

  with TOptionsForm.Create(Self) do
  try
    TabNewChart.TabVisible:=False; // <-- this tab has only sense at design-time
    ShowModal;
  finally
    Free;
  end;
end;

procedure TDesignTimeOptions.Button2Click(Sender: TObject);
begin
  TChartMultiLanguage.ChangeLanguage(TeeLanguageRegistry);

  ChartEditor1.TreeView:=TeeReadBoolOption(TeeMsg_TreeMode,False);
  ChartEditor1.Execute;
end;

procedure TDesignTimeOptions.Button3Click(Sender: TObject);
begin
  TChartMultiLanguage.ChangeLanguage(TeeLanguageRegistry);
  
  CreateNewSeriesGallery(GetParentForm(Self), Chart1);
end;

initialization
  RegisterClass(TDesignTimeOptions);
end.
