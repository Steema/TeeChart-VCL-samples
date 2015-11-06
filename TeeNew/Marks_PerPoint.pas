unit Marks_PerPoint;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QComCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TMarksPerPoint = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Button1: TButton;
    Button2: TButton;
    Series1: TPieSeries;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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

uses TeeCustomShapeEditor;

procedure TMarksPerPoint.Button2Click(Sender: TObject);
begin
  // Remove custom marks (set all to default)
  Series1.Marks.Clear;
end;

procedure TMarksPerPoint.Button1Click(Sender: TObject);
begin
  EditTeeCustomShape(Self,Series1.Marks[UpDown1.Position]);
end;

procedure TMarksPerPoint.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;

  // customize mark...
  with Series1.Marks[3] do
  begin
    Font.Size:=14;
    Color:=clSilver;
  end;

  // customize another mark...
  with Series1.Marks[5] do
  begin
    Font.Size:=12;
    Font.Color:=clWhite;
    Color:=clNavy;
    ShapeStyle:=fosRoundRectangle;
    Shadow.Size:=4;
    Shadow.Transparency:=60;
    Shadow.Color:=clDkGray;
  end;

  // customize mark text
  Series1.Marks[1].Text.Clear;
  Series1.Marks[1].Text.Add('Nice');
  Series1.Marks[1].Text.Add('Article');

  UpDown1.Max:=Series1.Count-1;

  Edit1Change(Self);
end;

procedure TMarksPerPoint.Edit1Change(Sender: TObject);
begin
  Edit2.Text:=Series1.ValueMarkText[UpDown1.Position];
end;

procedure TMarksPerPoint.Edit2Change(Sender: TObject);
begin
  Series1.Marks[UpDown1.Position].Text.Text:=Edit2.Text;
end;

initialization
  RegisterClass(TMarksPerPoint);
end.
