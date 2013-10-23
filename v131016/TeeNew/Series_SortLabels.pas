unit Series_SortLabels;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeCanvas, TeeProcs, TeEngine, Chart, Series;

type
  TSeriesSortLabel = class(TBaseForm)
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    Series1: TBarSeries;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSeriesSortLabel.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Add( 323, 'John' );
  Series1.Add( 222, 'Anne' );
  Series1.Add( 456, 'Matt' );
  Series1.Add( 188, 'Sean' );
  Series1.Add( 701, 'Andrew' );
  Series1.Add( 411, 'Marc' );
end;

procedure TSeriesSortLabel.ComboFlat1Change(Sender: TObject);
begin
  if ComboFlat1.ItemIndex=0 then
  begin
    Series1.SortByLabels(loAscending);
    Label2.Caption:='Data is sorted by text (ascending)';
  end
  else
  begin
    Series1.SortByLabels(loDescending);
    Label2.Caption:='Data is sorted by text (descending)';
  end;
end;

initialization
  RegisterClass(TSeriesSortLabel);
end.
