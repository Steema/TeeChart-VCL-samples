unit UVis;

// Steema Software SL
// https://www.steema.com
//
// Example project. Retrieve data from Arduino.
//
// Arduino code:
// ===============================================
// void setup() {
//   Serial.begin(9600); //Start the Serial connection
// }
// void loop() {
//   if (Serial.available())
//   {
//     char startB = Serial.read(); //read input via serial port
//     if (startB == 'g') //wait for call for data from Delphi app
//     {
//       double sensorValue = analogRead(A0);
//       float piezoV = sensorValue / 1023.0 * 5.0; //contextualise data
//       Serial.println(piezoV); //return data to Delphi app
//     }
//   }
// }


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  Vcl.ExtCtrls, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.TeeComma,
  OoMisc, AdPort, VCLTee.Series, VCLTee.TeeTools;

type
  TForm8 = class(TForm)
    ApdComPort1: TApdComPort;
    TeeCommander1: TTeeCommander;
    Chart1: TChart;
    Button1: TButton;
    Button2: TButton;
    Series1: TLineSeries;
    panel1: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    ChartTool1: TColorLineTool;
    ChartTool2: TAnnotationTool;
    procedure Button1Click(Sender: TObject);
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AddLastChartVal;
    procedure CheckAxes;
  private
    { Private declarations }
    FStatusTrigger  : Word;
    PendingStr : String;
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  ttTimeout : Word;

implementation

{$R *.dfm}

procedure TForm8.AddLastChartVal;
Var
 i : Integer;
 val : Double;
 InStr : String;
begin
  if Length(PendingStr)>0 then
  Begin
    for i:= 0 to Length(PendingStr) do
    Begin
      // cleanup the input to candidate as numeric
      if ((PendingStr[i] >= '0') and (PendingStr[i] <= '9')) or ((PendingStr[i] = '.') and (InStr.CountChar('.')=0)) then
        InStr := InStr + PendingStr[i];
    End;
    val := StrToFloat(InStr);
    // add data to chart with timestamp
    Series1.AddXY(now,val);
    CheckAxes;
    // clear data string to start again
    PendingStr := '';
  End;
end;

procedure TForm8.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var
  I : Word;
  C : AnsiChar;
  S : String;
  Val : Double;
begin
  // data doesn't return in one call so it's being collected
  // to build a composite string, called PendingStr, to contain
  // the full data value.
  S := '';
  for I := 1 to Count do begin
    C := ApdComPort1.GetChar;
    case C of
      #0..#31 : {Don't process} ;
      else S := S + C;
    end;
  end;
  PendingStr := PendingStr + S;
  if Memo1.Visible then
    Memo1.Lines.Add(S);
end;

procedure TForm8.Button1Click(Sender: TObject);
Var
  Val : String;
begin
  ApdComPort1.PutChar('g');
  Timer1.Enabled:=True;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  timer1.Enabled := False;
end;

procedure TForm8.CheckAxes;
begin
  if Series1.LastDisplayedIndex-Series1.FirstDisplayedIndex  > 40 then
    Chart1.Axes.Bottom.SetMinMax(Series1.XValues[Series1.FirstDisplayedIndex+1],
                                 Series1.XValues[Series1.LastDisplayedIndex+1]);
end;

procedure TForm8.FormShow(Sender: TObject);
begin
  // setup port (already set to 9,600 baud rate)
  ApdComPort1.ComNumber := 3;
  //connect up the data-in event
  if (FStatusTrigger = 0) then
  begin
        FStatusTrigger := ApdComPort1.AddStatusTrigger(stLine);
        ApdComPort1.SetStatusTrigger(FStatusTrigger,
                                     lsOverrun or lsParity or lsFraming or lsBreak,
                                     True);
  end;
  // For this sensor we know the data is coming in within this data range
  // so am setting Left Axis Min Max accordingly
  Chart1.Axes.Left.SetMinMax(-1,4);
  ChartTool1.Value := 2.5;   //colorline as threshold line
end;

procedure TForm8.Timer1Timer(Sender: TObject);
begin
  AddLastChartVal();
  //this is the call for a new data reading
  ApdComPort1.PutChar('g');
end;

end.
