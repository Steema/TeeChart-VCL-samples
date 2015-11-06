unit Series_ContourPointer;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeSurfa, TeCanvas, TeePenDlg;

type
  TSeriesContourPointer = class(TBaseForm)
    cbVisible: TCheckBox;
    bEdit: TButton;
    bPen: TButtonPen;
    Label1: TLabel;
    SEPointHorizSize: TEdit;
    UDPointHorizSize: TUpDown;
    Label2: TLabel;
    SEPointVertSize: TEdit;
    UDPointVertSize: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure SEPointHorizSizeChange(Sender: TObject);
    procedure SEPointVertSizeChange(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
  private
    { Private declarations }
    Contour : TContourSeries;
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

procedure TSeriesContourPointer.FormCreate(Sender: TObject);
begin
  inherited;

  Contour:=TContourSeries.Create(self);
  Chart1.AddSeries(Contour);

  bPen.LinkPen(Contour.Pen);

  with Contour do
  begin
    ColorEachPoint:=False;
    FillSampleValues(45);
    PaletteStyle:=psRainbow;
    NumLevels:=14;

    Pen.Visible:=False;
    Pointer.Visible:=True;

    Pointer.HorizSize:=1;
    Pointer.VertSize:=1;
  end;
end;

procedure TSeriesContourPointer.bEditClick(Sender: TObject);
begin
  EditSeries(Self, Contour);
end;

procedure TSeriesContourPointer.SEPointHorizSizeChange(Sender: TObject);
begin
  Contour.Pointer.HorizSize:=UDPointHorizSize.Position;
end;

procedure TSeriesContourPointer.SEPointVertSizeChange(Sender: TObject);
begin
  Contour.Pointer.VertSize:=UDPointVertSize.Position;
end;

procedure TSeriesContourPointer.cbVisibleClick(Sender: TObject);
begin
  Contour.Pointer.Visible:=cbVisible.Checked;
end;

initialization
  RegisterClass(TSeriesContourPointer);
end.

