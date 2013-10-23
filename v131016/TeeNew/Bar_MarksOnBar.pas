unit Bar_MarksOnBar;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TBarMarksOnBarForm = class(TBaseForm)
    Series1: THorizBarSeries;
    Label1: TLabel;
    cbStyle: TComboBox;
    cbMarksOnBar: TCheckBox;
    llocation: TLabel;
    cbMarkLocation: TComboBox;
    Label3: TLabel;
    EditAngle: TEdit;
    UpDown1: TUpDown;
    Label4: TLabel;
    EditFontSize: TEdit;
    UpDown2: TUpDown;
    Label2: TLabel;
    CBName: TComboFlat;
    Series2: THorizBarSeries;
    procedure cbMarksOnBarClick(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
    procedure cbMarkLocationChange(Sender: TObject);
    procedure EditAngleChange(Sender: TObject);
    procedure EditFontSizeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBNameChange(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateMarksLocation();
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TBarMarksOnBarForm.cbMarksOnBarClick(Sender: TObject);
begin
  inherited;

  CBMarkLocation.Enabled := CBMarksOnBar.Checked;
  LLocation.Enabled := CBMarksOnBar.Checked;

  UpdateMarksLocation;
end;

procedure TBarMarksOnBarForm.cbStyleChange(Sender: TObject);
var ASeries : TChartSeries;
begin
  inherited;

  if CBStyle.ItemIndex = 0 then
  begin
    ASeries := TCustomBarSeries(series1);
    ChangeSeriesType(ASeries,THorizBarSeries);
    ASeries := TCustomBarSeries(series2);
    ChangeSeriesType(ASeries,THorizBarSeries);
    Series1.Gradient.Direction := gdBottomTop;
    Series2.Gradient.Direction := gdBottomTop;
    Chart1.axes.Left.Increment := 0;
    Chart1.axes.Bottom.Increment := 100;
  end
  else
  begin
    ASeries := THorizBarSeries(series1);
    ChangeSeriesType(ASeries,TBarSeries);
    ASeries := THorizBarSeries(series2);
    ChangeSeriesType(ASeries,TBarSeries);
    Series1.Gradient.Direction := gdLeftRight;
    Series2.Gradient.Direction := gdLeftRight;
    Chart1.axes.Bottom.Increment := 0;
    Chart1.axes.Left.Increment := 100;
  end;

  UpdateMarksLocation;
end;

procedure TBarMarksOnBarForm.cbMarkLocationChange(Sender: TObject);
begin
  Series1.MarksLocation := TMarksLocation(cbMarkLocation.ItemIndex);
  Series2.MarksLocation := TMarksLocation(cbMarkLocation.ItemIndex);
end;

procedure TBarMarksOnBarForm.EditAngleChange(Sender: TObject);
begin
  Series1.Marks.Angle := UpDown1.Position;
  Series2.Marks.Angle := UpDown1.Position;
end;

procedure TBarMarksOnBarForm.EditFontSizeChange(Sender: TObject);
begin
  Series1.Marks.Font.Size := UpDown2.Position;
  Series2.Marks.Font.Size := UpDown2.Position;
end;

procedure TBarMarksOnBarForm.UpdateMarksLocation;
begin
  Series1.MarksOnBar := cbMarksOnBar.Checked;
  Series1.MarksLocation := TMarksLocation(cbMarkLocation.ItemIndex);
  Series2.MarksOnBar := cbMarksOnBar.Checked;
  Series2.MarksLocation := TMarksLocation(cbMarkLocation.ItemIndex);
end;

procedure TBarMarksOnBarForm.FormCreate(Sender: TObject);
begin
  inherited;

  cbStyle.ItemIndex:=0;
  cbMarkLocation.ItemIndex:=2;

  CBName.Items:=Screen.Fonts;
  CBName.ItemIndex:=CBName.Items.IndexOf('Rage Italic');

  if CBName.ItemIndex=-1 then
     CBName.ItemIndex:=CBName.Items.IndexOf(Font.Name);

  CBNameChange(Self);

  UpDown2.Position := 17;
  cbMarksOnBar.Checked := true;
end;

procedure TBarMarksOnBarForm.CBNameChange(Sender: TObject);
begin
  Series1.Marks.Font.Name:=CBName.CurrentItem;
  Series2.Marks.Font.Name:=CBName.CurrentItem;
end;

initialization
  RegisterClass(TBarMarksOnBarForm);
end.
