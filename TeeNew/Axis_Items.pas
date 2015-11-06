unit Axis_Items;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeCustomShapeEditor, TeCanvas;

type
  TAxisItemsDemo = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Button1: TButton;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure AddCustomLabels;
    procedure SetDemoControls;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAxisItemsDemo.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.AddArray([200,0,123,300,260,-100,650,400]);

  AddCustomLabels;

  SetDemoControls;

  UpDown2.Position:=123;
end;

procedure TAxisItemsDemo.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then AddCustomLabels
                       else Chart1.Axes.Left.Items.Clear;

  SetDemoControls;
end;

Procedure TAxisItemsDemo.AddCustomLabels;
begin
  with Chart1.Axes.Left do
  begin
    Items.Clear;  // remove all custom labels

    // add custom labels

    Items.Add(123,'Hello').Format.Font.Size:=16;

    Items.Add(466,'Good'#13'Bye').Format.Transparent:=False;

    Items.Add(300);

    with Items.Add(-100).Format do
    begin
      Transparent:=False;
      Transparency:=50;
      Color:=clBlue;
    end;
  end;
end;

procedure TAxisItemsDemo.Edit1Change(Sender: TObject);
begin
  if Showing then
     Edit2.Text:=FloatToStr(Chart1.Axes.Left.Items[UpDown1.Position].Value);
end;

procedure TAxisItemsDemo.Edit2Change(Sender: TObject);
begin
  if Showing then
  with Chart1.Axes.Left.Items[UpDown1.Position] do
       Value:=StrToFloatDef(Edit2.Text,Value);
end;

procedure TAxisItemsDemo.Button1Click(Sender: TObject);
begin
  EditTeeCustomShape(Self,Chart1.Axes.Left.Items[UpDown1.Position].Format);
end;

procedure TAxisItemsDemo.SetDemoControls;
begin
  UpDown1.Enabled:=Chart1.Axes.Left.Items.Count>0;

  if UpDown1.Enabled then
     UpDown1.Max:=Chart1.Axes.Left.Items.Count-1;

  UpDown2.Enabled:=UpDown1.Enabled;
  Edit1.Enabled:=UpDown1.Enabled;
  Edit2.Enabled:=UpDown1.Enabled;
  Button1.Enabled:=UpDown1.Enabled;
end;

initialization
  RegisterClass(TAxisItemsDemo);
end.
