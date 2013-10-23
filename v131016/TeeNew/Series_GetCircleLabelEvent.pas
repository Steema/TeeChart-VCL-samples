unit Series_GetCircleLabelEvent;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeePolar;

type
  TSeriesGetCircleLabelEvent = class(TBaseForm)
    Series1: TPolarBarSeries;
    Label1: TLabel;
    editText: TEdit;
    Button1: TButton;
    procedure Series1GetCircleLabel(Sender: TCustomPolarSeries;
      const Angle: Double; Index: Integer; var Text: String);
    procedure Button1Click(Sender: TObject);
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

procedure TSeriesGetCircleLabelEvent.Series1GetCircleLabel(
  Sender: TCustomPolarSeries; const Angle: Double; Index: Integer;
  var Text: String);
begin
  Text:=Text + EditText.Text;
end;

procedure TSeriesGetCircleLabelEvent.Button1Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TSeriesGetCircleLabelEvent);
end.
