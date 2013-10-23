unit Axis_LabelAlign;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TAxisLabelAlignForm = class(TBaseForm)
    Series1: THorizBarSeries;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAxisLabelAlignForm.RadioGroup1Click(Sender: TObject);
begin
  { switch between the Left and Right axis }
  if RadioGroup1.ItemIndex=0 then Series1.VertAxis:=aLeftAxis
                             else Series1.VertAxis:=aRightAxis;
  CheckBox1Click(Self);
end;

procedure TAxisLabelAlignForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     Series1.GetVertAxis.LabelsAlign:=alOpposite
  else
     Series1.GetVertAxis.LabelsAlign:=alDefault;
end;

procedure TAxisLabelAlignForm.FormCreate(Sender: TObject);
begin
  inherited;

  { Sample values }
  Series1.Add( 278, 'Africa');
  Series1.Add( 123, 'America');
  Series1.Add( 321, 'Asia');
  Series1.Add( 432, 'Australia');
  Series1.Add(  89, 'Europe');
  Series1.Add( 300, 'Moon');

  Series1.Marks.Style:=smsPercent;  { show % values }

  { Set axes labels to "opposite" alignment }
  Chart1.LeftAxis.LabelsAlign:=alOpposite;
  Chart1.RightAxis.LabelsAlign:=alOpposite;
end;

procedure TAxisLabelAlignForm.FormShow(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=0;
end;

initialization
  RegisterClass( TAxisLabelAlignForm );
end.
