unit Function_Momentum;
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
  Base, TeCanvas, TeEngine, StatChar, Series, TeeProcs, Chart;

type
  TMomentumForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TMomentumFunction;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TMomentumForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(30);
end;

procedure TMomentumForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
end;

initialization
  RegisterClass(TMomentumForm);
end.
