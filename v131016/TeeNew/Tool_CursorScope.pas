unit Tool_CursorScope;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeCanvas, TeePenDlg;
  


type
  TCursorScopeForm = class(TBaseForm)
    Label1: TLabel;
    cbStyle: TComboBox;
    Series1: TFastLineSeries;
    Label2: TLabel;
    cbScopeStyle: TComboBox;
    Label3: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ButtonPen1: TButtonPen;
    procedure FormCreate(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cbScopeStyleChange(Sender: TObject);
  private
    { Private declarations }
    Cursor : TCursorTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCursorScopeForm.FormCreate(Sender: TObject);
begin
  inherited;
  Cursor:=TCursorTool.Create(self);
  with Cursor do
  begin
    ParentChart:=Chart1;
    Series:=Series1;
    Style:=cssScope;
    ScopeStyle:=scsRectangle;
    ScopeSize:=10;
    Pen.Width:=3;
  end;
  cbStyle.ItemIndex:=3;
  cbScopeStyle.ItemIndex:=0;
  ButtonPen1.Pen:=Cursor.Pen;
end;

procedure TCursorScopeForm.cbStyleChange(Sender: TObject);
var scopeStyle : boolean;
begin
  scopeStyle:=(cbStyle.ItemIndex=3);

  Label3.Enabled:=scopeStyle;
  Edit1.Enabled:=scopeStyle;
  UpDown1.Enabled:=scopeStyle;
  cbScopeStyle.Enabled:=scopeStyle;

  case cbStyle.ItemIndex of
    0 : Cursor.Style:=cssHorizontal;
    1 : Cursor.Style:=cssVertical;
    2 : Cursor.Style:=cssBoth;
    3 : Cursor.Style:=cssScope;
  end;
end;

procedure TCursorScopeForm.Edit1Change(Sender: TObject);
begin
  Cursor.ScopeSize:=StrToInt(Edit1.Text);
end;

procedure TCursorScopeForm.cbScopeStyleChange(Sender: TObject);
begin
  case cbScopeStyle.ItemIndex of
    0 : Cursor.ScopeStyle:=scsRectangle;
    1 : Cursor.ScopeStyle:=scsCircle;
    2 : Cursor.ScopeStyle:=scsDiamond;
    3 : Cursor.ScopeStyle:=scsEmpty;
    4 : Cursor.ScopeStyle:=scsCamera;
  end;
end;

initialization
  RegisterClass(TCursorScopeForm);
end.
