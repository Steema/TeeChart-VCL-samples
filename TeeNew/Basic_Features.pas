unit Basic_Features;
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
  TeeProcs, TeEngine, Chart, TeeEdit, TeeGDIPlus;

type
  TBasicFeatures = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Memo2: TMemo;
    MyChart: TChart;
    Button2: TButton;
    ChartEditor1: TChartEditor;
    Splitter1: TSplitter;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

Uses Series;

procedure TBasicFeatures.Button2Click(Sender: TObject);
begin
  MyChart.FreeAllSeries;

  MyChart.AddSeries( TBarSeries.Create( Self ));

  MyChart[0].Clear;
  MyChart[0].Add( 123, 'ABC', clSkyBlue );
  MyChart[0].Add( 456, 'DEF', TColor($68CFFF) );
  MyChart[0].Add( 321, 'GHI', TColor($477FFF) );

  MyChart[0].Marks.Style:= smsValue;
end;

procedure TBasicFeatures.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute
end;

initialization
  RegisterClass(TBasicFeatures);
end.
