unit Unit_Common_Tests;
{$I TeeDefs.inc}

interface

function Test_VersionString:String;

function IDE:String;

function IDEName(VersionNum:Integer; IsDelphi:Boolean=True):String; // ie: 20 = XE5

implementation

uses
  {$IFDEF FMI}
  FMXTee_Constants, FMXTee_Procs
  {$ELSE}
  {$IFDEF FMX}
  FMXTee.Constants, FMXTee.Procs
  {$ELSE}
  TeeConst, TeeProcs
  {$ENDIF}
  {$ENDIF}
  ;

function IDEName(VersionNum:Integer; IsDelphi:Boolean=True):String; // ie: 20 = XE5

  function Language:String;
  begin
    if IsDelphi then
       result:='Delphi '
    else
       result:='C++ ';
  end;

begin
  if VersionNum<=8 then
     result:=Language+TeeStr(VersionNum)
  else
  case VersionNum of
    9: result:=Language+'2005';
   10: result:=Language+'2006';
   11: result:=Language+'2007';
   12: result:=Language+'2009';
   13: result:='BAD LUCK !!!';
   14: result:=Language+'2010';
   15: result:='XE';
   16: result:='XE2';
   17: result:='XE3';
   18: result:='XE4';
   19: result:='XE5';
   20: result:='XE6';
   21: result:='XE7';
  else
    result:='BAD VERSION NUM: '+TeeStr(VersionNum);
  end;
end;

function PlatformToString:String;
begin
  {$IFDEF CPUX64}
  result:='64 bit';
  {$ELSE}
  result:='32 bit';
  {$ENDIF}
end;

function IDE:String;
begin
  result:='?';

  {$IFDEF D1}
  result:=IDEName(1);
  {$ENDIF}

  {$IFDEF D2}
  result:=IDEName(2);
  {$ENDIF}

  {$IFDEF D3}
  result:=IDEName(3);
  {$ENDIF}

  {$IFDEF D4}
  result:=IDEName(4);
  {$ENDIF}

  {$IFDEF D5}
  result:=IDEName(5);
  {$ENDIF}

  {$IFDEF D6}
  result:=IDEName(6);
  {$ENDIF}

  {$IFDEF D7}
  result:=IDEName(7);
  {$ENDIF}

  {$IFDEF D8}
  result:=IDEName(8);
  {$ENDIF}

  {$IFDEF D9}
  result:=IDEName(9);
  {$ENDIF}

  {$IFDEF D10}
  result:=IDEName(10);
  {$ENDIF}

  {$IFDEF D11}
  result:=IDEName(11);
  {$ENDIF}

  {$IFDEF D12}
  result:=IDEName(12);
  {$ENDIF}

  {$IFDEF D14}
  result:=IDEName(14);
  {$ENDIF}

  {$IFDEF D15}
  result:=IDEName(15);
  {$ENDIF}

  {$IFDEF D16}
  result:=IDEName(16);
  {$ENDIF}

  {$IFDEF D17}
  result:=IDEName(17);
  {$ENDIF}

  {$IFDEF D18}
  result:=IDEName(18);
  {$ENDIF}

  {$IFDEF D19}
  result:=IDEName(19);
  {$ENDIF}

  {$IFDEF D20}
  result:=IDEName(20);
  {$ENDIF}

  {$IFDEF D21}
  result:=IDEName(21);
  {$ENDIF}

  {$IFDEF D22}
  result:=IDEName(22);
  {$ENDIF}

  {$IFDEF D23}
  result:=IDEName(23);
  {$ENDIF}

  {$IFDEF D24}
  result:=IDEName(24);
  {$ENDIF}

  {$IFDEF D25}
  result:=IDEName(25);
  {$ENDIF}

  result:=result+' '+PlatformToString;
end;

function Test_VersionString:String;
begin
  {$IFDEF FMI}
  result:='FMI';
  {$ELSE}
  {$IFDEF FMX}
  result:='FMX';
  {$ELSE}
  result:='VCL';
  {$ENDIF}
  {$ENDIF}

  result:=result+' '+TeeVCLBuildVersion+' '+IDE;
end;

end.
