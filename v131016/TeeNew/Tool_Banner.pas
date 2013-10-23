unit Tool_Banner;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeBannerTool;

type
  TBannerToolForm = class(TBaseForm)
    cbScroll: TCheckBox;
    cbBlink: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbScrollDirection: TComboBox;
    cbTransparent: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbScrollDirectionChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cbScrollClick(Sender: TObject);
    procedure cbBlinkClick(Sender: TObject);
    procedure cbTransparentClick(Sender: TObject);
  private
    { Private declarations }
    Banner : TBannerTool;
  public
    { Public declarations }
  end;


implementation

uses 
  TeCanvas;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TBannerToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  Banner:=TBannerTool.Create(Self);

  with Banner do
  begin
    ParentChart:=Chart1;
    Text:=Edit1.Text;
    Shape.Gradient.EndColor:=clGrayText;
    Shape.Gradient.Visible:=true;
    Shape.Bevel:=bvRaised;
    Shape.Font.Size:=18;
    Left:=(Chart1.Width div 2) - (Chart1.Canvas.textWidth(edit1.Text) div 2);
    Top:=Chart1.Height div 2;
  end;

  cbScrollDirection.ItemIndex:=0;
end;

procedure TBannerToolForm.cbScrollDirectionChange(Sender: TObject);
begin
  if cbScrollDirection.ItemIndex=0 then
    Banner.ScrollDirection:=sdRightLeft
  else
    Banner.ScrollDirection:=sdLeftRight;
end;

procedure TBannerToolForm.Edit1Change(Sender: TObject);
begin
  Banner.Text:=Edit1.Text;
end;

procedure TBannerToolForm.cbScrollClick(Sender: TObject);
begin
  Banner.Scroll:=cbScroll.Checked;
end;

procedure TBannerToolForm.cbBlinkClick(Sender: TObject);
begin
  Banner.Blink:=cbBlink.Checked;
end;

procedure TBannerToolForm.cbTransparentClick(Sender: TObject);
begin
  Banner.Shape.Transparent:=cbTransparent.Checked;
end;

initialization
  RegisterClass(TBannerToolForm);
end.
