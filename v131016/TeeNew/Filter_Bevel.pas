unit Filter_Bevel;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, 

  {$IFNDEF CLR}
  jpeg, 
  {$ENDIF}

  TeeFilters;

type
  TFilterBevel = class(TBaseForm)
    bFilters: TButton;
    Series1: TAreaSeries;
    sbBright: TScrollBar;
    sbSize: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure bFiltersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbBrightChange(Sender: TObject);
    procedure sbSizeChange(Sender: TObject);
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

uses
  TeeFiltersEditor;

procedure TFilterBevel.bFiltersClick(Sender: TObject);
begin
  ShowFiltersEditor(Self, Chart1.BackImage);
end;

procedure TFilterBevel.FormCreate(Sender: TObject);
begin
  inherited;

  with Chart1.BackImage do
  begin
    Filters.Add(TBevelFilter);

    (Filters[0] as TBevelFilter).Bright := 64;
    (Filters[0] as TBevelFilter).Size:= 28;
  end;
end;

procedure TFilterBevel.sbBrightChange(Sender: TObject);
begin
  (Chart1.BackImage.Filters[0] as TBevelFilter).Bright := sbBright.Position;

  Label3.Caption:=IntToStr(sbBright.Position);
  Chart1.Invalidate;
end;

procedure TFilterBevel.sbSizeChange(Sender: TObject);
begin
  (Chart1.BackImage.Filters[0] as TBevelFilter).Size := sbSize.Position;

  Label4.Caption:=IntToStr(sbSize.Position);
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TFilterBevel);
end.

