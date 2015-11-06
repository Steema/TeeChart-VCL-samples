unit Smith_Series;
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
  Base, TeEngine, Series, TeeSmith, TeeProcs, Chart, TeeTools;

type
  TSmithForm = class(TBaseForm)
    Series1: TSmithSeries;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TSmithForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TSmithForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TSmithForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Circled:=CheckBox1.Checked;
end;

procedure TSmithForm.Edit1Change(Sender: TObject);
begin
  Series1.ImagSymbol:=Edit1.Text;
end;

initialization
  RegisterClass(TSmithForm);
end.
