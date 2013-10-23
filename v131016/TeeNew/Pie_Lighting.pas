unit Pie_Lighting;
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
  {$IFDEF CLR}
  Types,
  {$ENDIF}

  {$IFNDEF CLX}
  TeeGDIPlus,
  {$ENDIF}

  Base, TeEngine, Series, TeeDonut, TeeProcs, Chart, TeCanvas;

type
  TPieLightingForm = class(TBaseForm)
    Series1: TPieSeries;
    ETransparency: TEdit;
    LTransparency: TLabel;
    UDTransparency: TUpDown;
    EBevelPercent: TEdit;
    UDBevelPercent: TUpDown;
    LBevelPercent: TLabel;
    CBEdgeStyle: TComboBox;
    LEdgeStyle: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ETransparencyChange(Sender: TObject);
    procedure EBevelPercentChange(Sender: TObject);
    procedure CBEdgeStyleChange(Sender: TObject);
    procedure Chart1DblClick(Sender: TObject);
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

uses TeeEdiGrad;

procedure TPieLightingForm.CBEdgeStyleChange(Sender: TObject);
begin
   if CBEdgeStyle.ItemIndex=0 then
     Series1.EdgeStyle:=edNone
  else
  if CBEdgeStyle.ItemIndex=1 then
     Series1.EdgeStyle:=edFlat
  else
     Series1.EdgeStyle:=edCurved;
end;

procedure TPieLightingForm.Chart1DblClick(Sender: TObject);
begin
  Series1.FillSampleValues();
end;

procedure TPieLightingForm.EBevelPercentChange(Sender: TObject);
begin
  if Showing and Assigned(Series1) then
  begin
    Series1.BevelPercent:=UDBevelPercent.Position;

    {$IFNDEF CLX}
    if Series1.ParentChart.Canvas is TGDIPlusCanvas then
       EnableControls(UDBevelPercent.Position > 0,[LEdgeStyle,CBEdgeStyle]);
    {$ENDIF}
  end;
end;

procedure TPieLightingForm.ETransparencyChange(Sender: TObject);
begin
  if Showing and Assigned(Series1) then
     Series1.Transparency:=UDTransparency.Position;
end;

procedure TPieLightingForm.FormCreate(Sender: TObject);
begin
  inherited;

  with Series1 do
  begin
    FillSampleValues;
    ExplodeBiggest:=10;
    BevelPercent:=15;
    Series1.EdgeStyle:=edFlat;

    UDTransparency.Position:=Transparency;
    UDBevelPercent.Position:=BevelPercent;

    case EdgeStyle of
      edFlat: CBEdgeStyle.ItemIndex:=1;
      edCurved: CBEdgeStyle.ItemIndex:=2;
      edNone: CBEdgeStyle.ItemIndex:=0;
    end;

    EnableControls(ParentChart.View3D,[LTransparency,UDTransparency, ETransparency]);
    EnableControls(ParentChart.View3D,[LBevelPercent,UDBevelPercent, EBevelPercent]);

    {$IFNDEF CLX}
    EnableControls(ParentChart.Canvas is TGDIPlusCanvas,[LEdgeStyle,CBEdgeStyle]);
    {$ENDIF}
    
    if CBEdgeStyle.Enabled then
       EnableControls(UDBevelPercent.Position > 0,[LEdgeStyle,CBEdgeStyle]);
  end;
end;

initialization
  RegisterClass(TPieLightingForm);
end.
