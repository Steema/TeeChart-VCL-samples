unit Inspector_Demo;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Grids,
  {$ENDIF}
  Base, TeeEdit, TeeProcs, TeEngine, Chart, Series, TeeInspector,
  TeeGDIPlus;

type
  TInspectorForm = class(TBaseForm)
    TeeInspector1: TTeeInspector;
    Splitter1: TSplitter;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure TeeInspector1Items0Change(Sender: TObject);
    procedure TeeInspector1Items1Change(Sender: TObject);
    procedure TeeInspector1Items2Change(Sender: TObject);
    procedure TeeInspector1Items3Change(Sender: TObject);
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

Uses EditChar;

procedure TInspectorForm.FormCreate(Sender: TObject);
begin
  inherited;

  // Initialize inspector values:
  TeeInspector1.Items[0].Value:=Chart1.Color;
  TeeInspector1.Items[1].Value:=Chart1.Title.Font.Size;
  TeeInspector1.Items[2].Value:=Chart1.Title.Visible;
  TeeInspector1.Items[4].Data:=Chart1.Gradient;
end;

procedure TInspectorForm.TeeInspector1Items0Change(Sender: TObject);
begin
  Chart1.Color:=TeeInspector1.Items[0].Value;
end;

procedure TInspectorForm.TeeInspector1Items1Change(Sender: TObject);
begin
  Chart1.Title.Font.Size:=TeeInspector1.Items[1].Value;
end;

procedure TInspectorForm.TeeInspector1Items2Change(Sender: TObject);
begin
  Chart1.Title.Visible:=TeeInspector1.Items[2].Value;
end;

procedure TInspectorForm.TeeInspector1Items3Change(Sender: TObject);
begin
  EditChart(Self,Chart1);
end;

procedure TInspectorForm.CheckBox1Click(Sender: TObject);
begin
  TeeInspector1.Header.Visible:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TInspectorForm);
end.
