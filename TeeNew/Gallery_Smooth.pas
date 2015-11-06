unit Gallery_Smooth;
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
  Base, TeEngine, Series, TeeProcs, TeeGalleryPanel, 
  {$IFNDEF TEENOTHEMES}
  TeeThemeEditor,
  {$ENDIF}
  Chart;

type
  TGallerySmooth = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartGalleryPanel1: TChartGalleryPanel;
    Button1: TButton;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TGallerySmooth.CheckBox2Click(Sender: TObject);
begin
  ChartGalleryPanel1.View3D:=CheckBox2.Checked
end;

procedure TGallerySmooth.CheckBox1Click(Sender: TObject);
begin
  ChartGalleryPanel1.Smooth:=CheckBox1.Checked;
end;

procedure TGallerySmooth.FormCreate(Sender: TObject);
begin
  inherited;

  ChartGalleryPanel1.CreateGalleryPage('Standard');
  ChartGalleryPanel1.NumCols:=3;
  ChartGalleryPanel1.NumRows:=2;
end;

procedure TGallerySmooth.Button1Click(Sender: TObject);
begin
  {$IFNDEF TEENOTHEMES}
  with TChartThemeSelector.Create(Self) do
  try
    Chart:=ChartGalleryPanel1.SelectedChart;
    CBScale.Checked:=False;

    if ShowModal=mrOk then
       ChartGalleryPanel1.UseTheme(SelectedTheme);
  finally
    Free;
  end;
  {$ENDIF}
end;

initialization
  RegisterClass(TGallerySmooth);
end.
