unit Series_Calendar;
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
  Base, TeeProcs, TeEngine, Chart, TeeCalendar, TeeCalendarEditor;

type
  TCalendarSeriesForm = class(TBaseForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    Chart2: TChart;
    Series1: TCalendarSeries;
    Chart3: TChart;
    Series2: TCalendarSeries;
    Calendar: TCalendarSeries;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

Uses EditChar;

procedure TCalendarSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  With Calendar do
  begin
    With WeekDays do
    begin
      Font.Color:=clBlue;
      Font.Size:=9;
      Font.Style:=[fsItalic];
      UpperCase:=True;
      Color:=clYellow;
    end;
    Days.Font.Color:=clGreen;
  end;
end;

procedure TCalendarSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Calendar.Months.Visible:=CheckBox2.Checked;
end;

procedure TCalendarSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Calendar.WeekDays.Visible:=CheckBox1.Checked;
end;

procedure TCalendarSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Calendar);
end;

initialization
  RegisterClass(TCalendarSeriesForm);
end.

