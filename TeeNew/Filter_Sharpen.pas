unit Filter_Sharpen;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeFilters, TeCanvas;

type
  TFilterSharpen = class(TBaseForm)
    cbActive: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
  private
    { Private declarations }
    SharpenFilter: TSharpenFilter;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFilterSharpen.FormCreate(Sender: TObject);
begin
  inherited;

  SharpenFilter := TSharpenFilter.Create(Chart1.Walls.Back.Picture.Filters);
end;

procedure TFilterSharpen.cbActiveClick(Sender: TObject);
begin
  SharpenFilter.Enabled:=cbActive.Checked;
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterSharpen);
end.
