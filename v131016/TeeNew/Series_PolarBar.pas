unit Series_PolarBar;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  Base, TeeProcs, TeEngine, Chart, Series, TeePolar;

type
  TPolarBarForm = class(TBaseForm)
    Series1: TPolarBarSeries;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses EditChar;

procedure TPolarBarForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TPolarBarForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
end;

initialization
  RegisterClass(TPolarBarForm);
end.
