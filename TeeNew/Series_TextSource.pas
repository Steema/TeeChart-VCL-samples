unit Series_TextSource;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeURL, TeeProcs, Chart, TeeSeriesTextEd;

type
  TSeriesTextSourceForm = class(TBaseForm)
    SeriesTextSource1: TSeriesTextSource;
    Series1: TBarSeries;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure UpdateMemo;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeStore, TeeConst;

procedure TSeriesTextSourceForm.Button1Click(Sender: TObject);
begin
  Series1.Clear;
  SeriesTextSource1.LoadFromStrings(Memo2.Lines);
end;

procedure TSeriesTextSourceForm.Button2Click(Sender: TObject);
begin
  Series1.Clear;
  Screen.Cursor:=crHourGlass;
  try
    With SeriesTextSource1 do
    begin
      { now set the SeriesTextSource properties }
      HeaderLines:=2;
      FieldSeparator:=',';
      Fields.Clear;
      AddField('X',1);
      AddField('Bar',2);
      AddField(TeeMsg_Text,3);

      { get points from the web... }
      LoadFromURL(Edit1.Text);

      { now set the SeriesTextSource properties }
      { to match the retrieved file... }
      HeaderLines:=0;
      FieldSeparator:=#9; { tab }
      Fields.Clear;
      AddField(TeeMsg_Text,1);
      AddField('X',2);
      AddField('Bar',3);
    end;
    { change the Memo contents with the Web file }
    UpdateMemo;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

Procedure TSeriesTextSourceForm.UpdateMemo;
begin
  { TSeriesDataText object is used to export Series }
  { values to Text }
  With TSeriesDataText.Create(Chart1,Series1) do
  try
    Memo2.Lines.Text:=AsString;
  finally
    Free;
  end;
end;

procedure TSeriesTextSourceForm.FormCreate(Sender: TObject);
begin
  inherited;
  Memo2.WordWrap:=False;
end;

initialization
  RegisterClass(TSeriesTextSourceForm);
end.
