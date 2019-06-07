{**********************************************}
{   TeePac a Pac-Man like Game                 }
{   Copyright (c) 1996-2019 by Steema Software }
{**********************************************}
unit Game_PacMan;
{$I TeeDefs.inc}

interface

{ This unit implements a similar game like Pac-Man,
  but made with TeeChart and a Bubble Chart Series }
  
uses
  {$IFDEF LINUX}
  LibC,
  {$ELSE}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF D16}
  System.UITypes,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QMenus, QButtons, Types, Qt, QTypes,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Menus, Buttons,
  {$ENDIF}
  Base, IniFiles, TeeProcs, TeEngine, Chart, Series, BubbleCh,
  TeePenDlg, EditChar, TeeGDIPlus;

Const MaxMonsters=20;

type
  TPacManDirection=(pdStop,pdLeft,pdRight,pdTop,pdBottom);
  TSetOfDirection=set of TPacManDirection;

  TTeePacForm = class(TForm)
    Panel1: TPanel;
    Chart1: TChart;
    Walls: TBubbleSeries;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Save1: TMenuItem;
    Options1: TMenuItem;
    Zoomed1: TMenuItem;
    N3Dimensions1: TMenuItem;
    ShowAxis1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Chart2: TChart;
    HorizBarSeries1: THorizBarSeries;
    Panel2: TPanel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ShowLegend1: TMenuItem;
    BitBtn1: TBitBtn;
    Speed1: TMenuItem;
    Slow1: TMenuItem;
    Normal1: TMenuItem;
    Fast1: TMenuItem;
    procedure FormShow(Sender: TObject);
    function WallsGetPointerStyle(Sender: TChartSeries;
      ValueIndex: Integer): TSeriesPointerStyle;
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Zoomed1Click(Sender: TObject);
    procedure ShowAxis1Click(Sender: TObject);
    procedure N3Dimensions1Click(Sender: TObject);
    procedure QuittAltX1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ShowLegend1Click(Sender: TObject);
    procedure WallsAfterDrawValues(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure Slow1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Fast1Click(Sender: TObject);
  private
    { Private declarations }
    Changed,
    FirstKey,
    Zoomed         : Boolean;

    OldTime,
    IdleSpeed      : {$IFDEF LINUX}Longint{$ELSE}DWord{$ENDIF};
    Score,
    Speed,
    Lives          : Integer;

    ManDir         : TPacManDirection;
    CheckNewDirs   : Boolean;
    MonsterDir     : Array[1..MaxMonsters] of TPacManDirection;
    NumTargets     : Integer;
    TeeMap         : TStringList;
    Man            : Integer;
    OriginManX,
    OriginManY     : Double;

    { procedures }
    procedure AppOnIdle(Sender: TObject; var Done: Boolean);
    Procedure Eated(ValueIndex:Integer);
    Procedure EatedMonster(ValueIndex:Integer);
    Function HorizWall(From:Integer; Const X:Double):Integer;
    Function VertWall(From:Integer; Const Y:Double):Integer;
    Function CrashDirection( From:Integer;
                             ADir:TPacManDirection;
                             Const tmpSpeed:Double):Integer;
    procedure DoCleanUp;
    Procedure MoveObject(From:Integer; ADir:TPacManDirection; Const ASpeed:Double);
    Function RandomDir(Options:TSetOfDirection):TPacManDirection;
    procedure SetChartAxis;
    Procedure CreateGame;
    procedure CreateNewGame;
    Procedure ChangeScore(NewScore:Integer);
    Procedure ChangeLives(NewLives:Integer);
    Procedure EndGame(Win:Boolean);
    Procedure LoadGame(Const FileName:String);
    Procedure SaveGame(Const FileName:String);
    Procedure ProcessHit(FromObject,ToObject:Integer);
    Procedure GuessMan;
    Function HorizVertWall( ListA,ListB:TChartValueList;
                            From:Integer; Const num:Double ):Integer;
  public
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses Math, TeCanvas;

Const AllDirections=[pdLeft,pdRight,pdTop,pdBottom];

{ Default Map }
{
  x  =   Wall
  o  =   Target (Money)
  r  =   Red Monster
  g  =   Green Monster
  p  =   TeePac Man !!!
}
Const PacMap:Array[0..12] of String=
(  'xxxxxxxxxxxxxxx',
   'xoooooooooooxox',
   'xoxxxoxoxoxxxox',
   'xoooxoxoxooooox',
   'xxxoxoxoxxxxxox',
   'xoooxoxooooooox',
   'xoxxrrrxxoxxxox',
   'xoooxxxoooxooox',
   'xxoooxoooxxoxxx',
   'xooxxxxxooxooox',
   'xoooxoxoooxoxox',
   'xoxoopooxoxoxgx',
   'xxxxxxxxxxxxxxx'
);

{ Color constants }
const PacWallColor     =clTeal;
      PacTargetColor   =clNavy;
      PacManColor      =clYellow;
      PacMonster1Color =clRed;
      PacMonster2Color =clLime;

      PacManSpeed      =25;
      PacMonsterSpeed  =25;
      Radius           =50;

Procedure TTeePacForm.GuessMan;
Var t:Integer;
begin
  Man:=-1;

  for t:=0 to Walls.Count-1 do
  if Walls.ValueColor[t]=PacManColor then
  begin
    Man:=t;
    break;
  end;

  if Man<>-1 then
     Walls.SwapValueIndex(Man,Walls.Count-1);

  Man:=Walls.Count-1;
end;

{ This procedure CLEARS and RESETS the Game }
Procedure TTeePacForm.CreateGame;

  Procedure ProcessMap(WallsOnly:Boolean);
  Var t,
      tt,
      tmpX,
      tmpY    : Integer;
      MapChar : Char;
      tmpSt   : String;

      Procedure AddElement(Element:Integer);
      begin
        Walls.AddBubble(tmpX,tmpY,Radius,'',Element);
      end;

  begin
    for t:=TeeMap.Count-1 downto 0 do
    begin
      tmpY:=100*((TeeMap.Count-1-t))+Radius;
      tmpSt:=TeeMap.Strings[t];
      for tt:=1 to Length(tmpSt) do
      begin
        MapChar:=tmpSt[tt];
        tmpX:=100*(tt-1)+Radius;
        if WallsOnly then
        begin
          if MapChar='x' then AddElement(PacWallColor)
          else
          if MapChar='o' then
          begin
            Walls.AddBubble( tmpX,tmpY, Radius div 2, '', PacTargetColor);
            Inc(NumTargets);
          end;
        end
        else
        Case MapChar of
          'p': AddElement(PacManColor);
          'r',
          'g': if MapChar='r' then AddElement(PacMonster1Color)
                              else AddElement(PacMonster2Color);
        end;
      end;
    end;
  end;

var t : Integer;
begin
  NumTargets:=0;
  Walls.Clear;
  Walls.XValues.Order:=loNone;
  Walls.YValues.Order:=loNone;
  Randomize;
  TeeEraseBack:=False;
  Zoomed:=False;
  ChangeScore(0);
  ChangeLives(4);
  Label1.Caption:='0';
  FirstKey:=True;
  Walls.Pointer.InflateMargins:=False;
  Walls.Squared:=False;
  ProcessMap(True);
  ProcessMap(False);
  HorizBarSeries1.XValues[0]:=NumTargets;

  ManDir:=pdStop;

  GuessMan;
  if Man<>-1 then
  begin
    OriginManX:=Walls.XValues[Man];
    OriginManY:=Walls.YValues[Man];
  end;

  for t:=1 to MaxMonsters do MonsterDir[t]:=pdStop;
  CheckNewDirs:=False;
end;

{ This procedure RESETS AND CREATES THE DEFAULT GAME }
procedure TTeePacForm.CreateNewGame;
var t : Integer;
begin
  TeeMap.Clear;
  for t:=Low(PacMap) to High(PacMap) do TeeMap.Add(PacMap[t]);
  CreateGame;
end;

procedure TTeePacForm.FormShow(Sender: TObject);
var tmp : TCustomForm;
begin
  OldTime:=0;
  IdleSpeed:=100;
  Speed:=10;

  TeeMap:=TStringList.Create;

  With Chart1 do
  begin
    ApplyZOrder:=False;
    Legend.Visible:=False;
    View3D:=True;
    Axes.Visible:=True;
    BackColor:=clAqua;
  end;

  HorizBarSeries1.Clear;
  HorizBarSeries1.Add(100,'',clTeeColor);

  if ParamCount=1 then LoadGame(ParamStr(1));
  if Walls.Count=0 then CreateNewGame;

  Changed:=False;
  SpeedButton6.Down:=True;
  SpeedButton7.Down:=True;
  Application.OnIdle:=AppOnIdle;

  // Fix when this form is embedded inside another Form
  tmp:=GetParentForm(Self);

  if Assigned(tmp) and (tmp is TForm) then
  begin
    (tmp as TForm).OnKeyDown:=FormKeyDown;
    tmp.KeyPreview:=True;
    SetFocus;
  end;
end;

procedure TTeePacForm.AppOnIdle(Sender: TObject; var Done: Boolean);
Var Hitted : Integer;

    Function OppositeDir(tmpDir:TPacManDirection):TPacManDirection;
    begin
      Case tmpDir of
        pdLeft: result:=pdRight;
        pdRight: result:=pdLeft;
        pdTop: result:=pdBottom;
      else
        {pdBottom:} result:=pdTop;
      end;
    end;

  Procedure ProcessMonster(Monster:Integer; Var ADir:TPacManDirection);

    Function CheckDir(tmpDir:TPacManDirection):Boolean;
    begin
      result:=False;
      if (tmpDir<>ADir) and (tmpDir<>OppositeDir(ADir)) then
      begin
        Hitted:=CrashDirection( Monster, tmpDir, PacMonsterSpeed);
        if (Hitted=-1) or (Walls.ValueColor[Hitted]=PacTargetColor) then
        begin
          ADir:=tmpDir;
          result:=True;
        end;
      end;
    end;

    Function CheckAllDirections:Boolean;

      Procedure CheckCase(CaseNum:Integer);
      begin
        Case CaseNum of
          0: result:= CheckDir(pdLeft) or
                      CheckDir(pdRight) or
                      CheckDir(pdTop) or
                      CheckDir(pdBottom);
          1: result:= CheckDir(pdRight) or
                      CheckDir(pdTop) or
                      CheckDir(pdBottom) or
                      CheckDir(pdLeft);
          2: result:= CheckDir(pdTop) or
                      CheckDir(pdBottom) or
                      CheckDir(pdLeft) or
                      CheckDir(pdRight);
          3: result:= CheckDir(pdBottom) or
                      CheckDir(pdLeft) or
                      CheckDir(pdRight) or
                      CheckDir(pdTop);
        end
      end;

    var Difx,
        Dify : Double;
    Begin
      if Random(100)<15 then CheckCase(Random(4))
      else
      begin
        difx:=Walls.XValues[Man]-Walls.XValues[Monster];
        dify:=Walls.YValues[Man]-Walls.YValues[Monster];
        if Abs(difx)<Abs(dify) then
        begin
          if difx>0 then CheckCase(1)
                    else CheckCase(0);
        end
        else
        begin
          if dify>0 then CheckCase(2)
                    else CheckCase(3);
        end;
      end;
    end;

  Var tmpCol : TColor;
  begin
    Hitted:=CrashDirection( Monster, ADir, PacMonsterSpeed);
    if Hitted<>-1 then tmpCol:=Walls.ValueColor[Hitted]
                  else tmpCol:=-1;
    if (Hitted=-1) or (tmpCol=PacTargetColor) then
    begin
      MoveObject(Monster,ADir,PacMonsterSpeed);
      if CheckNewDirs then
         if CheckAllDirections then CheckNewDirs:=False;
    end
    else
    if Hitted=Man then ProcessHit(Monster,Man)
    else
    begin
      if not CheckAllDirections then
      begin
        CheckNewDirs:=True;
        ADir:=OppositeDir(ADir);
      end;
      Hitted:=CrashDirection( Monster, ADir, PacMonsterSpeed);
      if (Hitted=-1) or (Walls.ValueColor[Hitted]=PacTargetColor) then
         MoveObject(Monster,ADir,PacMonsterSpeed)
    end;
  end;

var NumMonster,
    t           : Integer;
    tmp         : TColor;
begin
  if ({$IFDEF LINUX}Clock{$ELSE}GetTickCount{$ENDIF}-OldTime)>IdleSpeed then
  begin
    if not FirstKey then
    begin
      if ManDir<>pdStop then
      begin
        Hitted:=CrashDirection( Man, ManDir, PacManSpeed);
        if Hitted=-1 then MoveObject(Man,ManDir,PacManSpeed)
                     else
                     begin
                       if Walls.ValueColor[Hitted]=PacTargetColor then
                          MoveObject(Man,ManDir,PacManSpeed)
                       else
                          ManDir:=pdStop;
                       ProcessHit(Man,Hitted);
                     end;
      end;


      NumMonster:=0;
      for t:=0 to Walls.Count-1 do
      begin
        tmp:=Walls.ValueColor[t];
        if (tmp=PacMonster1Color) or (tmp=PacMonster2Color) then
        begin
          Inc(NumMonster);
          ProcessMonster(t,MonsterDir[NumMonster]);
        end;
      end;
      IdleSpeed:=NumMonster*Speed;

      if Zoomed then SetChartAxis;
    end;
    OldTime:={$IFDEF LINUX}Clock{$ELSE}GetTickCount{$ENDIF};
  end;
  Done := FirstKey;
end;

Function TTeePacForm.HorizVertWall( ListA,ListB:TChartValueList;
                                    From:Integer; Const num:Double ):Integer;
Var tmp0 : Double;
    tmp1 : Double;

   Function Intersect(t:Integer):Boolean;
   Var b0,
       b1 : Double;
   Begin
     if Abs(num-ListB.Value[t])<Radius then
     begin
       b0:=ListA.Value[t]-Radius;
       b1:=b0+2*Radius;
       result:=(
                ((tmp0>b0) and (tmp0<b1)) or
                ((tmp1>b0) and (tmp1<b1)) or
                ((tmp0=b0) and (tmp1=b1))
              );
     end
     else result:=False;
   end;

Var t : Integer;
begin
  result:=-1;
  tmp0:=ListA.Value[From]-Radius;
  tmp1:=tmp0+2*Radius;
  for t:=0 to Walls.Count-1 do
  if t<>From then
    if Intersect(t) then
    begin
      result:=t;
      exit;
    end;
end;

{ This Function returns the "hitted" object when moving horizontal }
Function TTeePacForm.HorizWall( From:Integer; Const X:Double):Integer;
begin
  result:=HorizVertWall(Walls.YValues,Walls.XValues,From,X);
end;

{ This Function returns the "hitted" object when moving Vertical }
Function TTeePacForm.VertWall( From:Integer; Const Y:Double):Integer;
begin
  result:=HorizVertWall(Walls.XValues,Walls.YValues,From,Y);
end;

{ This method changes and repaints the SCORE }
Procedure TTeePacForm.ChangeScore(NewScore:Integer);
Begin
  Score:=NewScore;
  Label1.Caption:=IntToStr(Score);
end;

{ This method is called when PacMan EATS a Target object (Money) }
Procedure TTeePacForm.Eated(ValueIndex:Integer);
Begin
  Walls.Delete(ValueIndex);
  GuessMan;
  ChangeScore(Score+5);
  Dec(NumTargets);
  { change the progress horiz bar chart }
  HorizBarSeries1.XValues[0]:=NumTargets;
  if NumTargets=0 then EndGame(True);
end;

{ This method changes and repaints the LIVES }
Procedure TTeePacForm.ChangeLives(NewLives:Integer);
Begin
  Lives:=NewLives;
  Label4.Caption:=IntToStr(Lives);
end;

{ This method is called when PacMan and Monster have collisioned }
Procedure TTeePacForm.EatedMonster(ValueIndex:Integer);
Begin
  Walls.Delete(ValueIndex);
  ChangeLives(Lives-1);
  GuessMan;
  ManDir:=pdStop;
  Walls.XValues[Man]:=OriginManX;
  Walls.YValues[Man]:=OriginManY;
  if Lives=0 then EndGame(False);
end;

Procedure TTeePacForm.ProcessHit(FromObject,ToObject:Integer);
Var FromColor,
    ToColor    : TColor;
Begin
  FromColor:=Walls.ValueColor[FromObject];
  ToColor:=Walls.ValueColor[ToObject];
  if ToColor=PacTargetColor then
  begin
    if FromColor=PacManColor then Eated(ToObject);
  end
  else
  if (ToColor=PacMonster1Color) or
     (ToColor=PacMonster2Color) then
  begin
    if FromColor=PacManColor then EatedMonster(ToObject);
  end
  else
  if ToColor=PacManColor then
     if FromColor<>PacManColor then EatedMonster(FromObject);
end;

{ This method handles the PacMan and Monsters movements }
Function TTeePacForm.CrashDirection( From:Integer;
                                ADir:TPacManDirection;
                                Const tmpSpeed:Double):Integer;
begin
  result:=-1;
  Case ADir of
    pdLeft:  result:=HorizWall(From,Walls.XValues[From]-Radius-tmpSpeed);
    pdRight: result:=HorizWall(From,Walls.XValues[From]+Radius+tmpSpeed);
    pdTop:   result:=VertWall(From,Walls.YValues[From]+Radius+tmpSpeed);
    pdBottom:result:=VertWall(From,Walls.YValues[From]-Radius-tmpSpeed);
  end;
end;

Procedure TTeePacForm.MoveObject(From:Integer; ADir:TPacManDirection; Const ASpeed:Double);
begin
  With Walls do
  Case ADir of
   pdleft:   XValues[From]:=XValues[From]-ASpeed;
   pdright:  XValues[From]:=XValues[From]+ASpeed;
   pdtop:    YValues[From]:=YValues[From]+ASpeed;
   pdbottom: YValues[From]:=YValues[From]-ASpeed;
  end;

  Chart1.Invalidate;
end;

{ This method adjusts chart AXIS when in ZOOM mode }
{ The PacMan is always in the chart center }
procedure TTeePacForm.SetChartAxis;
Var X,
    Y  : Double;
begin
  if Man<>-1 then
  begin
    X:=Walls.XValues[Man];
    Chart1.BottomAxis.SetMinMax(X-Radius-350,X+Radius+350);
    Y:=Walls.YValues[Man];
    Chart1.LeftAxis.SetMinMax(Y-Radius-350,Y+Radius+350);
  end;
end;

{ This function returns a random direction (Left, Right, Top or Bottom)  }
Function TTeePacForm.RandomDir(Options:TSetOfDirection):TPacManDirection;
Begin
  if Options=[] then result:=pdStop
  else
  Repeat
    result:=TPacManDirection(Random(Ord(High(TPacManDirection))));
  Until result in Options;
end;

{ This function returns the corresponding POINT STYLE }
{ for Walls and Targets.
  Walls   = Rectangle
  Targets = Ellipse
}
function TTeePacForm.WallsGetPointerStyle(Sender: TChartSeries;
  ValueIndex: Integer): TSeriesPointerStyle;
begin
  if Sender.ValueColor[ValueIndex]=PacWallColor then result:=psRectangle
                                                else result:=psCircle;
end;

{ When user undos zoom with right mouse button }
procedure TTeePacForm.Chart1UndoZoom(Sender: TObject);
begin
  Zoomed:=False;
end;

{ Toggle Zoom On/Off }
procedure TTeePacForm.Zoomed1Click(Sender: TObject);
begin
  Zoomed1.Checked:=not Zoomed1.Checked;
  Zoomed:=Zoomed1.Checked;
  if Zoomed then
  begin
    SetChartAxis;
  end
  else
  begin
    Chart1.LeftAxis.Automatic:=True;
    Chart1.BottomAxis.Automatic:=True;
  end;
end;

{ Toggle View Axis On/Off }
procedure TTeePacForm.ShowAxis1Click(Sender: TObject);
begin
  ShowAxis1.Checked:=not ShowAxis1.Checked;
  Chart1.Axes.Visible:=ShowAxis1.Checked;
end;

{ Toggle View 3D On/Off }
procedure TTeePacForm.N3Dimensions1Click(Sender: TObject);
begin
  N3Dimensions1.Checked:=not N3Dimensions1.Checked;
  Chart1.View3d:=N3Dimensions1.Checked;
end;

{ Bye, Bye !! }
procedure TTeePacForm.QuittAltX1Click(Sender: TObject);
begin
  Close;
end;

{ Ask the user confirmation for a new game... }
procedure TTeePacForm.New1Click(Sender: TObject);
begin
  if MessageDlg('Re-Start Game ?', mtConfirmation, [mbYes,mbNo],0)=mrYes then
     CreateNewGame;
end;

{ Ask the User's Name when User Wins !!! }
Procedure TTeePacForm.EndGame(Win:Boolean);
var tmpSt : String;
begin
  FirstKey:=True;
  if Win then
  begin
    tmpSt:='Me, the Winner';
    if InputQuery('Congratulations !','Enter Your Name:',tmpSt) then
    begin
      with TIniFile.Create('teepac.ini') do
      try
        WriteString('Ranking',tmpSt,IntToStr(Score));
      finally
        Free;
      end;
    end;
  end
  else ShowMessage('Sorry. Try Again !');
  CreateNewGame;
end;

{ Try to Open a stored Game }
procedure TTeePacForm.Open1Click(Sender: TObject);
begin
  OpenDialog1.FileName:='';
  if OpenDialog1.Execute then LoadGame(OpenDialog1.FileName);
end;

{ Try to Save the current Game to Disk }
procedure TTeePacForm.Save1Click(Sender: TObject);
begin
  if SaveDialog1.FileName='' then SaveDialog1.FileName:='default.tee';
  if SaveDialog1.Execute then SaveGame(SaveDialog1.FileName);
end;

{ Load a Game from Disk }
Procedure TTeePacForm.LoadGame(Const FileName:String);
var t     : Integer;
    tmpSt : String;
begin
  With TIniFile.Create(FileName) do
  try
    TeeMap.Clear;
    for t:=0 to 100 do
    begin
      tmpSt:=ReadString('TeePacMap',IntToStr(t),'');
      if tmpSt<>'' then
         TeeMap.Add(tmpSt);
    end;
    Zoomed1.Checked:=ReadBool('TeePacOptions','Zoomed',False);
    N3Dimensions1.Checked:=ReadBool('TeePacOptions','View3D',True);
    ShowAxis1.Checked:=ReadBool('TeePacOptions','ShowAxis',True);
    ShowLegend1.Checked:=ReadBool('TeePacOptions','ShowLegend',True);
    CreateGame;
  finally
    Free;
  end;
end;

{ Store a Game to Disk }
Procedure TTeePacForm.SaveGame(Const FileName:String);
var t : Integer;
begin
  With TIniFile.Create(FileName) do
  try
    EraseSection('TeePacMap');
    for t:=0 to TeeMap.Count-1 do WriteString('TeePacMap',IntToStr(t),TeeMap[t]);
    WriteBool('TeePacOptions','Zoomed',Zoomed1.Checked);
    WriteBool('TeePacOptions','View3D',N3Dimensions1.Checked);
    WriteBool('TeePacOptions','ShowAxis',ShowAxis1.Checked);
    WriteBool('TeePacOptions','ShowLegend',ShowLegend1.Checked);
    Changed:=False;
  finally
    Free;
  end;
end;

procedure TTeePacForm.DoCleanUp;
var tmp : TCustomForm;
begin
  Application.OnIdle:=nil;

  tmp:=GetParentForm(Self);
  if Assigned(tmp) and (tmp is TForm) then
  begin
    (tmp as TForm).OnKeyDown:=nil;
    tmp.KeyPreview:=False;
  end;

  FreeAndNil(TeeMap);
end;

{ Free allocated Map }
procedure TTeePacForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoCleanUp;
end;

procedure TTeePacForm.SpeedButton1Click(Sender: TObject);
begin
  Open1Click(Self);
end;

procedure TTeePacForm.SpeedButton2Click(Sender: TObject);
begin
  Save1Click(Self);
end;

procedure TTeePacForm.SpeedButton3Click(Sender: TObject);
begin
  New1Click(Self);
end;

procedure TTeePacForm.SpeedButton4Click(Sender: TObject);
begin
  Zoomed1Click(Self);
  SpeedButton4.Down:=Zoomed;
end;

procedure TTeePacForm.BitBtn1Click(Sender: TObject);
begin
  EditChart(Self,Chart1);
  Chart1.SetFocus;
end;

procedure TTeePacForm.SpeedButton5Click(Sender: TObject);
begin
  ShowLegend1Click(Self);
  SpeedButton5.Down:=Chart1.Legend.Visible;
end;

{ Ask User confirmation to Close and Quit }
procedure TTeePacForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=False;

  if Changed then
  begin
    if MessageDlg('Game Changed. Do you want to save it ?',
                  mtConfirmation,
                  [mbYes,mbNo],0)=mrYes then
    begin
      if SaveDialog1.FileName='' then
         SaveDialog1.FileName:='default.tee';

      if SaveDialog1.Execute then
      begin
        SaveGame(SaveDialog1.FileName);
        CanClose:=True;
      end
    end
    else Changed:=False;
  end
  else CanClose:=True;
end;

procedure TTeePacForm.SpeedButton6Click(Sender: TObject);
begin
  ShowAxis1Click(Self);
  SpeedButton6.Down:=Chart1.Axes.Visible;
end;

procedure TTeePacForm.SpeedButton7Click(Sender: TObject);
begin
  N3Dimensions1Click(Self);
  SpeedButton7.Down:=Chart1.View3D;
end;

{ Toggle LEGEND on / off }
procedure TTeePacForm.ShowLegend1Click(Sender: TObject);
begin
  ShowLegend1.Checked:=not ShowLegend1.Checked;
  Chart1.Legend.Visible:=ShowLegend1.Checked;
end;

{ This method draws the PacMan FACE (Eyes and Mouth) }
procedure TTeePacForm.WallsAfterDrawValues(Sender: TObject);
var tmpx1,
    tmpy1,
    tmpx2,
    tmpy2        : Integer;
    HalfWidth3d,
    HalfHeight3d : Integer;
    x3,y3,x4,y4,
    xrad,yrad,
    xcen,ycen    : Integer;

    Procedure DrawPie(SAngle,EAngle:Integer);
    var SSin,
        SCos  : Extended;
    begin
      SinCos(SAngle*pi/180.0,SSin,SCos);
      x3:=xcen+round(xrad*Scos);
      y3:=ycen+round(yrad*Ssin);
      SinCos(EAngle*pi/180.0,SSin,SCos);
      x4:=xcen+round(xrad*Scos);
      y4:=ycen+round(yrad*Ssin);
      With Chart1.Canvas do
      begin
        Pen.Style:=psSolid;
        Pen.Color:=Chart1.BackColor;
        Brush.Color:=Chart1.BackColor;
        Brush.Style:=bsSolid;
        Pie(tmpX1,tmpY1,tmpx2,tmpY2,x3,y3,x4,y4);
        Pen.Color:=clBlack;
        Pen.Style:=psSolid;
        Pen.Width:=1;
        MoveTo(xcen,ycen);
        LineTo(x3,y3);
        MoveTo(xcen,ycen);
        LineTo(x4,y4);
      end;
    end;

var tmpx,
    tmpy,
    EyePos : Integer;
    xx,
    yy     : Double;
begin
    HalfWidth3d:=0{Chart1.SeriesWidth3d div 2};
    HalfHeight3d:=0{Chart1.SeriesHeight3d div 2};
    xx:=Walls.XValues[Man];
    tmpx1:=Walls.CalcXPosValue(xx-Radius)+HalfWidth3d;
    tmpx2:=Walls.CalcXPosValue(xx+Radius)+HalfWidth3d;
    yy:=Walls.YValues[Man];
    tmpy1:=Walls.CalcYPosValue(yy-Radius)-HalfHeight3d;
    tmpy2:=Walls.CalcYPosValue(yy+Radius)-HalfHeight3d;
    With Chart1.Canvas do
    begin
      xrad:=(tmpx2-tmpx1) div 2;
      yrad:=(tmpy2-tmpy1) div 2;
      xcen:=tmpx1+xrad;
      ycen:=tmpy1+yrad;

      Case ManDir of
        pdRight: DrawPie(345,15);
        pdLeft:  DrawPie(165,195);
        pdTop:   DrawPie(75,105);
        pdBottom: DrawPie(255,285);
        pdStop:  Begin
                   Pen.Style:=psSolid;
                   Pen.Color:=clBlack;
                   MoveTo(xcen-(xrad div 2),ycen);
                   LineTo(xcen+(xrad div 2),ycen);
                 end;
      end;

      Pen.Width:=2;
      if ManDir=pdTop then EyePos:=-(yrad div 2)
                      else EyePos:=+(yrad div 2);
      tmpy:=ycen+EyePos;
      if ManDir=pdStop then
      begin
        tmpx:=(xrad div 3);
        MoveTo(xcen-tmpx,tmpy);
        LineTo(xcen-tmpx,tmpy);
        MoveTo(xcen+tmpx,tmpy);
        LineTo(xcen+tmpx,tmpy);
      end
      else
      begin
        MoveTo(xcen+(xrad div 6),tmpy);
        LineTo(xcen+(xrad div 6)-1,tmpy-1);
      end;
    end;
end;

{ When a key is pressed down...  }
{ PacMan is assigned a DIRECTION }
{ If we are beggining the game, Monsters are assigned a RANDOM DIRECTION }
procedure TTeePacForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var OldDirection : TPacManDirection;
    t,
    tmp          : Integer;
begin
  if FirstKey then
  begin
    for t:=1 to MaxMonsters do
        MonsterDir[t]:=RandomDir(AllDirections);

    FirstKey:=False;
  end;

  OldDirection:=ManDir;

  Case Key of
    {$IFDEF CLX}Key_Left {$ELSE}VK_LEFT {$ENDIF} :  ManDir:=pdLeft;
    {$IFDEF CLX}Key_Right{$ELSE}VK_RIGHT{$ENDIF} :  ManDir:=pdRight;
    {$IFDEF CLX}Key_Up   {$ELSE}VK_UP   {$ENDIF} :  ManDir:=pdTop;
    {$IFDEF CLX}Key_Down {$ELSE}VK_DOWN {$ENDIF} :  ManDir:=pdBottom;
    Ord('Z'):  Zoomed1Click(Self);
    Ord('3'):  N3Dimensions1Click(Self);
    Ord('A'):  ShowAxis1Click(Self);
  else
    exit;
  end;

  tmp:=CrashDirection( Man, ManDir, PacManSpeed);

  if (tmp<>-1) and (Walls.ValueColor[tmp]=PacWallColor) then
     ManDir:=OldDirection;
end;

procedure TTeePacForm.FormDestroy(Sender: TObject);
begin
  DoCleanUp;
end;

procedure TTeePacForm.Slow1Click(Sender: TObject);
begin
  Slow1.Checked:=True;
  Speed:=100;
end;

procedure TTeePacForm.Normal1Click(Sender: TObject);
begin
  Normal1.Checked:=True;
  Speed:=10;
end;

procedure TTeePacForm.Fast1Click(Sender: TObject);
begin
  Fast1.Checked:=True;
  Speed:=1;
end;

initialization
  RegisterClass(TTeePacForm);
end.

