unit Series_LiveBindings;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, TeEngine, Series, TeeProcs, Chart, ExtCtrls, StdCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Data.DB, Datasnap.DBClient, Data.Bind.Components, Data.Bind.DBScope,
  VCLTee.TeCanvas;

type
  TSeriesLiveBindings = class(TBaseForm)
    Series1: TBarSeries;
    BindingsList1: TBindingsList;
    BindList1: TBindList;
    BindScopeDB1: TBindScopeDB;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TSeriesLiveBindings.CheckBox1Click(Sender: TObject);
begin
  ClientDataset1.Active:=CheckBox1.Checked;
end;

procedure TSeriesLiveBindings.ComboFlat1Change(Sender: TObject);
begin
  if ComboFlat1.ItemIndex=0 then
     BindList1.SourceMemberName:='WEIGHT'
  else
     BindList1.SourceMemberName:='SIZE';

  BindList1.FillList;
end;

initialization
  RegisterClass(TSeriesLiveBindings);
end.
