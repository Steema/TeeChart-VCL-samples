unit Tool_SeriesRegion;
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
  TeCanvas;


type
  TSeriesRegionToolForm = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    cbDrawBehind: TCheckBox;
    cbUseOrigin: TCheckBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Series1: TLineSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure cbDrawBehindClick(Sender: TObject);
    procedure cbUseOriginClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TSeriesRegionToolForm.FormCreate(Sender: TObject);
begin
  inherited;

  SeriesRegion:=TSeriesRegionTool.Create(Self);

  with SeriesRegion do
  begin
    ParentChart:=Chart1;
    Series:=Chart1[0];

    AutoBounds:=False;
    LowerBound:=strtofloat(Edit1.Text);
    UpperBound:=strtofloat(Edit2.Text);

    DrawBehindSeries:=cbDrawBehind.Checked;

    UseOrigin:=cbUseOrigin.Checked;
    Origin:=StrToFloat(Edit3.Text);

    Gradient.Visible:=true;
  end;
end;

procedure TSeriesRegionToolForm.Edit1Change(Sender: TObject);
begin
  SeriesRegion.LowerBound:=strtoFloat(edit1.Text);
end;

procedure TSeriesRegionToolForm.Edit2Change(Sender: TObject);
begin
  SeriesRegion.UpperBound:=strtofloat(Edit2.Text);
end;

procedure TSeriesRegionToolForm.cbDrawBehindClick(Sender: TObject);
begin
  SeriesRegion.DrawBehindSeries:=cbDrawBehind.Checked;
end;

procedure TSeriesRegionToolForm.cbUseOriginClick(Sender: TObject);
begin
  Edit3.Enabled:=cbUseOrigin.Checked;
  UpDown3.Enabled:=cbUseOrigin.Checked;

  SeriesRegion.Origin:=StrToFloat(Edit3.Text);
end;

procedure TSeriesRegionToolForm.Edit3Change(Sender: TObject);
begin
  if Assigned(SeriesRegion) then
     SeriesRegion.Origin:=StrToFloat(Edit3.Text);
end;

procedure TSeriesRegionToolForm.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,SeriesRegion);
end;

initialization
  RegisterClass(TSeriesRegionToolForm);
end.
