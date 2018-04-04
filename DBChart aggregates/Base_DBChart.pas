unit Base_DBChart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls, StdCtrls, DB, DBTables;

type
  TBaseDBChart = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    DBChart1: TDBChart;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckTable(ATable: TTable);

implementation

{$R *.DFM}

procedure CheckTable(ATable: TTable);
var tmp : TStringList;
begin
  tmp:=TStringList.Create;
  try
    Session.GetAliasNames(tmp);
    if tmp.IndexOf(ATable.DatabaseName)=-1 then
    begin
      if tmp.IndexOf('BCDEMOS')=-1 then
         Raise Exception.Create('Database BDE Alias "BCDEMOS" cannot be found.');
      ATable.DatabaseName:='BCDEMOS';
    end;
  finally
    tmp.Free;
  end;
end;

end.
