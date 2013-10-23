unit Editor_Croatian;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TEditorCroatian = class(TBaseForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Pie : TPieSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar, TeeCroatian, TeeProco;

procedure TEditorCroatian.FormCreate(Sender: TObject);
begin
  inherited;

  Pie := TPieSeries.Create(Self);
  Chart1.AddSeries(Pie);

  With Pie do
  begin
    AddPie(20,'Automobili');
    AddPie(10,'Telefoni');
    AddPie(30,'Monitori');
    AddPie(15,'Tablice');
    AddPie(5,'Lampe');
    AddPie(18,'Tastature');
    AddPie(2,'Bicikli');
  end;

  Chart1.Title.Caption:= 'Croatian Editor';
end;

procedure TEditorCroatian.Button1Click(Sender: TObject);
begin
  // Set Croatian language
  TeeSetCroatian;

  EditChart(self,Chart1);

  // Set English language
  TeeSetEnglish;
end;

initialization
  RegisterClass(TEditorCroatian);
end.
