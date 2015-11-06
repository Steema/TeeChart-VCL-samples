unit Tool_SeriesRegion_OriginPen;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeSeriesRegion,
  TeCanvas, TeeGDIPlus, TeePenDlg;


type
  TSeriesRegionToolOriginPenForm = class(TBaseForm)
    cbStairs: TCheckBox;
    cbUseOrigin: TCheckBox;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Series1: TLineSeries;
    BPen: TButtonPen;
    BOrigin: TButtonPen;
    procedure FormCreate(Sender: TObject);
    procedure cbUseOriginClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure cbStairsClick(Sender: TObject);
  private
    { Private declarations }
    SeriesRegion : TSeriesRegionTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TSeriesRegionToolOriginPenForm.FormCreate(Sender: TObject);
begin
  inherited;

  SeriesRegion:=TSeriesRegionTool.Create(Self);

  with SeriesRegion do
  begin
    ParentChart:=Chart1;
    Series:=Chart1[0];

    AutoBounds:=True;

    UseOrigin:=cbUseOrigin.Checked;
    Origin:=StrToFloat(Edit3.Text);
    OriginPen.Visible:=cbUseOrigin.Checked;

    Gradient.Visible:=true;

    BPen.LinkPen(Pen);
    BOrigin.LinkPen(OriginPen);

    Pen.Color:=clRed;
    Pen.Width:=4;
    OriginPen.Color:=clLime;
    OriginPen.Width:=2;
  end;
end;

procedure TSeriesRegionToolOriginPenForm.cbUseOriginClick(Sender: TObject);
begin
  Edit3.Enabled:=cbUseOrigin.Checked;
  UpDown3.Enabled:=cbUseOrigin.Checked;

  SeriesRegion.UseOrigin := cbUseOrigin.Checked;
  SeriesRegion.OriginPen.Visible := cbUseOrigin.Checked;
  if SeriesRegion.UseOrigin then
    SeriesRegion.Origin:=StrToFloat(Edit3.Text);
end;

procedure TSeriesRegionToolOriginPenForm.Edit3Change(Sender: TObject);
begin
  if Assigned(SeriesRegion) then
     SeriesRegion.Origin:=StrToFloat(Edit3.Text);
end;

procedure TSeriesRegionToolOriginPenForm.cbStairsClick(Sender: TObject);
begin
  inherited;
  Series1.Stairs:=cbStairs.Checked;
end;

initialization
  RegisterClass(TSeriesRegionToolOriginPenForm);
end.
