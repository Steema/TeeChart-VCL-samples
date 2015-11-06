unit Export_DPI;
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
  Base, TeCanvas, TeEngine, Series, GanttCh, TeeProcs, Chart, ArrowCha,
  TeeSurfa, TeeTools;

type
  TDPIExportForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    Series1: TSurfaceSeries;
    ChartTool1: TRotateTool;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DPIExportForm: TDPIExportForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeJPEG, TeExport, TeeBmpOptions;

procedure TDPIExportForm.Button1Click(Sender: TObject);
begin
  SaveDialog1.Filter:='JPEG (*.jpg) | *.jpg';

  if SaveDialog1.Execute then
  begin
    TeeSaveToJPEG(Chart1, SaveDialog1.FileName, Chart1.Width, Chart1.Height,
                  UpDown1.Position);
  end;
end;

procedure TDPIExportForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1);
end;

procedure TDPIExportForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

procedure TDPIExportForm.Button3Click(Sender: TObject);
begin
  SaveDialog1.Filter:='Bitmap (*.bmp)| *.bmp';

  if SaveDialog1.Execute then
  begin
    TeeSaveToBitmap(Chart1, SaveDialog1.FileName,
                    Chart1.ClientRect,
                    UpDown1.Position);
  end;
end;

initialization
  RegisterClass(TDPIExportForm);
end.
