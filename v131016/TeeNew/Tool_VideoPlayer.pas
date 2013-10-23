unit Tool_VideoPlayer;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeVideoPlayer;
  

type
  TVideoPlayerToolForm = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    bPlay: TButton;
    BStop: TButton;
    cbLoop: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bPlayClick(Sender: TObject);
    procedure BStopClick(Sender: TObject);
    procedure cbLoopClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    VideoPlayer : TVideoPlayerTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TVideoPlayerToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  VideoPlayer:=TVideoPlayerTool.Create(Self);
  with VideoPlayer do
  begin
    ParentChart:=Chart1;
    FileName:=edit1.Text;
    Loop:=True;
  end;

  Chart1.Axes.Visible:=False;
  Chart1.Walls.Visible:=False;
end;

procedure TVideoPlayerToolForm.bPlayClick(Sender: TObject);
begin
  if FileExists(edit1.Text) then
  begin
    VideoPlayer.Play;
    BPlay.Enabled:=False;
    BStop.Enabled:=True;
  end
  else
    ShowMessage('File ' + VideoPlayer.FileName + ' does not Exist' + chr(13) +
    'You can create it by using the TVideoTool');
end;

procedure TVideoPlayerToolForm.BStopClick(Sender: TObject);
begin
  VideoPlayer.Stop;
  BPlay.Enabled:=True;
  BStop.Enabled:=False;
end;

procedure TVideoPlayerToolForm.cbLoopClick(Sender: TObject);
begin
  VideoPlayer.Loop:=cbLoop.Checked;
end;

procedure TVideoPlayerToolForm.FormDestroy(Sender: TObject);
begin
  VideoPlayer.Free;
end;

initialization
  RegisterClass(TVideoPlayerToolForm);
end.
