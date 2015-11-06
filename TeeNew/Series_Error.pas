unit Series_Error;
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
  Base, TeEngine, Series, ErrorBar, TeeProcs, Chart;

type
  TErrorSeriesForm = class(TBaseForm)
    Series1: TErrorSeries;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ScrollBar1: TScrollBar;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
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

Uses EditChar;

procedure TErrorSeriesForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.ErrorStyle:=essLeft;
    1: Series1.ErrorStyle:=essTop;
    2: Series1.ErrorStyle:=essRight;
    3: Series1.ErrorStyle:=essBottom;
    4: Series1.ErrorStyle:=essLeftRight;
    5: Series1.ErrorStyle:=essTopBottom;
  end;
end;

procedure TErrorSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Clear;

  {            Index Value Error Label Color }
  Series1.AddErrorBar(0, 50, 10, 'A', clRed);
  Series1.AddErrorBar(1, 80, 20, 'B', clYellow);
  Series1.AddErrorBar(2, 20,  8, 'C', clGreen);
  Series1.AddErrorBar(3, 60, 30, 'D', clBlue);
  Series1.AddErrorBar(4, 40,  5, 'E', clWhite);
end;

procedure TErrorSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TErrorSeriesForm.ScrollBar1Change(Sender: TObject);
begin
  Series1.ErrorWidth:=ScrollBar1.Position;
end;

procedure TErrorSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=5;
end;

initialization
  RegisterClass(TErrorSeriesForm);
end.
