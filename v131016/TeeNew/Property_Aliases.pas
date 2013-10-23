unit Property_Aliases;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Grids,
  {$ENDIF}
  SysUtils, Classes;

type
  TPropertyAliases = class(TForm)
    Memo1: TMemo;
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

initialization
  RegisterClass(TPropertyAliases);
end.
