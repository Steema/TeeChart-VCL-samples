unit Title_CustomPos;
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
  Base, TeeProcs, TeEngine, Chart, Base_CustomPos;

type
  TTitleCustomPos = class(TBaseCustomPos)
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
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

procedure TTitleCustomPos.CheckBox1Click(Sender: TObject);
begin
  Chart1.Title.CustomPosition:=CheckBox1.Checked;

  TrackBar1.Enabled:=CheckBox1.Checked;
  TrackBar2.Enabled:=CheckBox1.Checked;
end;

procedure TTitleCustomPos.FormCreate(Sender: TObject);
begin
  inherited;

  {
  These settings are saved at design-time into the Form DFM file,
  so no need to do it again at runtime.

  Chart1.Title.CustomPosition:=True;
  Chart1.Title.Left:=90;
  Chart1.Title.Top:=80;
  }

  TrackBar1.Position:=Chart1.Title.Left;
  TrackBar2.Position:=Chart1.Title.Top;
end;

procedure TTitleCustomPos.TrackBar1Change(Sender: TObject);
begin
  Chart1.Title.Left:=TrackBar1.Position
end;

procedure TTitleCustomPos.TrackBar2Change(Sender: TObject);
begin
  Chart1.Title.Top:=TrackBar2.Position
end;

initialization
  RegisterClass(TTitleCustomPos);
end.
