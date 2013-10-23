unit Org_HtmlFormat;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  
  SysUtils, Classes,

  {$IFDEF CLR}
  System.IO,
  {$ENDIF}

  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeOrgSeries;

type
  TOrgHtmlFormatForm = class(TBaseForm)
    Series1: TOrgSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$IFNDEF LCL}
{$R *.DFM}
{$ENDIF}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeJpeg, EditChar;

procedure TOrgHtmlFormatForm.FormCreate(Sender: TObject);
var tmp, tmp1,
    tmp2,tmp3,
    i           : Integer;
    Img1, Img2  : String;
begin
  inherited;

  Chart1.Title.Visible := False;
  Chart1.Legend.Color := clBlue;

  Series1.Clear;

  Img1:='orgimage.jpg';
  if not FileExists(Img1) then Img1:='./Features/'+Img1;

  Img2:='orgimage2.jpg';
  if not FileExists(Img2) then Img2:='./Features/'+Img2;

  tmp := series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img1+'"></CENTER>' +
  '<br><b>John Smith</b><br>President');

  tmp1 := series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img1+'"></CENTER>' +
  '<br><b>Brad Scarlet</b><br>Product Manager and Ivestor',tmp);

  tmp2 := series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img2+'"></CENTER>' +
  '<br><b>Anne Smart</b><br>VP and Chief Financial Officer',tmp);

  tmp3 := series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img1+'"></CENTER>' +
  '<br><b>Paul Patson</b><br>VP and Chief Financial Marketing',tmp);

  series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img2+'"></CENTER>' +
  '<br><b>Esther Mercs</b><br>Operacions Director',tmp1);

  series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img1+'"></CENTER>' +
  '<br><b>Jason Patson</b><br>Services',tmp2);

  series1.Add('<CENTER><IMG WIDTH=50 HEIGHT=50 SRC="'+Img2+'"></CENTER>' +
  '<br><b>Julia Simpson</b><br>Services',tmp3);


  for i:=0 to Series1.Items.Count-1 do
    with Series1.Item[i].Format do
    begin
      TextFormat := ttfHtml;
      Gradient.StartColor := RGB(57,107,166);
      Gradient.MidColor := RGB(44,135,213);
      Gradient.EndColor := RGB(111,174,228);
      Gradient.Visible := True;
      Pen.Visible := False;
      Font.Color := clBtnFace;
    end;

end;

procedure TOrgHtmlFormatForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TOrgHtmlFormatForm);
end.
