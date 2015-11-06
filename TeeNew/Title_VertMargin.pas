unit Title_VertMargin;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TTitleVertMargin = class(TBaseForm)
    Label3: TLabel;
    Edit1: TEdit;
    UDMargin: TUpDown;
    Series1: TLineSeries;
    Series2: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TTitleVertMargin.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.Title.VertMargin:=10;
end;

procedure TTitleVertMargin.Edit1Change(Sender: TObject);
begin
  Chart1.Title.VertMargin:=UDMargin.Position;
end;

initialization
  RegisterClass(TTitleVertMargin);
end.
