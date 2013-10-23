unit Function_Mode;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, 
  Base, TeEngine, Series, TeeProcs, Chart, TeeFunci;

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
    Series1.TreatNulls:=tnIgnore
  else
    Series1.TreatNulls:=tnDontPaint;
end;

procedure TModeFunctionDemo.CheckBox1Click(Sender: TObject);
begin
  TeeFunction1.IncludeNulls:=CheckBox1.Checked;
end;

procedure TModeFunctionDemo.FormCreate(Sender: TObject);
begin
  inherited;

  // Set some null values for this example...
  Series1.SetNull(11);
  Series1.SetNull(14);
  Series1.SetNull(3);
end;

initialization
  RegisterClass(TModeFunctionDemo);
end.
  
