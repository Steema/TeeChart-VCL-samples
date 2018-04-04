{**********************************************}
{   TeeChart Office - Web Charts Gallery       }
{   Copyright (c) 2010-2018 by Steema Software }
{   All Rights Reserved.                       }
{**********************************************}
unit TeeWebGallery;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  SysUtils, Classes;

type
  TWebGallery = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    URL: TComboBox;
    ButtonOK: TButton;
    PanelMain: TPanel;
    Label1: TLabel;
    procedure RadioBrowseClick(Sender: TObject);
    procedure RadioLoadClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadHistoryFromRegistry;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeOfficeConstants, TeeChartOfficeConstants, TeeUpdateVersion,
     {$IFNDEF LINUX}
     Registry,
     {$ENDIF}
     TeeAbout, TeeConst, TeeProcs;

procedure TWebGallery.RadioBrowseClick(Sender: TObject);
begin
  ButtonOK.Caption:=TeeMsg_Go;
end;

procedure TWebGallery.RadioLoadClick(Sender: TObject);
begin
  ButtonOK.Caption:=TeeMsg_OK;
  URL.SetFocus;
end;

procedure TWebGallery.ButtonOKClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TWebGallery.FormCreate(Sender: TObject);
begin
  { read download combo history items from Registry }
  LoadHistoryFromRegistry;
end;

Procedure TWebGallery.LoadHistoryFromRegistry;
var t     : Integer;
    tmp   : Integer;
    tmpSt : String;
begin { read download URL combo history items from Registry }
  With TRegistry.Create do
  try
    if OpenKeyReadOnly(TeeChartOfficeKey+'\WebGallery\Download') then
    begin
      if ValueExists('Count') then
      begin
        tmp:=ReadInteger('Count');
        for t:=0 to tmp-1 do
        begin
          tmpSt:='URL'+IntToStr(t);
          if ValueExists(tmpSt) then
             URL.Items.Add(ReadString(tmpSt));
        end;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TWebGallery.FormShow(Sender: TObject);
begin
  TeeTranslateControl(Self);
end;

end.
