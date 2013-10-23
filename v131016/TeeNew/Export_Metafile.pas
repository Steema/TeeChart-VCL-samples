unit Export_Metafile;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons, QClipbrd,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons, Clipbrd,
  {$ENDIF}
  TeEngine, Series, Chart, TeeProcs;

type
  TMetafileForm = class(TForm)
    Chart1: TChart;
    Image1: TImage;
    BarSeries1: TBarSeries;
    Panel1: TPanel;
    Panel2: TPanel;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TMetafileForm.FormCreate(Sender: TObject);
begin
  BarSeries1.FillSampleValues(8);  { <-- some sample random bars }
end;

{ This code copies Chart contents onto Windows Clipboard in Metafile Format }
procedure TMetafileForm.BitBtn3Click(Sender: TObject);
begin
{    TeeClipWhenMetafiling:=True; {  <--- FORCE CLIPPING WITH METAFILES }
{    CLIPPING WORKS FINE BUT DO NOT ALLOW MOVEABLE OR RESIZEABLE METAFILES }

  Chart1.CopyToClipboardMetafile(True);  { <--- Enhanced Metafile = True }

  ShowMessage('Chart1 is now at Windows Clipboard in Metafile format.'+#13+
              'and will now be pasted HERE !');
{ Now PASTE! }
  Image1.Picture.Assign(ClipBoard);
  Image1.Refresh;
end;

{ This button asks a filename and saves the Chart }
procedure TMetafileForm.BitBtn2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then  { <-- ask for a filename first }
  begin
   { SAVE IT !! }

{    CLIPPING WORKS FINE BUT DO NOT ALLOW MOVEABLE OR RESIZEABLE METAFILES }
{    TO FORCE CLIPPING WITH METAFILES UNCOMMENT THIS LINE: }
{    TeeClipWhenMetafiling:=True;  }

    Chart1.SaveToMetafile(SaveDialog1.FileName);

   { THIS METHOD CAN BE USED TOO: }
(*
      Chart1.SaveToMetafileRect( SaveDialog1.FileName,
      Rect( 0,0, round(21{cm}*37.8), round(10{cm}*37.8)));
*)
{   ( this equals to 96 * 21 / 2.54 , 96 * 10 /2.54 )   }

    { now it's loaded HERE ! }
    Image1.Picture.LoadFromFile(SaveDialog1.FileName);
    Image1.Refresh;
  end;
end;

initialization
  RegisterClass(TMetafileForm);
end.
