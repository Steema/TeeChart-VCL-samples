unit Volume_Origin;
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
  Base, TeCanvas, TeEngine, Series, CandleCh, TeeProcs, Chart, TeeGDIPlus;

type
  TVolumeOrigin = class(TBaseForm)
    Series1: TVolumeSeries;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TVolumeOrigin.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(50);
end;

procedure TVolumeOrigin.Edit1Change(Sender: TObject);
begin
  Series1.YOrigin:=UpDown1.Position;
end;

procedure TVolumeOrigin.CheckBox1Click(Sender: TObject);
begin
  Series1.UseYOrigin:=CheckBox1.Checked;
  Edit1.Enabled:=CheckBox1.Checked;
  UpDown1.Enabled:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TVolumeOrigin);
end.
