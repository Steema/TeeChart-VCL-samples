unit Base_DBChart;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls, DB,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBTables,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, DBChart, Series;

type
  TBaseDBChart = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    DBChart1: TDBChart;
    BaseSplitter1: TSplitter;
    procedure Memo1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  {$IFDEF CLX}
  TTable=TDataSet;
  {$ENDIF}

procedure CheckTable(ATable:TTable);

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar, DBEditCh;  { to show Database DBChart editor dialogs }

procedure CheckTable(ATable:TTable);
var tmp : TStringList;
begin
  tmp:=TStringList.Create;
  try
    {$IFNDEF CLX}
    Session.GetAliasNames(tmp);
    if tmp.IndexOf(ATable.DatabaseName)=-1 then
    begin
      if tmp.IndexOf('BCDEMOS')=-1 then
         Raise Exception.Create('Database BDE Alias "BCDEMOS" cannot be found.');
      ATable.DatabaseName:='BCDEMOS';
    end;
    {$ENDIF}
  finally
    tmp.Free;
  end;
end;

procedure TBaseDBChart.Memo1DblClick(Sender: TObject);
begin
  EditChart(Self,DBChart1);
end;

end.
