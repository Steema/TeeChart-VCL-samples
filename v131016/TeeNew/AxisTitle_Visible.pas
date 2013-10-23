unit AxisTitle_Visible;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TAxisTitleVisible = class(TBaseForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    Series1: TPointSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TAxisTitleVisible.CheckBox1Click(Sender: TObject);
begin
  Chart1.LeftAxis.Title.Visible:=CheckBox1.Checked
end;

procedure TAxisTitleVisible.Edit1Change(Sender: TObject);
begin
  Chart1.LeftAxis.Title.Caption:=Edit1.Text
end;

procedure TAxisTitleVisible.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(15);
  Edit1.Text:=Chart1.LeftAxis.Title.Caption;
end;

initialization
  RegisterClass(TAxisTitleVisible);
end.
