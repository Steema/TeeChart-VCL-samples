unit DBChart_Agg;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  {$ENDIF}
  SysUtils, Classes;

type
  TDBChartAgg = class(TForm)
    Memo1: TMemo;
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

initialization
  RegisterClass(TDBChartAgg);
end.
