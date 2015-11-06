unit OpenGL_LightDirection;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeOpenGL;

type
  TOpenGLLightDirection = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TLineSeries;
    TeeOpenGL1: TTeeOpenGL;
    bEdit: TButton;
    cbLight: TComboFlat;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    TBXDirection: TTrackBar;
    Label12: TLabel;
    TBYDirection: TTrackBar;
    Label13: TLabel;
    TBZDirection: TTrackBar;
    Label9: TLabel;
    Edit2: TEdit;
    UDSpot: TUpDown;
    CBDefaultSpot: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure TBXDirectionChange(Sender: TObject);
    procedure TBYDirectionChange(Sender: TObject);
    procedure TBZDirectionChange(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CBDefaultSpotClick(Sender: TObject);
    procedure cbLightChange(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateOptions(light : TGLLightSource);
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
  TeeGLEditor;

procedure TOpenGLLightDirection.FormCreate(Sender: TObject);
begin
  inherited;

  cbLight.ItemIndex:=0;

  with TeeOpenGL1 do
  begin
    Light0.Visible:=true;
    Light1.Visible:=true;
    Light2.Visible:=true;
  end;

  CBDefaultSpotClick(Self);
end;

procedure TOpenGLLightDirection.bEditClick(Sender: TObject);
begin
  EditTeeOpenGL(self,TeeOpenGL1);
end;

procedure TOpenGLLightDirection.TBXDirectionChange(Sender: TObject);
begin
  case cbLight.ItemIndex of
    0 : TeeOpenGL1.Light0.Direction.X:=TBXDirection.Position;
    1 : TeeOpenGL1.Light1.Direction.X:=TBXDirection.Position;
    2 : TeeOpenGL1.Light2.Direction.X:=TBXDirection.Position;
  end;
end;

procedure TOpenGLLightDirection.TBYDirectionChange(Sender: TObject);
begin
  case cbLight.ItemIndex of
    0 : TeeOpenGL1.Light0.Direction.Y:=TBYDirection.Position;
    1 : TeeOpenGL1.Light1.Direction.Y:=TBYDirection.Position;
    2 : TeeOpenGL1.Light2.Direction.Y:=TBYDirection.Position;
  end;
end;

procedure TOpenGLLightDirection.TBZDirectionChange(Sender: TObject);
begin
  case cbLight.ItemIndex of
    0 : TeeOpenGL1.Light0.Direction.Z:=TBZDirection.Position;
    1 : TeeOpenGL1.Light1.Direction.Z:=TBZDirection.Position;
    2 : TeeOpenGL1.Light2.Direction.Z:=TBZDirection.Position;
  end;
end;

procedure TOpenGLLightDirection.Edit2Change(Sender: TObject);
begin
  case cbLight.ItemIndex of
    0 : TeeOpenGL1.Light0.SpotDegrees:=UDSpot.Position;
    1 : TeeOpenGL1.Light1.SpotDegrees:=UDSpot.Position;
    2 : TeeOpenGL1.Light2.SpotDegrees:=UDSpot.Position;
  end;
end;

procedure TOpenGLLightDirection.CBDefaultSpotClick(Sender: TObject);
begin
  Edit2.Enabled:=not CBDefaultSpot.Checked;
  UDSpot.Enabled:=not CBDefaultSpot.Checked;;

  TBXDirection.Enabled:= not CBDefaultSpot.Checked;
  TBYDirection.Enabled:= not CBDefaultSpot.Checked;
  TBZDirection.Enabled:= not CBDefaultSpot.Checked;

  if CBDefaultSpot.Checked then
  begin
    case cbLight.ItemIndex of
      0 : TeeOpenGL1.Light0.SpotDegrees:=180;
      1 : TeeOpenGL1.Light1.SpotDegrees:=180;
      2 : TeeOpenGL1.Light2.SpotDegrees:=180;
    end;
  end
  else
     Edit2Change(Self);
end;

procedure TOpenGLLightDirection.UpdateOptions(light : TGLLightSource);
begin
  TBXDirection.Position:=Round(light.Direction.X);
  TBYDirection.Position:=Round(light.Direction.Y);
  TBZDirection.Position:=Round(light.Direction.Z);

  UDSpot.Position:=Round(light.SpotDegrees);

  CBDefaultSpot.Enabled:=False;
  CBDefaultSpotClick(Self);
end;

procedure TOpenGLLightDirection.cbLightChange(Sender: TObject);
begin
  case cbLight.ItemIndex of
    0 : UpdateOptions(TeeOpenGL1.Light0);
    1 : UpdateOptions(TeeOpenGL1.Light1);
    2 : UpdateOptions(TeeOpenGL1.Light2);
  end;
end;

initialization
  RegisterClass(TOpenGLLightDirection);
end.
