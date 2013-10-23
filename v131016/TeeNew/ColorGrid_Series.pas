unit ColorGrid_Series;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeCanvas, TeePenDlg;

type
  TColorGrid = class(TBaseForm)
    Series1: TColorGridSeries;
    CheckBox1: TCheckBox;
    ButtonPen1: TButtonPen;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    CheckBox2: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonPen1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure SetGridControls;
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

procedure TColorGrid.CheckBox1Click(Sender: TObject);
begin
  Series1.Pen.Visible:=CheckBox1.Checked;
  ButtonPen1.Enabled:=Series1.Pen.Visible;
end;

procedure TColorGrid.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);

  ButtonPen1.LinkPen(Series1.Pen);
  ButtonPen1.Enabled:=Series1.Pen.Visible;

  Series1.Pen.Color:=clWhite;
  Series1.UsePalette:=True;
  Series1.UseColorRange:=False;
end;

procedure TColorGrid.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
  SetGridControls;
end;

procedure TColorGrid.ButtonPen1Click(Sender: TObject);
begin
  inherited;
  SetGridControls;
end;

Procedure TColorGrid.SetGridControls;
begin
  CheckBox1.Checked:=Series1.Pen.Visible;
  ButtonPen1.Enabled:=Series1.Pen.Visible;
end;

procedure TColorGrid.Edit1Change(Sender: TObject);
begin
  if Showing then
  begin
    Series1.FillSampleValues(UpDown1.Position);
    if UpDown1.Position>30 then
    begin
      CheckBox1.Checked:=False;
      Series1.Pen.Visible:=False;
    end;
  end;
end;

procedure TColorGrid.CheckBox2Click(Sender: TObject);
begin
  Series1.CenteredPoints:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TColorGrid);
end.
