unit Zoom_MinPix;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeePenDlg, TeCanvas;

type
  TZoomMinPixel = class(TBaseForm)
    Series1: THorizLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    ComboBox1: TComboBox;
    procedure Edit1Change(Sender: TObject);
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

procedure TZoomMinPixel.Edit1Change(Sender: TObject);
begin
  Chart1.Zoom.MinimumPixels:=UpDown1.Position
end;

procedure TZoomMinPixel.ComboBox1Change(Sender: TObject);
begin
  Chart1.Zoom.MouseButton:=TMouseButton(ComboBox1.ItemIndex);
end;

procedure TZoomMinPixel.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(80);
end;

procedure TZoomMinPixel.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TZoomMinPixel);
end.
