unit Marks_ItemText;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TMarksItemText = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Series1: TPieSeries;
    CheckBox1: TCheckBox;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses
  TeeBrushDlg;

procedure TMarksItemText.FormCreate(Sender: TObject);
begin
  inherited;

  UpDown1.Position:=0;
  UpDown1.Max:=Series1.Labels.Count-1;
  Edit2.Text:=Series1.Labels[0];
end;

procedure TMarksItemText.Edit1Change(Sender: TObject);
begin
  Edit2.Text:=Series1.Labels[UpDown1.Position];
  CheckBox1.Checked:=Series1.Marks.Item[UpDown1.Position].Transparent;
end;

procedure TMarksItemText.Edit2Change(Sender: TObject);
begin
  Series1.Marks.Item[UpDown1.Position].Text.Text:=Edit2.Text;
end;

procedure TMarksItemText.Button1Click(Sender: TObject);
begin
  EditTeeFont(Self,Series1.Marks.Item[UpDown1.Position].Font);
end;

procedure TMarksItemText.CheckBox1Click(Sender: TObject);
begin
  Series1.Marks.Item[UpDown1.Position].Transparent:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TMarksItemText);
end.
