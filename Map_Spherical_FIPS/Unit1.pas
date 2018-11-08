unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Chart, TeeGDIPlus, TeEngine, TeeSurfa, TeeMapSeries,
  TeeWorldSeries, ExtCtrls, TeeProcs, TeeTools, TeeComma, TeCanvas,
  TeeWorldSeriesEditor, StdCtrls, Series, TeeGLEditor, TeeGLCanvas,
  TeeMapSeriesEdit;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    ChartTool1: TMarksTipTool;
    TeeCommander1: TTeeCommander;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Panel1: TPanel;
    LBMap: TListBox;
    Panel2: TPanel;
    Button1: TButton;
    CheckBox6: TCheckBox;
    ScrollBar1: TScrollBar;
    Button2: TButton;
    Image1: TImage;
    Panel3: TPanel;
    BGermany: TButton;
    ComboBox1: TComboBox;
    XCenter: TScrollBar;
    YCenter: TScrollBar;
    CheckBox5: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure LBMapClick(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BGermanyClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure XCenterChange(Sender: TObject);
    procedure YCenterChange(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
  private
    { Private declarations }
    Series1 : TWorldSeries;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  TMapSeriesAccess=class(TMapSeries);


procedure TForm1.FormCreate(Sender: TObject);

  procedure SetOneColor;
  var tmp : TTeePolygon;
      tmpS : TTeePolygons;
      t : Integer;
  begin
//    tmp:=Series1.Shapes.ByName['MichiGan'];
//    tmp:=Series1.Shapes[91];
//    tmp:=Series1.Shapes.ByName['Santa Cruz'];
    tmp:=Series1.Shapes.ByCode['06087'];

    if tmp<>nil then
    begin
      tmp.Z:=1234;
      tmp.Color:=cllime;

      tmpS:=tmp.Siblings;

      for t:=0 to High(tmpS) do
      begin
        tmpS[t].Color:=clLime;
        tmpS[t].Z:=1234;
      end;
    end;
  end;

var t : Integer;
begin
  TWorldSeriesEditor.PrepareWorldMapListBox(LBMap.Items);


  // Set mouse wheel to zoom in-out
  //Chart1.Zoom.MouseWheel:=pmwNormal;
  //Chart1.Panning.MouseWheel:=pmwNone;

  Series1:=TWorldSeries.CreateMap(Self,wmUSAAlaskaCounties); //HawaiiAlaska);

  Series1.HorizAxis:=aBothHorizAxis;
  Series1.VertAxis:=aBothVertAxis;

  Chart1.Legend.Symbol.Shadow.Hide;

//  Series1.Layers.USA.States:=True;
//  Series1.Layers.USA.Series;

  Series1.Pen.Color:=clSilver;

  {
  for t:=0 to Series1.Shapes.Count-1 do
      Series1.Shapes[t].ParentPen:=False;

  for t:=0 to Series1.Shapes.Count-1 do
      Series1.Shapes[t].Pen.Visible:=t=0;
  }

  // Verify: All shapes should have Text !
  for t:=0 to Series1.Shapes.Count-1 do
      if Series1.Shapes[t].Text='' then
         Series1.Shapes[t].Color:=clRed;

//  TMapSeriesAccess(Series1).MinSize:=0;

  Series1.MapMarks.TextStyle:=mtBoth;

  Series1.FillSampleValues;
  SetOneColor;

  Series1.MapLegend.Style:=lsTexts;
//  Series1.MapLegend.IncludeZero:=True;

  Series1.ParentChart:=Chart1;

  // Tests
  Chart1.Canvas:=TTeeCanvas3D.Create;
//  Chart1.Tools.Add(TDrawLineTool);

  // Test filling a polygon with an image
  Series1.Shapes.ByName['San Bernardino'].Brush.Image.Assign(Image1.Picture);

  LBMap.ItemIndex:=LBMap.Items.IndexOfObject(TObject(Series1.Map));

//  Series1.MapLegend.VisibleOnly:=True;
end;

procedure TForm1.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  function TextOf(const AShape:TTeePolygon):String;
  begin
    result:=IntToStr(AShape.Index)+' '+AShape.Text+' '+AShape.Code;
  end;

var tmp : Integer;
    tmpS : TTeePolygon;
begin
  Exit;

  tmp:=Series1.Clicked(X,Y);

  if tmp=-1 then
     Caption:='-1'
  else
  begin
   Caption:=TextOf(Series1.Shapes[tmp]);

   tmpS:=Series1.Shapes[tmp].ParentShape;

   if tmpS<>nil then
      Caption:=Caption+' Parent: '+TextOf(tmpS);
  end;
end;

procedure TForm1.BGermanyClick(Sender: TObject);

  function StateIndex(const ACode:String):Integer;
  const
    States:Array[0..15] of String=(
      'DE1','DE2','DE3','DE4','DE5','DE6','DE7','DE8','DE9','DEA','DEB',
      'DEC','DED','DEE','DEF','DEG'
    );

  var tmp : String;
      t : Integer;
  begin
    tmp:=Copy(ACode,1,3); // DEx

    for t:=Low(States) to High(States) do
        if States[t]=tmp then
        begin
          result:=t;
          Exit;
        end;

    raise Exception.Create('Cannot find Germany State NUTS code: '+ACode);
  end;

var t : Integer;
    tmp : TTeePolygon;
begin
  for t:=0 to Series1.Shapes.Count-1 do
  begin
    tmp:=Series1.Shapes[t];

    tmp.Color:=Chart1.ColorPalette[StateIndex(tmp.Code)];
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var t : Integer;
    t1 : Cardinal;
begin
  t1:=GetTickCount;

  for t:=0 to LBMap.Count-1 do
  begin
    LBMap.ItemIndex:=t;
    LBMapClick(Self);

    Series1.FillSampleValues;
    Chart1.Draw;
  end;

  Caption:='Time '+IntToStr(GetTickCount-t1);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Series1.Layers.Cities.Visible:=CheckBox1.Checked;
  Series1.Layers.Cities.Series.Marks.Show;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Series1.Layers.States:=CheckBox2.Checked;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  Series1.Marks.Visible:=CheckBox3.Checked
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  Series1.Flags.Visible:=CheckBox4.Checked;
end;

procedure TForm1.LBMapClick(Sender: TObject);
begin
  Series1.Map:=TWorldMap(LBMap.Items.Objects[LBMap.ItemIndex]);

  BGermany.Enabled:=Series1.Map=wmGermany;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  Series1.Shadow.Visible:=CheckBox6.Checked;
  Series1.Shadow.Size:=3;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Series1.Transparency:=ScrollBar1.Position
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Series1.FillSampleValues;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var Galicia,
    Catalunya : TTeePolygons;
begin
  Series1.MapLegend.Style:=TMapLegendStyle(ComboBox1.ItemIndex);

  if Series1.MapLegend.Style=lsGroups then
     if Series1.Groups.Count=0 then
     begin
       SetLength(Catalunya,4);
       Catalunya[0]:=Series1.Shapes.ByCode['08'];
       Catalunya[1]:=Series1.Shapes.ByCode['17'];
       Catalunya[2]:=Series1.Shapes.ByCode['43'];
       Catalunya[3]:=Series1.Shapes.ByCode['25'];

       Series1.Groups.Add('Catalunya','CA',Catalunya);

       SetLength(Galicia,4);
       Galicia[0]:=Series1.Shapes.ByCode['36'];
       Galicia[1]:=Series1.Shapes.ByCode['15'];
       Galicia[2]:=Series1.Shapes.ByCode['27'];
       Galicia[3]:=Series1.Shapes.ByCode['32'];

       Series1.Groups.Add('Galicia','GA',Galicia);
     end;
end;

procedure TForm1.XCenterChange(Sender: TObject);
begin
  Series1.RenderOptions.Rotation.X:=XCenter.Position;
end;

procedure TForm1.YCenterChange(Sender: TObject);
begin
  Series1.RenderOptions.Rotation.Y:=YCenter.Position;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked then
     Series1.RenderMode:=rm3D
  else
     Series1.RenderMode:=rmDefault;
end;

end.
