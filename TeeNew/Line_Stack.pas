unit Line_Stack;
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
  Base, Series, TeEngine, TeeProcs, Chart;

type
  TLineStack = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Series4: TLineSeries;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TLineStack.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.Stacked:=cssNone;
    1: Series1.Stacked:=cssOverlap;
    2: Series1.Stacked:=cssStack;
    3: Series1.Stacked:=cssStack100;
  end;
end;

procedure TLineStack.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(10);
end;

procedure TLineStack.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TLineStack);
end.
