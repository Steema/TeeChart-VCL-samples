unit Series_Designer;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QMenus,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Menus,
  {$ENDIF}
  SysUtils, Classes;

type
  TSeriesDesigner = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
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
  RegisterClass(TSeriesDesigner);
end.
