unit Tool_LegendScrollBarThumb;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools, TeeLegendScrollBar;

type
  TToolLegendScrollBarThumb = class(TBaseForm)
    Series1: TBarSeries;
    bEdit: TButton;
    CBStyle: TComboFlat;
    Label1: TLabel;
    BBrowse: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    UDThumbSize: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure CBStyleChange(Sender: TObject);
    procedure BBrowseClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
    LegendScrollBar : TLegendScrollBar;
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
  {$IFDEF D6}
  DateUtils,
  {$ENDIF}
  EditChar, TeeBrushDlg;

procedure TToolLegendScrollBarThumb.FormCreate(Sender: TObject);
begin
  inherited;

  LegendScrollBar:=TLegendScrollBar.Create(self);

  with LegendScrollBar do
  begin
    ParentChart:=Chart1;
    Thumb.Style:=stsThumb3;
    Thumb.Size:=25;
  end;

  Chart1.Tools.Add(LegendScrollBar);
  CBStyle.ItemIndex:=3;
end;

procedure TToolLegendScrollBarThumb.bEditClick(Sender: TObject);
begin
  EditChartTool(Self, LegendScrollBar);
end;

procedure TToolLegendScrollBarThumb.CBStyleChange(Sender: TObject);
begin
  LegendScrollBar.Thumb.Style:=TScrollThumbStyle(CBStyle.ItemIndex);
end;

procedure TToolLegendScrollBarThumb.BBrowseClick(Sender: TObject);
begin
  LegendScrollBar.Thumb.Image:=nil;
  TeeLoadClearImage(Self,LegendScrollBar.Thumb.Image);
end;

procedure TToolLegendScrollBarThumb.Edit3Change(Sender: TObject);
begin
  LegendScrollBar.ThumbSize:=UDThumbSize.Position;
end;

initialization
  RegisterClass(TToolLegendScrollBarThumb);
end.

