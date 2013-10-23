unit Calendar_Buttons;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons, Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  {$ENDIF}
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeEngine, TeeCalendar, TeeProcs, Chart, TeCanvas, EditChar;

type
  TCalendarButtons = class(TBaseForm)
    Series1: TCalendarSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    CheckBox2: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TCalendarButtons.CheckBox1Click(Sender: TObject);
begin
  { show / hide buttons }
  Series1.NextMonthButton.Visible:=CheckBox1.Checked;
  Series1.PreviousMonthButton.Visible:=CheckBox1.Checked;
end;

procedure TCalendarButtons.ComboBox1Change(Sender: TObject);
begin
  { re-position buttons to left, right or middle }
  Case ComboBox1.ItemIndex of
    0: begin
         Series1.PreviousMonthButton.Left:=6;
         Series1.NextMonthButton.Left:=26;
       end;
    1: begin
         Series1.PreviousMonthButton.Left:=Chart1.Width-48;
         Series1.NextMonthButton.Left:=Chart1.Width-26;
       end;
    2: begin
         Series1.PreviousMonthButton.Left:=Chart1.ChartXCenter-26;
         Series1.NextMonthButton.Left:=Chart1.ChartXCenter+6;
       end;
  end;
end;

procedure TCalendarButtons.FormCreate(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;

  { set button hints }
  Series1.PreviousMonthButton.Hint:='Previous Month';
  Series1.NextMonthButton.Hint:='Next Month';
  Series1.PreviousMonthButton.ShowHint:=True;
  Series1.NextMonthButton.ShowHint:=True;
end;

procedure TCalendarButtons.Button1Click(Sender: TObject);
var P : TPoint;
begin
  { do popup menu }
  P:=Chart1.ClientToScreen(Point(Chart1.ChartXCenter,10));
  Series1.PopupMenu.Popup(P.X,P.Y);
end;

procedure TCalendarButtons.CheckBox2Click(Sender: TObject);
var tmp : TTeeTransparency;
begin
  { switch on / off transparency for some cells... }
  if CheckBox2.Checked then tmp:=50
                       else tmp:=0;
  Series1.Days.Transparency:=tmp;
  Series1.Sunday.Transparency:=tmp;
  Series1.Today.Transparency:=tmp;
end;

procedure TCalendarButtons.Button2Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TCalendarButtons);
end.
