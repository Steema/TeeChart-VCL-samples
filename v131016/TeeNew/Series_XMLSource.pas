unit Series_XMLSource;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeXML;

type
  TXMLSourceDemo = class(TBaseForm)
    Memo2: TMemo;
    Splitter1: TSplitter;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
  private
    { Private declarations }
    PointSeries : TPointSeries;
    XML         : TTeeXMLSource;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TXMLSourceDemo.FormCreate(Sender: TObject);
begin
  inherited;

  // Create a sample series...
  PointSeries:=TPointSeries.Create(Self);
  Chart1.AddSeries(PointSeries);

  // Create an XML source...
  XML:=TTeeXMLSource.Create(Self);

  // Configure XML...
  XML.XML.Text:=Memo2.Text;   // <--- set text

  //  XML.FileName:='c:\mydata.xml';

  XML.Series:=PointSeries;    // <-- series to fill
  XML.SeriesNode:='Series1';  // <-- xml node to use
  XML.ValueSource:='Y';       // <-- xml "point" attribute to use as value

  // Load data, fill series...
  XML.Open;
end;

procedure TXMLSourceDemo.Button1Click(Sender: TObject);
begin
  // Configure XML...
  XML.XML.Assign(Memo2.Lines);   // <--- set text
  
  XML.Refresh;

  Button1.Enabled:=False;
end;

procedure TXMLSourceDemo.Memo2Change(Sender: TObject);
begin
  Button1.Enabled:=True;
end;

initialization
  RegisterClass(TXMLSourceDemo);
end.
