unit Series_ContourLevelMarks;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeSurfa, EditChar;

type
  TSeriesContourLevelMarks = class(TBaseForm)
    cbLevels: TCheckBox;
    Series1: TContourSeries;
    Label1: TLabel;
    ELevels: TEdit;
    UDLevels: TUpDown;
    cbFontColor: TCheckBox;
    Label2: TLabel;
    EDensity: TEdit;
    UDDensity: TUpDown;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cbLevelsClick(Sender: TObject);
    procedure cbFontColorClick(Sender: TObject);
    procedure ELevelsChange(Sender: TObject);
    procedure EDensityChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TSeriesContourLevelMarks.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.ContourMarks.Visible:=True;
end;

procedure TSeriesContourLevelMarks.cbLevelsClick(Sender: TObject);
begin
  Series1.ContourMarks.Visible:=cbLevels.Checked;
end;

procedure TSeriesContourLevelMarks.cbFontColorClick(Sender: TObject);
begin
  Series1.ContourMarks.ColorLevel:=cbFontColor.Checked;
end;

procedure TSeriesContourLevelMarks.ELevelsChange(Sender: TObject);
begin
  Series1.NumLevels:=UDLevels.Position;
end;

procedure TSeriesContourLevelMarks.EDensityChange(Sender: TObject);
begin
  Series1.ContourMarks.Density:=UDDensity.Position;
end;

procedure TSeriesContourLevelMarks.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TSeriesContourLevelMarks);
end.
