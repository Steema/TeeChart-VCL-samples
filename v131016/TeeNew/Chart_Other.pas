unit Chart_Other;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, 
  {$ENDIF}
  SysUtils, Classes;

type
  TChartOther = class(TForm)
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
  RegisterClass(TChartOther);
end.
