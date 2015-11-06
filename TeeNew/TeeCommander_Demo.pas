unit TeeCommander_Demo;
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
  Base, TeeComma, TeeProcs, TeEngine, Chart, Series, Bar3D;

type
  TTeeCommanderDemo = class(TBaseForm)
    CheckBox1: TCheckBox;
    TeeCommander1: TTeeCommander;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Series1: TBar3DSeries;
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
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

procedure TTeeCommanderDemo.CheckBox3Click(Sender: TObject);
begin
  TeeCommander1.LabelText.Visible:=CheckBox3.Checked;
end;

procedure TTeeCommanderDemo.CheckBox2Click(Sender: TObject);
begin
  TeeCommander1.ParentShowHint:=False;
  TeeCommander1.ShowHint:=CheckBox2.Checked;
end;

procedure TTeeCommanderDemo.CheckBox1Click(Sender: TObject);
begin
  TeeCommander1.Vertical:=CheckBox1.Checked;
end;

procedure TTeeCommanderDemo.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then TeeCommander1.Panel:=Chart1
                       else TeeCommander1.Panel:=nil;
end;

procedure TTeeCommanderDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
end;

initialization
  RegisterClass(TTeeCommanderDemo);
end.
