unit Marks_Symbols;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TMarkSymbols = class(TBaseForm)
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses TeeEdiSeri;

procedure TMarkSymbols.CheckBox1Click(Sender: TObject);
begin
  Series1.Marks.Symbol.Visible:=CheckBox1.Checked;
end;

procedure TMarkSymbols.Button1Click(Sender: TObject);
begin
  with TFormTeeSeries.MarkSymbolsForm(Self, Series1.Marks.Symbol) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMarkSymbols.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TMarkSymbols);
end.
