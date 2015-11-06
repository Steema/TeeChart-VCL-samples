unit Zoom_Direction;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TZoomDirection = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Series1: TLineSeries;
    Label2: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TZoomDirection.ComboBox1Change(Sender: TObject);
begin
  inherited;
  Case ComboBox1.ItemIndex of
    0: Chart1.Zoom.Direction:=tzdHorizontal;
    1: Chart1.Zoom.Direction:=tzdVertical;
    2: Chart1.Zoom.Direction:=tzdBoth;
  end;
end;

procedure TZoomDirection.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(40);
end;

procedure TZoomDirection.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=2;
end;

initialization
  RegisterClass(TZoomDirection);
end.
