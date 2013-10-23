unit Editor_Formatting;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  ImgList,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TFormatEditorDemo = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Series1: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    procedure SetOtherFormats;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeFormatting;

procedure TFormatEditorDemo.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues(6);

  Edit1.Text:=Series1.ValueFormat;

  SetOtherFormats;
end;

// Just an example to show values using the same format at axis.
procedure TFormatEditorDemo.SetOtherFormats;
begin
  Series1.GetHorizAxis.AxisValuesFormat:=Edit1.Text;
  Series1.GetVertAxis.AxisValuesFormat:=Edit1.Text;
  Series1.ValueFormat:=Edit1.Text;
end;

procedure TFormatEditorDemo.Button1Click(Sender: TObject);
begin
  Edit1.Text:=TFormatEditor.Change(Self,Edit1.Text);
  SetOtherFormats;
end;

procedure TFormatEditorDemo.Edit1Change(Sender: TObject);
begin
  SetOtherFormats;
end;

initialization
  RegisterClass(TFormatEditorDemo);
end.
