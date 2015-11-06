unit Series_HorizHisto;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Base, TeEngine, Series, StatChar, TeeProcs, Chart;

type
  THorizHistoForm = class(TBaseForm)
    Series1: THorizHistogramSeries;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses EditChar;

procedure THorizHistoForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(THorizHistoForm);
end.
