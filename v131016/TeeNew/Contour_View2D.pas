unit Contour_View2D;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart;

type
  TContourView2D = class(TBaseForm)
    Series1: TContourSeries;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TContourView2D.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;
end;

procedure TContourView2D.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

initialization
  RegisterClass(TContourView2D);
end.
