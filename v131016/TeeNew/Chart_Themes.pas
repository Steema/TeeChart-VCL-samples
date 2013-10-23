unit Chart_Themes;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls, 
  {$ENDIF}
  TeeThemeEditor, Base, TeeProcs, TeEngine, Chart, TeeThemes, Series;

type
  TChartThemes = class(TBaseForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Button1: TButton;
    Series1: TBarSeries;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TChartThemes.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues;
  Series1.ColorEachPoint:=True;

  // Add all available themes to ListBox1.
  AddChartThemes(ListBox1.Items);

  // Select first theme (TeeChart default theme)
  ListBox1.ItemIndex:=0;
end;

procedure TChartThemes.Button1Click(Sender: TObject);
var tmp : TChartThemeClass;
begin
  // Show the Chart Theme editor
  tmp:=ChartThemeSelector(Chart1);

  if Assigned(tmp) then
     ListBox1.ItemIndex:=ListBox1.Items.IndexOfObject(TObject(tmp));
end;

procedure TChartThemes.ListBox1Click(Sender: TObject);
var tmp : TChartThemeClass;
begin
  tmp:=TChartThemeClass(ListBox1.Items.Objects[ListBox1.ItemIndex]);

  // Change Theme. The last parameter "-1" means to use the
  // default Theme color palette.
  ApplyChartTheme(tmp,Chart1,-1);
end;

procedure TChartThemes.Button2Click(Sender: TObject);
begin
  with TWindowsXPTheme.Create(Chart1) do
  try
    Apply;
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TChartThemes);
end.
