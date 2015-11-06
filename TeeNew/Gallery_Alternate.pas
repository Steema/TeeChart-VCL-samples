unit Gallery_Alternate;
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
  TeeGalleryAlternate, TeePenDlg;

type
  TGalleryAlternate = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Gallery : TTeeGalleryForm;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TGalleryAlternate.FormShow(Sender: TObject);
begin
  Gallery:=TTeeGalleryForm.Create(Self);
  Gallery.Align:=alClient;
  AddFormTo(Gallery,Self);
end;

procedure TGalleryAlternate.FormDestroy(Sender: TObject);
begin
  Gallery.Free;
end;

initialization
  RegisterClass(TGalleryAlternate);
end.
