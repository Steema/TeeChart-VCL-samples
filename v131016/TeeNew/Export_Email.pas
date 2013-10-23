unit Export_Email;
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
  Base, TeEngine, Series, ImaPoint, TeeProcs, Chart;

type
  TExportEmailForm = class(TBaseForm)
    Button1: TButton;
    Series1: TDeltaPointSeries;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

Uses TeExport, TeeJPEG, TeeConst;

procedure TExportEmailForm.Button1Click(Sender: TObject);
begin
  TeeExport(Self,Chart1);
end;

procedure TExportEmailForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TExportEmailForm.Button2Click(Sender: TObject);
type TPathName=Array[0..MAX_PATH] of Char;
var tmpPath,
    tmpName : TPathName;
begin
  { obtain the "temp" folder path... }

  {$IFDEF LINUX}
  StrPCopy(tmpPath,'/tmp');
  {$ELSE}
  if GetTempPath(MAX_PATH,tmpPath)=0 then
     Raise Exception.Create(TeeMsg_CanNotFindTempPath);
  {$ENDIF}

  { set the filename to "\temp\teechart.jpg" }
  {$IFDEF LINUX}
  StrPCopy(tmpName,StrPas(tmpPath)+'/TeeChart.jpg');
  {$ELSE}
  StrPCopy(tmpName,StrPas(tmpPath)+'\TeeChart.jpg');
  {$ENDIF}

  { create the JPEG chart... }
  With TJPEGExportFormat.Create do
  try
    Panel:=Chart1;
    SaveToFile(tmpName);
  finally
    Free;
  end;

  { email the jpeg chart... }
  TeeEmailFile(tmpName,'TeeChart attached!');

  { delete the temporary jpeg file... }
  DeleteFile(tmpName);
end;

initialization
  RegisterClass(TExportEmailForm);
end.
