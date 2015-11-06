unit Tool_Rotate;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeTools;

type
  TRotateToolForm = class(TBaseForm)
    Series1: TSurfaceSeries;
    CheckBox1: TCheckBox;
    ChartTool1: TRotateTool;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ChartTool1Rotate(Sender: TObject);
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

procedure TRotateToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TRotateToolForm.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked
end;

procedure TRotateToolForm.ChartTool1Rotate(Sender: TObject);
begin
  Label1.Caption:='Rotation: '+IntToStr(Chart1.View3DOptions.Rotation)+' '+
                  'Elevation: '+IntToStr(Chart1.View3DOptions.Elevation);
end;

initialization
  RegisterClass(TRotateToolForm);
end.
