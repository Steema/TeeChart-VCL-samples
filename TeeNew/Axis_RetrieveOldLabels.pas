unit Axis_RetrieveOldLabels;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  Base, TeeProcs, TeEngine, Chart, Series, MyPoint;

type
  TAxis_RetrieveOldLabelsForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Series1: TMyPointSeries;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    OldLabels : TAxisItems;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TAxis_RetrieveOldLabelsForm.Button1Click(Sender: TObject);
begin
  with Chart1.Axes.Bottom do
  begin
    // Save old labels
    OldLabels.CopyFrom(Items);

    Items.Clear;  // remove all custom labels

    // add html custom labels
    Items.Add(0,'<FONT color=Blue size=15>000').Format.TextFormat:=ttfHtml;

    { Other way
    Items.Add(1,'<b><FONT color=BLUE size=15>1st</b>');
    items.Item[0].Format.TextFormat := ttfHtml;
    }

    // add custom labels
    Items.Add(1,'1st');
    Items.Add(2,'2nd');

    with Items.Add(3,'etc...').Format do
    begin
      Font.Size := 15;
      Transparent:=False;
      Transparency:=50;
      Color:=clBlue;
    end;
  end;
end;

procedure TAxis_RetrieveOldLabelsForm.Button2Click(Sender: TObject);
begin
  Chart1.Axes.Bottom.Items:=OldLabels;
  Chart1.Axes.Bottom.Items.Automatic:=True;
end;

procedure TAxis_RetrieveOldLabelsForm.FormCreate(Sender: TObject);
begin
  inherited;
  OldLabels:=TAxisItems.Create(Chart1.Axes.Bottom);
end;

procedure TAxis_RetrieveOldLabelsForm.FormDestroy(Sender: TObject);
begin
  OldLabels.Free;
  inherited;
end;

initialization
  RegisterClass(TAxis_RetrieveOldLabelsForm);
end.
