unit Gantt_MouseDrag;
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
  Base, TeEngine, Series, GanttCh, TeeProcs, Chart, TeeGanttTool;

type
  TGanttMouseForm = class(TBaseForm)
    Series1: TGanttSeries;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Button3: TButton;
    Button4: TButton;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
  private
    { Private declarations }
    Gantt : TGanttTool;
    procedure GanttTool1DragBar(Sender: TGanttTool; GanttBar:Integer);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TGanttMouseForm.FormCreate(Sender: TObject);
begin
  inherited;

  // Avoid setting sizes zero or negatives
  ScrollBar1.Min:=1;

  // Set 2D
  Chart1.View3D:=False;

  // Disable automatic sorting by date
  Series1.XValues.Order:=loNone;

  // Fill Gantt with sample date-time values:
  with Series1 do
  begin
    AddGantt(EncodeDate(2003,4,1),EncodeDate(2003,4,10), 0,'A');
    AddGantt(EncodeDate(2003,4,5),EncodeDate(2003,4,15), 1,'B');
    AddGantt(EncodeDate(2003,4,2),EncodeDate(2003,4,8),  2,'C');
    AddGantt(EncodeDate(2003,4,9),EncodeDate(2003,4,21), 3,'D');

    // Another gantt bar on the same line....
    AddGantt(EncodeDate(2003,4,12),EncodeDate(2003,4,18),  2,'C');

    // Make marks visible
    Marks.Visible:=True;
    Marks.Shadow.Size:=0;
    Marks.Gradient.Visible:=True;
  end;

  // Set horizontal bottom axis minimum and maximum
  Chart1.BottomAxis.SetMinMax( EncodeDate(2003,4,1), EncodeDate(2003,5,1) );

  // Set vertical left axis minimum and maximum
  Chart1.LeftAxis.SetMinMax( -2, 5 );
  Chart1.LeftAxis.Grid.Centered:=False;

  // Disable zoom
  Chart1.Zoom.Allow:=False;

  // Set horizontal daily Increment for labels and grids:
  Chart1.BottomAxis.Increment:=DateTimeStep[dtOneDay];
  Chart1.BottomAxis.LabelsAngle:=90;
  Chart1.BottomAxis.DateTimeFormat:='dd-mmm';

  // Initialize Gantt Tool programatically (can be done at design-time too)
  Gantt:=TGanttTool.Create(Self);
  Gantt.Series:=Series1;
  Gantt.ParentChart:=Chart1;
  Gantt.OnDragBar:=GanttTool1DragBar;

  ComboBox1.ItemIndex:=0;
end;

procedure TGanttMouseForm.Chart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Label1.Caption:=''
end;

procedure TGanttMouseForm.GanttTool1DragBar(Sender: TGanttTool; GanttBar:Integer);
begin
  Label1.Caption:= DateTimeToStr(Sender.Gantt.StartValues[GanttBar])+' '+
                   DateTimeToStr(Sender.Gantt.EndValues[GanttBar]);
end;

procedure TGanttMouseForm.ScrollBar1Change(Sender: TObject);
begin
  Series1.Pointer.VertSize:=ScrollBar1.Position;
end;

procedure TGanttMouseForm.Button1Click(Sender: TObject);
begin
  with Chart1.BottomAxis do SetMinMax(Minimum-1,Maximum-1);
end;

procedure TGanttMouseForm.Button2Click(Sender: TObject);
begin
  with Chart1.BottomAxis do SetMinMax(Minimum+1,Maximum+1);
end;

procedure TGanttMouseForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Chart1.BottomAxis.Increment:=DateTimeStep[dtOneDay];
    1: Chart1.BottomAxis.Increment:=DateTimeStep[dtOneWeek];
    2: Chart1.BottomAxis.Increment:=DateTimeStep[dtHalfMonth];
    3: Chart1.BottomAxis.Increment:=DateTimeStep[dtOneMonth];
  end;
end;

procedure TGanttMouseForm.Button3Click(Sender: TObject);
begin
  with Chart1.BottomAxis do SetMinMax(Minimum+1,Maximum-1);
end;

procedure TGanttMouseForm.Button4Click(Sender: TObject);
begin
  with Chart1.BottomAxis do SetMinMax(Minimum-1,Maximum+1);
end;

procedure TGanttMouseForm.Series1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  // Example, customize Series marks...
  Case ValueIndex of
    0: MarkText:='John';
    1: MarkText:='Ann';
    2: MarkText:='David';
    3: MarkText:='Carol';
    4: MarkText:='David 2';
  end;
end;

initialization
  RegisterClass(TGanttMouseForm);
end.
