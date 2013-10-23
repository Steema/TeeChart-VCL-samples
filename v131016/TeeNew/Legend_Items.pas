unit Legend_Items;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TLegendItemsForm = class(TBaseForm)
    Series1: TPieSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TLegendItemsForm.Edit1Change(Sender: TObject);
begin
  Edit2.Text:=Chart1.Legend.Item[UpDown1.Position].Text;
end;

procedure TLegendItemsForm.Edit2Change(Sender: TObject);
begin
  Chart1.Legend.Item[UpDown1.Position].Text:=Edit2.Text;
end;

procedure TLegendItemsForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.Legend.TextStyle:=ltsValue;

  Series1.FillSampleValues;
  UpDown1.Max:=Series1.Count-1;

  Chart1.Legend.ColumnWidthAuto:=False;
  Chart1.Legend.ColumnWidths[0]:=100;

  // Force re-draw to make Chart1 to recalculate all Legend Items[]
  Chart1.Draw;

  Edit1Change(Self);
end;

initialization
  RegisterClass(TLegendItemsForm);
end.
