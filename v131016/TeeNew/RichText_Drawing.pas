unit RichText_Drawing;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QComCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, ComCtrls, StdCtrls, RichEdit,
  {$ENDIF}
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart;

type
  TRichTextDrawing = class(TBaseForm)
    procedure Chart1AfterDraw(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure DrawRichText(Chart:TCustomTeePanel; RichEdit:TRichEdit; R:TRect); overload;
Procedure DrawRichText(Chart:TCustomTeePanel; const RichText:String; R:TRect); overload;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TRichTextDrawing.Chart1AfterDraw(Sender: TObject);
var RichText : String;
begin
  RichText:= '{\rtf1\ansi\ansicpg1252\deff0\deflang1033'+
             '{\fonttbl{\f0\fswiss\fcharset0 Arial;}'+
             '{\f1\fmodern\fprq1\fcharset0 Courier New;}'+
             '{\f2\fnil\fcharset2 Symbol;}}'+

             '{SuperScript}{\super 2} {+ SubScript}{\sub 2}  =  a^2 + a2}';

  DrawRichText(Chart1,RichText,Rect(60,60,360,90));

  RichText:= '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss'+
      '\fcharset0 Arial;}{\f1\fmodern\fprq1\fcharset0 Courier New;}{\f2' +
      '\fnil\fcharset2 Symbol;}}'+
      '\viewkind4\uc1\pard\f0\fs20 Normal\par'+
      '\b Bold  \ul\b0 Underline\ulnone   \i Itallic\par'+
      '}';

  DrawRichText(Chart1,RichText,Rect(60,100,360,140));
end;

{$IFDEF CLR}
{$IF Defined(UnsafeCode)}
{$DEFINE ACCEPTDRAW}
{$IFEND}
{$ELSE}
{$DEFINE ACCEPTDRAW}
{$ENDIF}

Procedure DrawRichText(Chart:TCustomTeePanel; RichEdit:TRichEdit; R:TRect); overload; 
{$IFDEF CLR}{$IFDEF ACCEPTDRAW}unsafe;{$ENDIF}{$ENDIF}
{$IFDEF ACCEPTDRAW}
const TwipsPerPixel=1440.0/96.0;
var fr : FORMATRANGE;
{$ENDIF}
begin
  {$IFDEF ACCEPTDRAW}
  fr.hdc := Chart.Canvas.Handle;
  fr.hdcTarget := fr.hdc;
  r.left :=Round(r.Left*twipsPerPixel);
  r.top :=Round(r.Top*twipsPerPixel);
  r.right :=Round(r.Right*twipsPerPixel);
  r.bottom := Round(r.Bottom*twipsPerPixel);
  fr.rc := r;
  fr.rcPage := r;
  fr.chrg.cpMin :=0;
  fr.chrg.cpMax :=-1;

  RichEdit.Perform(EM_FORMATRANGE,1,{$IFNDEF CLR}Integer{$ENDIF}(@fr));
  {$ENDIF}
end;

Procedure DrawRichText(Chart:TCustomTeePanel; const RichText:String; R:TRect); overload;
var RichEdit : TRichEdit;
begin
  RichEdit:=TRichEdit.Create(nil);
  try
    RichEdit.Parent:=Chart.Parent; // set Parent before text and color
    RichEdit.Text:=RichText;
    RichEdit.Color:=Chart.Color;
    DrawRichText(Chart,RichEdit,R);
  finally
    RichEdit.Free;
  end;
end;

initialization
  RegisterClass(TRichTextDrawing);
end.
