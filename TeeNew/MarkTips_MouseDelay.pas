unit MarkTips_MouseDelay;
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
  Base, TeCanvas, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TMarksTipMouseDelay = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    ChartTool1: TMarksTipTool;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TMarksTipMouseDelay.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(4);
  
  ChartTool1.MouseDelay:=500; { wait 500 milliseconds before display }
end;

procedure TMarksTipMouseDelay.Edit1Change(Sender: TObject);
begin
  ChartTool1.MouseDelay:=UpDown1.Position;
end;

procedure TMarksTipMouseDelay.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: ChartTool1.Series:=nil;  { all series ! }
    1: ChartTool1.Series:=Series1;
    2: ChartTool1.Series:=Series2;
    3: ChartTool1.Series:=Series3;
  end;
end;

procedure TMarksTipMouseDelay.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0; { all series }
end;

initialization
  RegisterClass(TMarksTipMouseDelay);
end.
