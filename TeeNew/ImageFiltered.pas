unit ImageFiltered;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, GanttCh,

  jpeg,

  TeeFilters, TeeFiltersEditor, TeeGDIPlus;

type
  TImageFilteredDemo = class(TBaseForm)
    ImageFiltered1: TImageFiltered;
    Button1: TButton;
    Series1: TGanttSeries;
    bApply: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
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

procedure TImageFilteredDemo.Button1Click(Sender: TObject);
begin
  // Show the filters editor dialog, and if user click "OK"
  // invalidate the Image (force repaint)

  if ShowFiltersEditor(Self, ImageFiltered1.Picture.Graphic,
                       ImageFiltered1.Filters) then
  begin
    ImageFiltered1.Invalidate;
  end;
end;

procedure TImageFilteredDemo.bApplyClick(Sender: TObject);
var tmp : TBitmap;
begin
  // Obtain "filtered" image  (apply filters to picture)

  tmp:=ImageFiltered1.Filtered;
  try
    // Assign filtered image to Back Wall of Chart1

    Chart1.Walls.Back.Picture.Graphic:=tmp;
  finally
    tmp.Free;
  end;
end;

initialization
  RegisterClass(TImageFilteredDemo);
end.
