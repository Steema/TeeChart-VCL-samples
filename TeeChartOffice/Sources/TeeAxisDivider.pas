{********************************************}
{   TeeChart Axis Divider Tool               }
{ Copyright (c) 2001-2019 by Steema Software }
{        All Rights Reserved                 }
{********************************************}
unit TeeAxisDivider;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  {$ENDIF}
  TeeColorLineEditor, TeCanvas, TeePenDlg, TeEngine, TeeTools, ComCtrls,
  ExtCtrls;

type
  TAxisDividerTool=class(TColorLineTool)
  private
    FAxis2: TChartAxis;

    procedure ReadAxis2(Reader: TReader);
    procedure SetAxis2(const Value: TChartAxis);
    procedure WriteAxis2(Writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoEndDragLine; override;
    class Function GetEditorClass:String; override;
  public
    Constructor Create(AOwner:TComponent); override;

    class Function Description:String; override;
  published
    property Axis2:TChartAxis read FAxis2 write SetAxis2 stored False;
  end;

  TAxisDividerEditor = class(TColorLineToolEditor)
    CBAxis2: TComboFlat;
    Label4: TLabel;
    procedure CBAxisChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBAxis2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure AddAxes2;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeConst, Chart, TeeChartOfficeConstants;

{ TAxisDividerTool }

Constructor TAxisDividerTool.Create(AOwner: TComponent);
begin
  inherited;
  NoLimitDrag:=True;

  // Allow dragging the divider line outside the axis min max
  ShowOutsideAxis:=True;
end;

procedure TAxisDividerTool.ReadAxis2(Reader: TReader);
begin
  Axis2:=ParentChart.Axes[Reader.ReadInteger];
end;

procedure TAxisDividerTool.SetAxis2(const Value: TChartAxis);
begin
  if FAxis2<>Value then
  begin
    FAxis2:=Value;

    // First time setup of Axis and Axis2, reset divider line to 50% (middle position)
    if not (csLoading in ComponentState) then
    if Assigned(Axis) and Assigned(FAxis2) then
       if (FAxis2.StartPosition=Axis.StartPosition) and (FAxis2.EndPosition=Axis.EndPosition) then
       begin
         Axis.EndPosition:=50;
         Axis2.StartPosition:=50;
       end;

    Repaint;
  end;
end;

procedure TAxisDividerTool.WriteAxis2(Writer: TWriter);
begin
  Writer.WriteInteger(ParentChart.Axes.IndexOf(Axis2));
end;

class function TAxisDividerTool.GetEditorClass: String;
begin
  result:='TAxisDividerEditor';
end;

class function TAxisDividerTool.Description: String;
begin
  result:=TeeMsg_AxisDivider;
end;

procedure TAxisDividerTool.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Axis2ID',ReadAxis2,WriteAxis2,Assigned(Axis2));
end;

procedure TAxisDividerTool.DoEndDragLine;

  function PercentPosition:Double;
  var tmp : Double;
      tmpSize,
      tmpPos : Integer;
  begin
    tmp:=Axis.Maximum-Axis.Minimum;

    if tmp=0 then
       result:=0
    else
    begin
      tmpPos:=Axis.CalcPosValue(Value);

      // Pending: Test with Axis or Axis2 "Inverted"
      
      if Axis.Horizontal then
      begin
        tmpSize:=ParentChart.ChartWidth;
        result:=(tmpPos-ParentChart.ChartRect.Left)*100.0/tmpSize;
      end
      else
      begin
        tmpSize:=ParentChart.ChartHeight;
        result:=(tmpPos-ParentChart.ChartRect.Top)*100.0/tmpSize;
      end;

      // Restrict to 0..100 range:
      if result<0 then
         result:=0
      else
      if result>100 then
         result:=100;
    end;
  end;

begin
  if Assigned(Axis) and Assigned(Axis2) then
  begin
    if Axis.StartPosition<=Axis2.StartPosition then
    begin
      Axis2.StartPosition:=PercentPosition;
      Axis.EndPosition:=Axis2.StartPosition;
      Value:=Axis.Minimum;
    end
    else
    begin
      Axis.StartPosition:=PercentPosition;
      Axis2.EndPosition:=Axis.StartPosition;
      Value:=Axis.Maximum;
    end;
  end;

  inherited;
end;

{ TAxisDividerEditor }

procedure TAxisDividerEditor.AddAxes2;

  Procedure AddAxis(const St:String; const AAxis:TChartAxis);
  begin
    if AAxis<>GetAxis then
       CBAxis2.Items.AddObject(St,AAxis);
  end;

var t : Integer;
begin
  CBAxis2.Items.Clear;

  if GetAxis<>nil then
  begin
    if GetAxis.Horizontal then
    begin
      AddAxis(TeeMsg_TopAxis,AxisTool.ParentChart.TopAxis);
      AddAxis(TeeMsg_BottomAxis,AxisTool.ParentChart.BottomAxis);
    end
    else
    begin
      AddAxis(TeeMsg_LeftAxis,AxisTool.ParentChart.LeftAxis);
      AddAxis(TeeMsg_RightAxis,AxisTool.ParentChart.RightAxis);
    end;

    with AxisTool.ParentChart.CustomAxes do
    for t:=0 to Count-1 do
    if Items[t].Horizontal=Self.GetAxis.Horizontal then
       AddAxis(TeeMsg_CustomAxesEditor+IntToStr(t),Items[t]);
  end;
end;

procedure TAxisDividerEditor.CBAxisChange(Sender: TObject);
begin
  inherited;
  AddAxes2;
end;

procedure TAxisDividerEditor.FormShow(Sender: TObject);
begin
  inherited;
  CBNoLimitDrag.Visible:=False;

  AddAxes2;

  { find axis2 }
  with TAxisDividerTool(AxisTool) do
  if Assigned(Axis) and Assigned(Axis2) then
     with CBAxis2 do ItemIndex:=Items.IndexOfObject(Axis2)
  else
     CBAxis2.ItemIndex:=-1;
end;

procedure TAxisDividerEditor.CBAxis2Change(Sender: TObject);
begin
  inherited;
  TAxisDividerTool(AxisTool).Axis2:=TChartAxis(CBAxis2.Items.Objects[CBAxis2.ItemIndex]);
end;

procedure TAxisDividerEditor.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=TabValue;
end;

initialization
  RegisterClass(TAxisDividerEditor);
  RegisterTeeTools([TAxisDividerTool]);
finalization
  UnRegisterTeeTools([TAxisDividerTool]);
end.
