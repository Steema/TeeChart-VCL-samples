unit Export_SVG;
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
  TeeSVGCanvas, Base, TeeProcs, TeEngine, Chart, Series, TeeTools, BubbleCh;

type
  TSVGExportForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Series1: TBarSeries;
    Series2: TLineSeries;
    Series3: TPointSeries;
    Series4: TPieSeries;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
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

uses
  TeExport;

procedure TSVGExportForm.Button1Click(Sender: TObject);
begin
  TeeSavePanel(TSVGExportFormat,Chart1);
end;

procedure TSVGExportForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1);
end;

procedure TSVGExportForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues;
end;

procedure TSVGExportForm.Label1Click(Sender: TObject);
begin
  TeeGotoURL(Handle,'http://www.adobe.com/svg/viewer/install/main.html');
end;

initialization
  RegisterClass(TSVGExportForm);
end.
