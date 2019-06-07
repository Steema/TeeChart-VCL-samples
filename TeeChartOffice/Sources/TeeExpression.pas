{**************************************************}
{  Expression Evaluator and Series DataSource      }
{  Copyright (c) 2010-2019 by Steema Software      }
{**************************************************}
unit TeeExpression;
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
  {$IFDEF D18}
  System.Types,
  {$ENDIF}
  TeEngine, TeeSourceEdit;

Const TeeNumberE = 2.71828182845904524;

type
  { Object to evaluate expressions }
  TTeeEvaluator=class(TStringList)
  private
    FExpression : String;
    FVariables  : TStringList;
    Function FunctionIndex(Const S:String):Integer;
    Procedure SetExpression(Const S:String);
  public
    Constructor Create;
    Destructor Destroy; override;

    Function Calculate(Const X:Double=0):Double;
    Function Prepare(Const S:String):Boolean;

    property Expression: String read FExpression write SetExpression;
    property Variables: TStringList read FVariables;
  end;

  { Series Source that evaluates expressions and adds points }
  TTeeExpressionSource=class(TTeeSeriesSource)
  private
    FRangeFrom  : Double;
    FRangeTo    : Double;
    FStep       : Double;
    FEvaluator  : TTeeEvaluator;
    function GetExpression: String;
    procedure SetExpression(const Value: String);
  public
    Constructor Create(AOwner:TComponent); override;
    Destructor Destroy; override;

    Function Calculate(Const X:Double):Double;
    class Function Description:String; override;
    class Function Editor:TComponentClass; override;
    Procedure Load; override;

    property Evaluator:TTeeEvaluator read FEvaluator;
  published
    property Expression:String read GetExpression write SetExpression;
    property RangeFrom:Double read FRangeFrom write FRangeFrom;
    property RangeTo:Double read FRangeTo write FRangeTo;
    property Step:Double read FStep write FStep;
  end;

  { Form to edit Expression Sources }
  TExpressionSourceEdit = class(TBaseSourceEditor)
    EditExpression: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ERangeFrom: TEdit;
    ERangeTo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EStep: TEdit;
    procedure ERangeFromChange(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    DataSource: TTeeExpressionSource;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses
   TeeChartOfficeConstants
   {$IFDEF CPUX64}
   , Math
   {$ENDIF}
   ;

Const TeeMsg_WrongExpression = 'Wrong expression.';
      TeeMsg_ExpressionEmpty = 'Expression is empty.';
      TeeMsg_StepIsZero      = 'Step should be different than zero.';
      TeeMsg_SeriesIsEmpty   = 'No Series is selected.';
      TeeMsg_NotValidExpression = 'Expression: [ %s ] not valid.';

procedure TExpressionSourceEdit.ERangeFromChange(Sender: TObject);
begin
  BApply.Enabled:=True;
end;

procedure TExpressionSourceEdit.BApplyClick(Sender: TObject);
begin
  inherited;

  { setup Expression object }
  with DataSource do
  begin
    Expression:=EditExpression.Text;
    RangeFrom:=StrToFloat(ERangeFrom.Text);
    RangeTo:=StrToFloat(ERangeTo.Text);
    Step:=StrToFloat(EStep.Text);
  end;

  CheckReplaceSource(DataSource);

  { fill Series }
  DataSource.Load;

  { disable Apply button }
  BApply.Enabled:=False;
end;

procedure TExpressionSourceEdit.FormShow(Sender: TObject);
begin
  inherited;

  LLabel.Visible:=False;
  CBSources.Visible:=False;

  if Assigned(TheSeries.DataSource) and
     (TheSeries.DataSource is TTeeExpressionSource) then
  begin
    { Series already has an Expression source }
    DataSource:=TTeeExpressionSource(TheSeries.DataSource);
    with DataSource do
    begin
      EditExpression.Text:=Expression;
      ERangeFrom.Text:=FloatToStr(RangeFrom);
      ERangeTo.Text:=FloatToStr(RangeTo);
      EStep.Text:=FloatToStr(Step);
    end;
    BApply.Enabled:=False;
  end
  else { create a temporary Expression source }
  begin
    DataSource:=TTeeExpressionSource.Create(TheSeries);
    BApply.Enabled:=True;
  end;
end;

procedure TExpressionSourceEdit.FormDestroy(Sender: TObject);
begin
  if not Assigned(DataSource.Series) then DataSource.Free;
  inherited;
end;

{ TTeeExpressionSource }
Constructor TTeeExpressionSource.Create(AOwner: TComponent);
begin
  inherited;
  FEvaluator:=TTeeEvaluator.Create;
end;

Destructor TTeeExpressionSource.Destroy;
begin
  Evaluator.Free;
  inherited;
end;

class function TTeeExpressionSource.Description: String;
begin
  result:=TeeMsg_Expression
end;

class function TTeeExpressionSource.Editor: TComponentClass;
begin
  result:=TExpressionSourceEdit;
end;

Function TTeeExpressionSource.Calculate(Const X:Double):Double;
begin
  result:=Evaluator.Calculate(X);
end;

Procedure TTeeExpressionSource.Load;
var tmpValue : Double;
begin
  { check Expression and Series are not empty }
  if Expression='' then
     Raise Exception.Create(TeeMsg_ExpressionEmpty);

  if not Assigned(Series) then
     Raise Exception.Create(TeeMsg_SeriesIsEmpty);

  if Step=0 then
     Raise Exception.Create(TeeMsg_StepIsZero);

  { check Expression formula }
  if Evaluator.Prepare(Evaluator.Expression) then
  begin
    { clear series points }
    Series.Clear;
    { add points }
    tmpValue:=RangeFrom;
    while tmpValue<RangeTo do
    begin
      if Series.YMandatory then
         Series.AddXY(tmpValue,Calculate(tmpValue))
      else
         Series.AddXY(Calculate(tmpValue),tmpValue);

      tmpValue:=tmpValue+Step;
    end;
  end
  else Raise Exception.Create(Format(TeeMsg_NotValidExpression,[Expression]));
end;

function TTeeExpressionSource.GetExpression: String;
begin
  result:=Evaluator.Expression;
end;

procedure TTeeExpressionSource.SetExpression(const Value: String);
begin
  Evaluator.Expression:=Value;
end;

{$IFNDEF CPUX64}
{ from Borlands RTL Math.pas unit }
function IntPower(Base: Extended; Exponent: Integer): Extended;
asm
        mov     ecx, eax
        cdq
        fld1                      { Result := 1 }
        xor     eax, edx
        sub     eax, edx          { eax := Abs(Exponent) }
        jz      @@3
        fld     Base
        jmp     @@2
@@1:    fmul    ST, ST            { X := Base * Base }
@@2:    shr     eax,1
        jnc     @@1
        fmul    ST(1),ST          { Result := Result * X }
        jnz     @@1
        fstp    st                { pop X from FPU stack }
        cmp     ecx, 0
        jge     @@3
        fld1
        fdivrp                    { Result := 1 / Result }
@@3:
        fwait
end;

function Tan(X: Extended): Extended;
{  Tan := Sin(X) / Cos(X) }
asm
  FLD    X
  FPTAN
  FSTP   ST(0)      { FPTAN pushes 1.0 after result }
  FWAIT
end;
{$ENDIF}

{ TTeeEvaluator }
Constructor TTeeEvaluator.Create;
begin
  inherited;
  FVariables:=TStringList.Create;
end;

Destructor TTeeEvaluator.Destroy;
begin
  FVariables.Free;
  inherited;
end;

{ returns True if S string is any of the embedded functions }
Function TTeeEvaluator.FunctionIndex(Const S:String):Integer;
Const Funcs:Array[0..7] of String=
   ('COS','SIN','LOG','EXP','SQR','SQRT','ABS','TAN');
var t: Integer;
begin
  result:=-1;
  for t:=Low(Funcs) to High(Funcs) do
  if Funcs[t]=S then
  begin
    result:=t;
    break;
  end;
end;

function TTeeEvaluator.Calculate(Const X:Double): Double;

  Procedure Error;
  begin
    Raise Exception.Create(TeeMsg_WrongExpression);
  end;

  { find variable or special numbers: X, Pi and E }
  Function GetIdent(Const S:String):Double;
  var tmp : String;
  begin
    if S='X' then result:=X
    else
    if S='PI' then result:=Pi
    else
    if S='E'  then result:=TeeNumberE
    else
    begin
      tmp:=Variables.Values[S];
      if tmp='' then result:=StrToFloat(S)
                else result:=StrToFloat(tmp);
    end;
  end;

var t: Integer;

  { calculate partial expression }
  Function NextValue:Double;
  var tmpFunc : Integer;
      Value   : Double;
      tmp     : Char;
  begin
    result:=0;
    Inc(t);
    if t<Count then
    begin
      Case Strings[t][1] of
        'I': result:=GetIdent(Copy(Strings[t],3,255)); { indentifier }
        'F': begin { embedded function ie: sin(x) }
               tmpFunc:=FunctionIndex(Copy(Strings[t],3,255));
               result:=NextValue;
               case tmpFunc of
                 0: result:=Cos(result*Pi/180.0);
                 1: result:=Sin(result*Pi/180.0);
                 2: result:=Ln(result);
                 3: result:=Exp(result);
                 4: result:=Sqr(result);
                 5: result:=Sqrt(result);
                 6: result:=Abs(result);
                 7: result:=Tan(result*Pi/180.0);
               else
                 Error;
               end;
             end;
        'O': begin
               tmp:=Strings[t][3];
               result:=NextValue;
               Value:=NextValue;
               case tmp of
                 '*': result:=result*Value;
                 '+': result:=result+Value;
                 '-': result:=result-Value;
                 '/': result:=result/Value;
                 '^': result:=IntPower(result,Round(Value));
               else Error;
               end;
             end;
      else
         Error;
      end;
    end;
  end;

begin
  if Count=0 then Raise Exception.Create(TeeMsg_ExpressionEmpty);
  { calculate first expression }
  t:=-1;
  result:=NextValue;
end;

{ validate expression and add tokens }
Function TTeeEvaluator.Prepare(Const S:String):Boolean;
var tmpIdent : String;

  Procedure AddIdent;
  begin { add Identifier to the stack }
    Add('I '+tmpIdent);
    tmpIdent:='';
  end;

  Procedure Error;
  begin
    Raise Exception.Create(TeeMsg_WrongExpression);
  end;

var t         : Integer;
    tmpLength : Integer;
    tmpSt     : String;
    tmpPos    : Integer;
begin
  { remove blanks }
  tmpSt:=S;
  t:=1;
  Repeat
    if tmpSt[t]=' ' then System.Delete(tmpSt,t,1)
                    else Inc(t);
  Until t>Length(tmpSt);

  { is empty? }
  result:=tmpSt<>'';

  if result then
  begin
    { start parsing }
    tmpSt:=UpperCase(tmpSt);
    tmpLength:=Length(tmpSt);
    tmpIdent:='';
    tmpPos:=0;

    { remove items }
    Clear;

    { loop }
    t:=1;
    while t<=tmpLength do
    begin
      Case tmpSt[t] of
        'A'..'Z',
        '0'..'9' : tmpIdent:=tmpIdent+tmpSt[t]; { identifier }

        '('      : if tmpIdent<>'' then
                   begin { is function ie: sin(x) }
                     if FunctionIndex(tmpIdent)<>-1 then
                     begin
                       Add('F '+tmpIdent);
                       tmpIdent:='';
                     end
                     else Error;
                   end
                   else
                     tmpPos:=Count-1; { is parent begin }

        ')'      : if tmpIdent<>'' then
                   begin { finish parent }
                     AddIdent;
                     tmpPos:=0;
                   end;
        '+','-',
        '*','/',
        '^'      : begin { is operator }
                     if tmpPos=0 then Insert(0,'O '+tmpSt[t])
                                 else Add('O '+tmpSt[t]);
                     if tmpIdent<>'' then AddIdent;
                   end;
      end;
      Inc(t);
    end;
    if tmpIdent<>'' then AddIdent;
  end;
end;

procedure TTeeEvaluator.SetExpression(const S: String);
begin
  if FExpression<>S then
     if Prepare(S) then FExpression:=S
end;

initialization
  RegisterClass(TTeeExpressionSource);
  TeeSources.Add(TTeeExpressionSource);
finalization
  TeeSources.Remove(TTeeExpressionSource);
end.
