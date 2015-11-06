unit Series_LabelsBinding;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, TeEngine, Series, TeeProcs, Chart, ExtCtrls, StdCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Data.Bind.Components, Data.DB, Datasnap.DBClient, Data.Bind.DBScope;

type
  TSeriesLabelsBinding = class(TBaseForm)
    Series1: TAreaSeries;
    BindScopeDB1: TBindScopeDB;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    BindingsList1: TBindingsList;
    BindList1: TBindList;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TSeriesLabelsBinding.CheckBox1Click(Sender: TObject);
begin
  ClientDataSet1.Active:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TSeriesLabelsBinding);
end.
