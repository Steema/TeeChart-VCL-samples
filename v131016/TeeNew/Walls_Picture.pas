unit Walls_Picture;
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
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, ExtDlgs,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeTools;

type
  TWallsPictureForm = class(TBaseForm)
    bBrowse: TButton;
    bApply: TButton;
    cbWall: TComboFlat;
    Panel2: TPanel;
    Image1: TImage;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure bBrowseClick(Sender: TObject);
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

procedure TWallsPictureForm.FormCreate(Sender: TObject);
begin
  inherited;
  cbWall.ItemIndex:=0;
end;

procedure TWallsPictureForm.bBrowseClick(Sender: TObject);
begin
  with {$IFDEF CLX}TOpenDialog{$ELSE}TOpenPictureDialog{$ENDIF}.Create(Self) do
  try
    if Execute then
       Self.Image1.Picture.LoadFromFile(FileName);
  finally
    Free;
  end;
end;

procedure TWallsPictureForm.bApplyClick(Sender: TObject);
begin
  with Chart1.Walls do
    case cbWall.ItemIndex of
      0 : Left.Picture.Assign(Image1.Picture);
      1 : Right.Picture.Assign(Image1.Picture);
      2 : Bottom.Picture.Assign(Image1.Picture);
      3 : Back.Picture.Assign(Image1.Picture);
    end;
end;

initialization
  RegisterClass(TWallsPictureForm);
end.
