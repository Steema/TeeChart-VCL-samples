unit Axes_Offsets;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TAxesOffsets = class(TBaseForm)
    Series1: TFastLineSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

procedure TAxesOffsets.Edit1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
     Chart1.Axes.Left.MinimumOffset:=UpDown1.Position
  else
     Chart1.Axes.Bottom.MinimumOffset:=UpDown1.Position
end;

procedure TAxesOffsets.Edit2Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
     Chart1.Axes.Left.MaximumOffset:=UpDown2.Position
  else
     Chart1.Axes.Bottom.MaximumOffset:=UpDown2.Position
end;

procedure TAxesOffsets.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  ComboBox1.ItemIndex:=0;
end;

procedure TAxesOffsets.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
  begin
    UpDown1.Position:=Chart1.Axes.Left.MinimumOffset;
    UpDown2.Position:=Chart1.Axes.Left.MaximumOffset;
  end
  else
  begin
    UpDown1.Position:=Chart1.Axes.Bottom.MinimumOffset;
    UpDown2.Position:=Chart1.Axes.Bottom.MaximumOffset;
  end;
end;

initialization
  RegisterClass(TAxesOffsets);
end.
