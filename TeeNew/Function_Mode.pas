unit Function_Mode;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, 
  Base, TeEngine, Series, TeeProcs, Chart, TeeFunci, TeeGDIPlus;

type
  TModeFunctionDemo = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Series1: TFastLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TModeTeeFunction;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TModeFunctionDemo.CheckBox2Click(Sender: TObject);
begin
  If CheckBox2.Checked then
    Series1.TreatNulls:=tnDontPaint
  else
    Series1.TreatNulls:=tnIgnore;
end;

procedure TModeFunctionDemo.CheckBox1Click(Sender: TObject);
begin
  TeeFunction1.IncludeNulls:=CheckBox1.Checked;
end;

procedure TModeFunctionDemo.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Clear;

  // To show how Mode is calculated, lets add some values that are *repeated*

  Series1.AddArray([31,23,29,16,37,26,14,31,65,46,31,50,41,14,29]);

  // Set some null values for this example...

  Series1.SetNull(0);
  Series1.SetNull(2);
  Series1.SetNull(7);
  Series1.SetNull(9);
  Series1.SetNull(12);
  Series1.SetNull(14);

end;

initialization
  RegisterClass(TModeFunctionDemo);
end.
  
