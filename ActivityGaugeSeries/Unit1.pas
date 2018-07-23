unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeeActivityGauge, TeeGDIPlus, ExtCtrls, TeeProcs, TeEngine,
  Chart, TeeComma, StdCtrls, TeeTools, Series, TeeDonut;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    TeeCommander1: TTeeCommander;
    CheckBox1: TCheckBox;
    ColorBox1: TColorBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
  private
    series : TActivityGauge;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Chart1.Gradient.Visible := false;
  Chart1.Color := clWhite;

  series := TActivityGauge.Create(self);
  Chart1.AddSeries(series);
  series.FillSampleValues(3);

  series.CenterText.Shape.Font.Color := clNavy;
  series.CenterText.Shape.Font.Size := 60;
  series.CenterText.Text := inttostr(length(series.ActivityValues));

  series.Pen.Color := clWhite;

  Chart1.Hover.Visible := false;
  Chart1.Enabled := false;

  ColorBox1.Selected := series.BackColor;

  // Setting Value and Color for each Activity
  series.ActivityValues[0].Value := 50;

  // In the case you want to set an specific color for each activity
  series.ActivityValues[0].Color := clRed;

  // In the case you want to set specific backcolor for each activity
//  series.ActivityValues[0].BackColor := clblack;

  series.ActivityValues[1].Value := 70;
  series.ActivityValues[1].Color := clGreen;

  series.ActivityValues[2].Value := 90;
  series.ActivityValues[2].Color := clblue;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  series.CenterText.Visible := CheckBox1.Checked;
end;

procedure TForm1.ColorBox1Change(Sender: TObject);
begin
  series.BackColor := ColorBox1.Selected;
end;

end.
