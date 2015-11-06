unit HTMLTextFormat;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeeTools, TeeGDIPlus;

type
  THTMLTextFormatForm = class(TBaseForm)
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ChartTool1: TRectangleTool;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }

    procedure AddCustomLabels;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeCanvas, TeeHtml, Math;

procedure THTMLTextFormatForm.FormCreate(Sender: TObject);
var x : integer;
begin
  inherited;

  Series1.FillSampleValues(5);

  ChartTool1.Shape.TextFormat := ttfHtml;
  ChartTool1.Text := '<b>My custom HTML Text</b><br><FONT color=BLUE size=18>Other Text';

  x := 2;
  ChartTool1.Shape.Width := Chart1.MultiLineTextWidth(ChartTool1.Text,x,ttfHtml)+10;
end;

procedure THTMLTextFormatForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     Series1.Marks.TextFormat := ttfHtml
  else
     Series1.Marks.TextFormat := ttfNormal;
end;

procedure THTMLTextFormatForm.Series1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  if Series1.Marks.TextFormat = ttfHtml then
  begin
    if ValueIndex = 1 then
      MarkText := '<b>'+MarkText+'</b><br>'  +
        '<FONT size=10>HTML Format<br>' +
        '<b><FONT color=RED size=8>Custom</b>'
    else
      MarkText := '<b>'+MarkText+'</b><br>' +
        '<FONT color=Blue size=8>HTML Format<br>' +
        '<FONT color=Green size=9>Custom';
  end;
end;

Procedure THTMLTextFormatForm.AddCustomLabels;
begin
  with Chart1.Axes.Bottom do
  begin
    Items.Automatic:=False;
    Items.Clear;  // remove all custom labels

    // add custom labels
    Items.Add(0,'<FONT color=Blue size=15>1st').Format.TextFormat:=ttfHtml;

    { Other way
    Items.Add(1,'<b><FONT color=BLUE size=15>1st</b>');
    Items[0].Format.TextFormat := ttfHtml;
    }

    with Items.Add(1, '<b><FONT color=RED size=18>2nd</b>').Format do
    begin
      TextFormat := ttfHtml;
    end;

    with Items.Add(2, '<b><FONT color=GREEN size=8>Third...</b>').Format do
    begin
      TextFormat := ttfHtml;
    end;

    Items[2].Format.Transparent := False;
    Items[2].Format.Transparency := 60;

    Items.Add(3, '<b>4th</b>').Format.TextFormat:=ttfHtml;
    Items.Add(4, '<b><FONT size=12>5th</b>').Format.TextFormat:=ttfHtml;
  end;
end;

procedure THTMLTextFormatForm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    AddCustomLabels;
  end
  else
  begin
    Chart1.Axes.Bottom.Items.Clear;
    Chart1.Axes.Bottom.Items.Automatic:=True;
  end;
end;

procedure THTMLTextFormatForm.CheckBox3Click(Sender: TObject);
begin
  ChartTool1.Visible := CheckBox3.Checked;
end;

initialization
  RegisterClass(THTMLTextFormatForm);
end.
