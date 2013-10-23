unit Series_Groups;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeEdit, TeeLisB, TeCanvas, Series, TeeEditCha;

type
  TSeriesGroupsForm = class(TBaseForm)
    Button1: TButton;
    ChartEditor1: TChartEditor;
    ChartListBox1: TChartListBox;
    ComboFlat1: TComboFlat;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
  private
    { Private declarations }
    Group1, Group2 : TSeriesGroup;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

// Example of use of "Series Groups"...

procedure TSeriesGroupsForm.FormCreate(Sender: TObject);
var t : Integer;
    Line : TChartSeries;
begin
  ChartListBox1.Visible:=false;
  inherited;

  // Create some Line series, and fill them with random values...
  for t:=0 to 9 do
  begin
    Line:=Chart1.AddSeries(TLineSeries);
    Line.Title:='Line '+IntToStr(t);
    Line.FillSampleValues;
  end;

  // Create two "Series Groups", and add some series to each group...

  Group1:=Chart1.SeriesList.AddGroup('First group');
  Group1.Add( Chart1[0] );
  Group1.Add( Chart1[2] );
  Group1.Add( Chart1[4] );
  Group1.Add( Chart1[6] );
  Group1.Add( Chart1[8] );

  Group2:=Chart1.SeriesList.AddGroup('Second group');
  Group2.Add( Chart1[1] );
  Group2.Add( Chart1[3] );
  Group2.Add( Chart1[5] );
  Group2.Add( Chart1[7] );
  Group2.Add( Chart1[9] );

  // Show all series in first group
  Chart1.SeriesList.Groups[0].Show;

  // Hide all series in second group
  Chart1.SeriesList.Groups[1].Hide;

  // Tell the Chart ListBox to show the Group1 only...
  ChartListBox1.SeriesGroup:=Group1;

  // Add all groups to combo-box for selection...

  ComboFlat1.Clear;

  with Chart1.SeriesList.Groups do
  for t:=0 to Count-1 do
      ComboFlat1.Items.AddObject(Items[t].Name, Items[t]);

  ComboFlat1.ItemIndex:=0;
  Chart1.Draw;
end;

// Show the chart editor showing or not the "groups"...
procedure TSeriesGroupsForm.Button1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     ChartEditor1.Options:= ChartEditor1.Options + [ceGroups]
  else
     ChartEditor1.Options:= ChartEditor1.Options - [ceGroups];

  if CheckBox2.Checked then
     ChartEditor1.Options:= ChartEditor1.Options + [ceGroupAll]
  else
     ChartEditor1.Options:= ChartEditor1.Options - [ceGroupAll];

  ChartEditor1.Execute;
end;

procedure TSeriesGroupsForm.Chart1AfterDraw(Sender: TObject);
var wasFalse: Boolean;
begin
  inherited;
  wasFalse:=not ChartListBox1.Visible;
  if wasFalse then
  begin
    ChartListBox1.Visible:=true;
    Chart1.Repaint;
  end;
end;

procedure TSeriesGroupsForm.ComboFlat1Change(Sender: TObject);
begin
  // Hide series in current group
  ChartListBox1.SeriesGroup.Hide;

  // Change series group to show at listbox...
  ChartListBox1.SeriesGroup:=ComboFlat1.Items.Objects[ComboFlat1.ItemIndex] as TSeriesGroup;

  // Show series in newly selected group
  ChartListBox1.SeriesGroup.Show;
end;

initialization
  RegisterClass(TSeriesGroupsForm);
end.
