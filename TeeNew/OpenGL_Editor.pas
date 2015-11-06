unit OpenGL_Editor;
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
  Base, TeEngine, TeePyramid, TeeProcs,
  Chart, TeeEdit, Series, Bar3D, TeeOpenGL, TeeTools;

type
  TOpenGLEditorForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    TeeOpenGL1: TTeeOpenGL;
    Series1: TBar3DSeries;
    Button1: TButton;
    ChartEditor1: TChartEditor;
    ChartTool1: TRotateTool;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

{$IFDEF WINDOWS}
Uses TeeGLEditor;  { <-- important to show the OpenGL editor at runtime !!! }
{$ENDIF}

procedure TOpenGLEditorForm.CheckBox1Click(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  try
    TeeOpenGL1.Active:=CheckBox1.Checked;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TOpenGLEditorForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

procedure TOpenGLEditorForm.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

initialization
  RegisterClass(TOpenGLEditorForm);
end.
