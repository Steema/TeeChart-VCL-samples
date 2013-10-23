unit Chart_SubTitles;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart;

type
  TSubTitles = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TSubTitles.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SubTitle.Text.Add('Hello');
  Chart1.SubTitle.Font.Color:=clGreen;
  Chart1.SubTitle.Font.Size:=12;
  Chart1.SubTitle.Font.Style:=[fsBold];

  Chart1.SubFoot.Text.Add('World !');
end;

procedure TSubTitles.CheckBox1Click(Sender: TObject);
begin
  Chart1.SubTitle.Visible:=CheckBox1.Checked
end;

procedure TSubTitles.CheckBox2Click(Sender: TObject);
begin
  Chart1.SubFoot.Visible:=CheckBox2.Checked
end;

initialization
  RegisterClass(TSubTitles);
end.
