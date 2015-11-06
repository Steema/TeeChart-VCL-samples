unit Series_Bar3D;
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
  Base, TeEngine, Series, Bar3D, TeeProcs, Chart;

type
  TBar3DForm = class(TBaseForm)
    Series1: TBar3DSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TBar3DForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
   0: Series1.BarStyle:=bsRectangle;
   1: Series1.BarStyle:=bsPyramid;
   2: Series1.BarStyle:=bsInvPyramid;
   3: Series1.BarStyle:=bsCylinder;
   4: Series1.BarStyle:=bsEllipse;
   5: Series1.BarStyle:=bsArrow;
   6: Series1.BarStyle:=bsRectGradient;
   7: Series1.BarStyle:=bsCone;
  end;
end;

procedure TBar3DForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Clear;
  Series1.AddBar( 0, 250, 200, 'A', clRed );
  Series1.AddBar( 1,  10, 200, 'B', clGreen );
  Series1.AddBar( 2,  90, 100, 'C', clYellow );
  Series1.AddBar( 3,  30,  50, 'D', clBlue );
  Series1.AddBar( 4,  70, 150, 'E', clWhite );
  Series1.AddBar( 5, 120, 150, 'F', clSilver );
end;

procedure TBar3DForm.Button1Click(Sender: TObject);
begin
  inherited;
  EditSeries(Self,Series1);
end;

procedure TBar3DForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=6;
end;

initialization
  RegisterClass(TBar3DForm);
end.
