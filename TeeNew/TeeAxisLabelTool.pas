unit TeeAxisLabelTool;
{$I TeeDefs.inc}

interface

Uses
  Classes, SysUtils,
  TeeProcs, TeEngine, Chart, TeeTools;

{
  TAxisLabelTool

  Example of a Custom Chart Tool class.

  This custom tool is used to change Axis labels.

  If axis labels are bigger than 1000, the tool
  appends "K" (thousands) to the label.

  If the label is bigger than 100000, then it shows
  "M" (millions).

  Example: 2000 is displayed as "2K"
           4000000 is displayed as "4M".

  This simple tool is useful to reduce the space used by
  big axis label values.
}

type
  TAxisLabelTool=class(TTeeCustomToolAxis)
  private

    FMillion: String;
    FThousand: String;
    procedure SetMillion(const Value: String);
    procedure SetThousand(const Value: String);
  protected
    procedure SetParentChart(const Value: TCustomAxisPanel); override;
    Procedure OnGetLabel( Sender:TChartAxis; Series:TChartSeries;
               ValueIndex:Integer; Var LabelText:String);
  public
    Constructor Create(AOwner:TComponent); override;

    class Function Description:String; override;
    class Function LongDescription:String; override;
  published
    property MillionText:String read FMillion write SetMillion;
    property ThousandText:String read FThousand write SetThousand;
  end;

implementation

// Here it comes the tool code...

{ TAxisLabelTool }

Constructor TAxisLabelTool.Create(AOwner: TComponent);
begin
  inherited;
  FMillion:='M';
  FThousand:='K';
end;

class function TAxisLabelTool.Description: String;
begin
  result:='Axis Label';
end;

class function TAxisLabelTool.LongDescription: String;
begin
  result:='Sample custom tool: Appends "M" and "K" suffixes to Axis labels of big quantities.';
end;

procedure TAxisLabelTool.OnGetLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var tmp : Double;
    tmpSt : String;
begin
  if Active and Assigned(Axis) and (Sender=Axis) then
  begin
    tmpSt:=LabelText;

    While Pos({$IFDEF D15}FormatSettings.{$ENDIF}ThousandSeparator,tmpSt)>0 do
          Delete(tmpSt,Pos({$IFDEF D15}FormatSettings.{$ENDIF}ThousandSeparator,tmpSt),1);

    tmp:=StrToFloatDef(tmpSt,0);

    if Abs(tmp)>=100000 then
       LabelText:=FormatFloat('0.#',tmp/1000000)+MillionText
    else
    if Abs(tmp)>=1000 then
       LabelText:=FormatFloat('0.#',tmp/1000)+ThousandText;
  end;
end;

procedure TAxisLabelTool.SetMillion(const Value: String);
begin
  SetStringProperty(FMillion,Value);
end;

procedure TAxisLabelTool.SetParentChart(const Value: TCustomAxisPanel);
begin
  inherited;
  if Assigned(ParentChart) then
     ParentChart.OnGetAxisLabel:=OnGetLabel;
end;

procedure TAxisLabelTool.SetThousand(const Value: String);
begin
  SetStringProperty(FThousand,Value);
end;

// "Register" the custom tool to show it at the editor tools gallery
// both at design-time and run-time:

initialization
  RegisterTeeTools([TAxisLabelTool]);
finalization
  UnRegisterTeeTools([TAxisLabelTool]);
end.
