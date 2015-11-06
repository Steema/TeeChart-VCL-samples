unit TeeCreateFlatFile;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls,
  {$ENDIF}
  SysUtils, Classes;

type
  TData=record Value:Double; end;

  // The "USEFILE" compiler define, determines if this application will use
  // a normal Delphi "File" or a "TFileStream" instead.

  {$IFDEF USEFILE}
  TFlatFile=File of TData;
  {$ELSE}
  TFlatFile=TFileStream;
  {$ENDIF}

  TProgressProc=procedure(Index:Integer) of object;

type
  TFormCreateFile = class(TForm)
    Button1: TButton;
    SampleFile: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    LabelPercent: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    NumSamples: Integer;

    procedure CreateSampleFile(const TheFileName:String; NumSamples:Integer;
                               ProgressProc:TProgressProc=nil);
    procedure ProgressProc(Index:Integer);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFormCreateFile.CreateSampleFile(const TheFileName:String; NumSamples:Integer;
                                           ProgressProc:TProgressProc=nil);
var f : TFlatFile;
    t : Integer;
    SampleData : TData;
begin
  SampleData.Value:=Random(100000);

  {$IFDEF USEFILE}

  AssignFile(f,TheFileName);
  Rewrite(f);

  {$ELSE}

  f:=TFlatFile.Create(TheFileName,fmCreate);

  {$ENDIF}

  try
    for t:=1 to NumSamples do
    begin
      SampleData.Value:=Random(100)-50+SampleData.Value;

      {$IFDEF USEFILE}
      Write(f,SampleData);
      {$ELSE}
      f.Write(SampleData.Value,SizeOf(SampleData.Value));
      {$ENDIF}

      if Assigned(ProgressProc) and ((t mod 10000)=0) then
         ProgressProc(t);
    end;
  finally
    {$IFDEF USEFILE}
    CloseFile(f);
    {$ELSE}
    f.Free;
    {$ENDIF}
  end;
end;

procedure TFormCreateFile.ProgressProc(Index:Integer);
begin
  LabelPercent.Caption:=IntToStr((Index*100) div NumSamples)+' %';
  LabelPercent.Update;
end;

procedure TFormCreateFile.Button1Click(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  try
    NumSamples:=StrToInt(Edit1.Text);
    ProgressProc(0);
    CreateSampleFile(SampleFile.Text,NumSamples, ProgressProc);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

end.
