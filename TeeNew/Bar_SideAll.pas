unit Bar_SideAll;
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
  TBarSideAll = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TBarSideAll.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0: Series1.MultiBar := mbSideAll;
    1: Series1.MultiBar := mbSide;
  end;
end;

procedure TBarSideAll.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
  Series2.FillSampleValues(5);
end;

initialization
  RegisterClass(TBarSideAll);
end.
