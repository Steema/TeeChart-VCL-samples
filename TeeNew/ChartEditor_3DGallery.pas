unit ChartEditor_3DGallery;
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
  Base, TeCanvas, TeEngine, TeeSurfa, TeeProcs, Chart, TeeEdi3D, TeeGDIPlus;

type
  TGallery3DForm = class(TBaseForm)
    Series1: TSurfaceSeries;
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
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{$IFNDEF TEENOTHEMES}
uses 
  TeeThemes;
{$ENDIF}

procedure TGallery3DForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D := True;

  Series1.FillSampleValues;

  {$IFNDEF TEENOTHEMES}
  with TWindowsXPTheme.Create(Chart1) do
  try
    Apply;  // apply Windows XP theme to Chart1
  finally
    Free;
  end;
  {$ENDIF}

  Chart1.Walls.Left.AutoHide:=True;
  Chart1.Walls.Right.AutoHide:=True;

  Chart1.Walls.Left.Show;
  Chart1.Walls.Right.Show;
end;

procedure TGallery3DForm.Button1Click(Sender: TObject);
begin
  inherited;

  // Show 3D Gallery:
  with TFormTee3D.Create(Self) do
  try
    Tag:=ObjectToTag(Chart1);

    Align:=alNone;
    BorderStyle:=TeeBorderStyle;  // bsDialog
    Position:=poScreenCenter;
    Height:=500;

    CheckControls;

    PageControl1.ActivePage:=TabViews;
    PageControl1Change(PageControl1);

    ResetTab3D:=False;

    ShowModal;
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TGallery3DForm);
end.
