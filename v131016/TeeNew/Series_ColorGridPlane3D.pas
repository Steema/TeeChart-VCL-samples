unit Series_ColorGridPlane3D;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, TeCanvas, Series, TeeProcs, Chart, TeeSurfa, TeePenDlg;

type
  TSeriesColorGridPlane3D = class(TBaseForm)
    Series1: TColorGridSeries;
    cb3D: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    ComboFlat1: TComboFlat;
    ButtonPen1: TButtonPen;
    procedure FormCreate(Sender: TObject);
    procedure cb3DClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSeriesColorGridPlane3D.FormCreate(Sender: TObject);
begin
  inherited;

  ButtonPen1.LinkPen(Series1.Frame);

  Series1.FillSampleValues;

  Series1.DrawPlane3D:=cpY;
  Series1.DrawPosition:=StrToInt(Edit1.Text);

  Chart1.ClipPoints:=False;
end;

procedure TSeriesColorGridPlane3D.cb3DClick(Sender: TObject);
begin
  Chart1.View3D:=cb3D.Checked;
end;

procedure TSeriesColorGridPlane3D.Edit1Change(Sender: TObject);
begin
  Series1.DrawPosition:=UpDown1.Position;
end;

procedure TSeriesColorGridPlane3D.ComboFlat1Change(Sender: TObject);
begin
  case ComboFlat1.ItemIndex of
     0: Series1.DrawPlane3D:=cpX;
     1: Series1.DrawPlane3D:=cpY;
  else
    begin
      Series1.DrawPlane3D:=cpZ;
      Series1.DrawPosition:=0;
      Edit1.Text:='0';
    end;
  end;
end;

initialization
  RegisterClass(TSeriesColorGridPlane3D);
end.
