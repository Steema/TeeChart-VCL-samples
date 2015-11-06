unit Marks_Angle;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TMarksAngle = class(TBaseForm)
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TAreaSeries;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TMarksAngle.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
end;

procedure TMarksAngle.Edit1Change(Sender: TObject);
begin
  Series1.Marks.Angle:=UpDown1.Position
end;

procedure TMarksAngle.Button1Click(Sender: TObject);
begin
  UpDown1.Position:=0;
end;

procedure TMarksAngle.Button2Click(Sender: TObject);
begin
  UpDown1.Position:=90;
end;

initialization
  RegisterClass(TMarksAngle);
end.

