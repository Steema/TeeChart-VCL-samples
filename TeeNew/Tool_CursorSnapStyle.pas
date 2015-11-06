unit Tool_CursorSnapStyle;
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
  Base, TeeProcs, TeEngine, Chart, TeeSurfa, TeePoin3, TeeTools;

type
  TCursorSnapStyleToolForm = class(TBaseForm)
    Label1: TLabel;
    cbSnapStyle: TComboBox;
    ChartTool1: TCursorTool;
    cbSnap: TCheckBox;
    cbSeriesZ: TCheckBox;
    Series1: TPoint3DSeries;
    procedure FormCreate(Sender: TObject);
    procedure cbSnapClick(Sender: TObject);
    procedure cbSnapStyleChange(Sender: TObject);
    procedure cbSeriesZClick(Sender: TObject);
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

procedure TCursorSnapStyleToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  cbSnapStyle.ItemIndex:=0;
  ChartTool1.UseSeriesZ:=true;
end;

procedure TCursorSnapStyleToolForm.cbSnapClick(Sender: TObject);
begin
  ChartTool1.Snap:=cbSnap.Checked;
  cbSnapStyle.Enabled:=cbSnap.Checked;
end;

procedure TCursorSnapStyleToolForm.cbSnapStyleChange(Sender: TObject);
begin
  case cbSnapStyle.ItemIndex of
    0: ChartTool1.SnapStyle:=ssDefault;
    1: ChartTool1.SnapStyle:=ssHorizontal;
    2: ChartTool1.SnapStyle:=ssVertical;
  end;
end;

procedure TCursorSnapStyleToolForm.cbSeriesZClick(Sender: TObject);
begin
   ChartTool1.UseSeriesZ:=cbSeriesZ.Checked;
end;

initialization
  RegisterClass(TCursorSnapStyleToolForm);
end.
