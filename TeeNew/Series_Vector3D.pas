unit Series_Vector3D;
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
  Base, TeCanvas, TeePenDlg, TeeProcs, TeEngine, Chart, TeeSurfa,
  TeeGDIPlus;

type
  TVector3DSeriesForm = class(TBaseForm)
    Series1: TVector3DSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses
  EditChar;

procedure TVector3DSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.View3D := True;
  Series1.FillSampleValues;
  Series1.UsePalette:=True;
end;

procedure TVector3DSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TVector3DSeriesForm);
end.
