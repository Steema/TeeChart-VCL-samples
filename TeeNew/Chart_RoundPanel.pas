unit Chart_RoundPanel;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeCanvas, TeePenDlg;

type
  TChartRoundPanel = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ButtonPen1: TButtonPen;
    CheckBox1: TCheckBox;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TChartRoundPanel.Edit1Change(Sender: TObject);
begin
  Chart1.BorderRound:=UpDown1.Position;
  CheckBox1.Enabled:=UpDown1.Position>0;
  if CheckBox1.Enabled then CheckBox1.Checked:=False;
end;

procedure TChartRoundPanel.FormCreate(Sender: TObject);
begin
  inherited;
  ButtonPen1.LinkPen(Chart1.Border);
end;

procedure TChartRoundPanel.CheckBox1Click(Sender: TObject);
begin
  UpDown1.Position:=0;
  CheckBox1.Enabled:=False;
end;

initialization
  RegisterClass(TChartRoundPanel);
end.
