unit Chart_LiveBindings;
{$I TeeDefs.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Editors, Data.DB,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.DBLinks,
  VCLTee.Bind.DBLinks, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  Vcl.ExtCtrls, Vcl.StdCtrls, Datasnap.DBClient;

type
  TChartLiveBindings = class(TBaseForm)
    BindingsList1: TBindingsList;
    BindDBChartLinkChart11: TBindDBChartLink;
    BindScopeDB1: TBindScopeDB;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TChartLiveBindings.CheckBox1Click(Sender: TObject);
begin
  ClientDataSet1.Active:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TChartLiveBindings);
end.
