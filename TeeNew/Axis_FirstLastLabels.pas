unit Axis_FirstLastLabels;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus;

type
  TFirstLastLabels = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure BottomAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                  var Text:String; var DrawLabel:Boolean);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

procedure TFirstLastLabels.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Clear;
  Series1.Add( 123, 'First');
  Series1.Add( 456, 'Second');
  Series1.Add( 321, 'Third');
  Series1.Add( 234, 'Last');

  Chart1.Axes.Bottom.OnDrawLabel:= BottomAxisDrawLabel;
end;

procedure TFirstLastLabels.BottomAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                               var Text:String;
                                               var DrawLabel:Boolean);
begin

  if CheckBox1.Checked then
  begin
    // With bottom axis do:
    with Sender do
    if Abs(X-CalcPosValue(Minimum)) < 20 then  // first label
    begin
      with ParentChart.Canvas do
        TextAlign:= TA_RIGHT; /// align to right
    end
    else
    if Abs(X-CalcPosValue(Maximum)) < 20 then  // last label
    begin
      with ParentChart.Canvas do
        TextAlign:= TA_LEFT; // align to left
    end;
  end;

  //alternatively, use Axis Item list. Can set Automatic False once the values have been set.
  //Chart1.Axes.Bottom.Items.Automatic := False;
  //Chart1.Axes.Bottom.Items[0].Format.Alignment := taRightJustify;
  //Chart1.Axes.Bottom.Items[0].Format.Font.Style := [fsBold];

end;

procedure TFirstLastLabels.CheckBox1Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFirstLastLabels);
end.
