{******************************************************************}
{                                                       	   }
{       Borland Delphi Runtime Library                  	   }
{       Performance Data Helper interface unit                     }
{ 								   }
{ Portions created by Microsoft are 				   }
{ Copyright (C) 1995-1999 Microsoft Corporation. 		   }
{ All Rights Reserved. 						   }
{ 								   }
{ The original file is: Pdh.pas, released 3 Dec 1999. 	           }
{ The original Pascal code is: Pdh.pas, released 3 Dec 1999.       }
{ The initial developer of the Pascal code is Marcel van Brakel    }
{ (brakelm@chello.nl).                      			   }
{ 								   }
{ Portions created by Marcel van Brakel are			   }
{ Copyright (C) 1999 Marcel van Brakel.				   }
{ 								   }
{ Obtained through:                               	           }
{ Joint Endeavour of Delphi Innovators (Project JEDI)              }
{								   }
{ You may retrieve the latest version of this file at the Project  }
{ JEDI home page, located at http://delphi-jedi.org                }
{								   }
{ The contents of this file are used with permission, subject to   }
{ the Mozilla Public License Version 1.1 (the "License"); you may  }
{ not use this file except in compliance with the License. You may }
{ obtain a copy of the License at                                  }
{ http://www.mozilla.org/NPL/NPL-1_1Final.html 	                   }
{                                                                  }
{ Software distributed under the License is distributed on an 	   }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or   }
{ implied. See the License for the specific language governing     }
{ rights and limitations under the License. 			   }
{ 								   }
{******************************************************************}

unit Pdh;
{$I TeeDefs.inc}

{$WEAKPACKAGEUNIT}

interface

{$HPPEMIT ''}
{$HPPEMIT '#include "pdh.h"'}
{$HPPEMIT ''}

uses
  Windows, WinPerf;

type
  DWORD_PTR = DWORD;

  PDH_STATUS = Longint;
  {$EXTERNALSYM PDH_STATUS}

const

// version info

  PDH_CVERSION_WIN40 = DWORD($0400);
  {$EXTERNALSYM PDH_CVERSION_WIN40}
  PDH_CVERSION_WIN50 = DWORD($0500);
  {$EXTERNALSYM PDH_CVERSION_WIN50}

// v1.1 revision of PDH -- basic log functions
// v1.2 of the PDH -- adds variable instance counters
// v1.3 of the PDH -- adds log service control & stubs for NT5/PDH v2 fn's
// v2.0 of the PDH -- is the NT v 5.0 B2 version

  PDH_VERSION        = DWORD((PDH_CVERSION_WIN50) + $0003);
  {$EXTERNALSYM PDH_VERSION}

// define severity masks

function IsSuccessSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsSuccessSeverity}
function IsInformationalSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsInformationalSeverity}
function IsWarningSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsWarningSeverity}
function IsErrorSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsErrorSeverity}

type

// data type definitions

  HCOUNTER = THandle;
  {$EXTERNALSYM HCOUNTER}
  HQUERY = THandle;
  {$EXTERNALSYM HQUERY}
  HLOG = THandle;
  {$EXTERNALSYM HLOG}

  PPdhRawCounter = ^TPdhRawCounter;
  _PDH_RAW_COUNTER = record
    CStatus: DWORD;
    TimeStamp: TFileTime;
    FirstValue: LONGLONG;
    SecondValue: LONGLONG;
    MultiCount: DWORD;
  end;
  {$EXTERNALSYM _PDH_RAW_COUNTER}
  TPdhRawCounter = _PDH_RAW_COUNTER;

  PPdhRawCounterItemA = ^TPdhRawCounterItemA;
  PPdhRawCounterItemW = ^TPdhRawCounterItemW;
  PPdhRawCounterItem = PPdhRawCounterItemA;
  _PDH_RAW_COUNTER_ITEM_A = record
    szName: PAnsiChar;
    RawValue: TPdhRawCounter;
  end;
  {$EXTERNALSYM _PDH_RAW_COUNTER_ITEM_A}
  _PDH_RAW_COUNTER_ITEM_W = record
    szName: PWideChar;
    RawValue: TPdhRawCounter;
  end;
  {$EXTERNALSYM _PDH_RAW_COUNTER_ITEM_W}
  _PDH_RAW_COUNTER_ITEM_ = _PDH_RAW_COUNTER_ITEM_A;
  TPdhRawCounterItemA = _PDH_RAW_COUNTER_ITEM_A;
  TPdhRawCounterItemW = _PDH_RAW_COUNTER_ITEM_W;
  TPdhRawCounterItem = TPdhRawCounterItemA;

  PPdhFmtCounterValue = ^TPdhFmtCounterValue;
  _PDH_FMT_COUNTERVALUE = record
    CStatus: DWORD;
    case Longint of
      1: (longValue: Longint);
      2: (doubleValue: Double);
      3: (largeValue: LONGLONG);
      4: (AnsiStringValue: LPSTR);
      5: (WideStringValue: LPWSTR);
  end;
  {$EXTERNALSYM _PDH_FMT_COUNTERVALUE}
  TPdhFmtCounterValue = _PDH_FMT_COUNTERVALUE;

  PPdhFmtCounterValueItemA = ^TPdhFmtCounterValueItemA;
  PPdhFmtCounterValueItemW = ^TPdhFmtCounterValueItemW;
  PPdhFmtCounterValueItem = PPdhFmtCounterValueItemA;
  _PDH_FMT_COUNTERVALUE_ITEM_A = record
    szName: PAnsiChar;
    FmtValue: TPdhFmtCounterValue;
  end;
  {$EXTERNALSYM _PDH_FMT_COUNTERVALUE_ITEM_A}
  _PDH_FMT_COUNTERVALUE_ITEM_W = record
    szName: PWideChar;
    FmtValue: TPdhFmtCounterValue;
  end;
  {$EXTERNALSYM _PDH_FMT_COUNTERVALUE_ITEM_W}
  _PDH_FMT_COUNTERVALUE_ITEM_ = _PDH_FMT_COUNTERVALUE_ITEM_A;
  TPdhFmtCounterValueItemA = _PDH_FMT_COUNTERVALUE_ITEM_A;
  TPdhFmtCounterValueItemW = _PDH_FMT_COUNTERVALUE_ITEM_W;
  TPdhFmtCounterValueItem = TPdhFmtCounterValueItemA;

  PPdhStatistics = ^TPdhStatistics;
  _PDH_STATISTICS = record
    dwFormat: DWORD;
    Count: DWORD;
    min: TPdhFmtCounterValue;
    max: TPdhFmtCounterValue;
    mean: TPdhFmtCounterValue;
  end;
  {$EXTERNALSYM _PDH_STATISTICS}
  TPdhStatistics = _PDH_STATISTICS;

  PPdhCounterPathElementsA = ^TPdhCounterPathElementsA;
  PPdhCounterPathElementsW = ^TPdhCounterPathElementsW;
  PPdhCounterPathElements = PPdhCounterPathElementsA;
  _PDH_COUNTER_PATH_ELEMENTS_A = record
    szMachineName: PAnsiChar;
    szObjectName: PAnsiChar;
    szInstanceName: PAnsiChar;
    szParentInstance: PAnsiChar;
    dwInstanceIndex: DWORD;
    szCounterName: PAnsiChar;
  end;
  {$EXTERNALSYM _PDH_COUNTER_PATH_ELEMENTS_A}
  _PDH_COUNTER_PATH_ELEMENTS_W = record
    szMachineName: PWideChar;
    szObjectName: PWideChar;
    szInstanceName: PWideChar;
    szParentInstance: PWideChar;
    dwInstanceIndex: DWORD;
    szCounterName: PWideChar;
  end;
  {$EXTERNALSYM _PDH_COUNTER_PATH_ELEMENTS_W}
  _PDH_COUNTER_PATH_ELEMENTS_ = _PDH_COUNTER_PATH_ELEMENTS_A;
  TPdhCounterPathElementsA = _PDH_COUNTER_PATH_ELEMENTS_A;
  TPdhCounterPathElementsW = _PDH_COUNTER_PATH_ELEMENTS_W;
  TPdhCounterPathElements = {$IFDEF UNICODE}TPdhCounterPathElementsW{$ELSE}TPdhCounterPathElementsA{$ENDIF};

  PPdhDataItemPathElementsA = ^TPdhDataItemPathElementsA;
  PPdhDataItemPathElementsW = ^TPdhDataItemPathElementsW;
  PPdhDataItemPathElements = PPdhDataItemPathElementsA;
  _PDH_DATA_ITEM_PATH_ELEMENTS_A = record
    szMachineName: PAnsiChar;
    ObjectGUID: TGUID;
    dwItemId: DWORD;
    szInstanceName: PAnsiChar;
  end;
  {$EXTERNALSYM _PDH_DATA_ITEM_PATH_ELEMENTS_A}
  _PDH_DATA_ITEM_PATH_ELEMENTS_W = record
    szMachineName: PWideChar;
    ObjectGUID: TGUID;
    dwItemId: DWORD;
    szInstanceName: PWideChar;
  end;
  {$EXTERNALSYM _PDH_DATA_ITEM_PATH_ELEMENTS_W}
  _PDH_DATA_ITEM_PATH_ELEMENTS_ = _PDH_DATA_ITEM_PATH_ELEMENTS_A;
  TPdhDataItemPathElementsA = _PDH_DATA_ITEM_PATH_ELEMENTS_A;
  TPdhDataItemPathElementsW = _PDH_DATA_ITEM_PATH_ELEMENTS_W;
  TPdhDataItemPathElements = TPdhDataItemPathElementsA;

  PPdhCounterInfoA = ^TPdhCounterInfoA;
  PPdhCounterInfoW = ^TPdhCounterInfoW;
  PPdhCounterInfo = {$IFDEF UNICODE}PPdhCounterInfoW{$ELSE}PPdhCounterInfoA{$ENDIF};
  _PDH_COUNTER_INFO_A = record
    dwLength: DWORD;
    dwType: DWORD;
    CVersion: DWORD;
    CStatus: DWORD;
    lScale: Longint;
    lDefaultScale: Longint;
    dwUserData: DWORD_PTR;
    dwQueryUserData: DWORD_PTR;
    szFullPath: PAnsiChar;
    Union: record
      case Longint of
        1: (DataItemPath: TPdhDataItemPathElementsA);
        2: (CounterPath: TPdhCounterPathElementsA);
        3: (szMachineName: PAnsiChar;
            szObjectName: PAnsiChar;
            szInstanceName: PAnsiChar;
            szParentInstance: PAnsiChar;
            dwInstanceIndex: DWORD;
            szCounterName: PAnsiChar);
    end;
    szExplainText: PAnsiChar;
    DataBuffer: array[0..0] of DWORD;
  end;
  {$EXTERNALSYM _PDH_COUNTER_INFO_A}
  _PDH_COUNTER_INFO_W = record
    dwLength: DWORD;
    dwType: DWORD;
    CVersion: DWORD;
    CStatus: DWORD;
    lScale: Longint;
    lDefaultScale: Longint;
    dwUserData: DWORD_PTR;
    dwQueryUserData: DWORD_PTR;
    szFullPath: PWideChar;
    Union: record
      case Longint of
        1: (DataItemPath: TPdhDataItemPathElementsW);
        2: (CounterPath: TPdhCounterPathElementsW);
        3: (szMachineName: PWideChar;
            szObjectName: PWideChar;
            szInstanceName: PWideChar;
            szParentInstance: PWideChar;
            dwInstanceIndex: DWORD;
            szCounterName: PWideChar);
    end;
    szExplainText: PWideChar;
    DataBuffer: array[0..0] of DWORD;
  end;
  {$EXTERNALSYM _PDH_COUNTER_INFO_W}
  _PDH_COUNTER_INFO_ = _PDH_COUNTER_INFO_A;
  TPdhCounterInfoA = _PDH_COUNTER_INFO_A;
  TPdhCounterInfoW = _PDH_COUNTER_INFO_W;
  TPdhCounterInfo = TPdhCounterInfoA;

  PPdhTimeInfo = ^TPdhTimeInfo;
  _PDH_TIME_INFO = record
    StartTime: LONGLONG;
    EndTime: LONGLONG;
    SampleCount: DWORD;
  end;
  {$EXTERNALSYM _PDH_TIME_INFO}
  TPdhTimeInfo = _PDH_TIME_INFO;

  PPdhRawLogRecord = ^TPdhRawLogRecord;
  _PDH_RAW_LOG_RECORD = record
    dwStructureSize: DWORD;
    dwRecordType: DWORD;
    dwItems: DWORD;
    RawBytes: array[0..0] of UCHAR;
  end;
  {$EXTERNALSYM _PDH_RAW_LOG_RECORD}
  TPdhRawLogRecord = _PDH_RAW_LOG_RECORD;

  PPdhLogServiceQueryInfoA = ^TPdhLogServiceQueryInfoA;
  PPdhLogServiceQueryInfoW = ^TPdhLogServiceQueryInfoW;
  PPdhLogServiceQueryInfo = PPdhLogServiceQueryInfoA;
  _PDH_LOG_SERVICE_QUERY_INFO_A = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwLogQuota: DWORD;
    szLogFileCaption: PAnsiChar;
    szDefaultDir: PAnsiChar;
    szBaseFileName: PAnsiChar;
    dwFileType: DWORD;
    dwReserved: DWORD;
    Union: record
      case Longint of
      1: (PdlAutoNameInterval: DWORD;
          PdlAutoNameUnits: DWORD;
          PdlCommandFilename: PAnsiChar;
          PdlCounterList: PAnsiChar;
          PdlAutoNameFormat: DWORD;
          PdlSampleInterval: DWORD;
          PdlLogStartTime: TFileTime;
          PdlLogEndTime: TFileTime);
      2: (TlNumberOfBuffers: DWORD;
          TlMinimumBuffers: DWORD;
          TlMaximumBuffers: DWORD;
          TlFreeBuffers: DWORD;
          TlBufferSize: DWORD;
          TlEventsLost: DWORD;
          TlLoggerThreadId: DWORD;
          TlBuffersWritten: DWORD;
          TlLogHandle: DWORD;
          TlLogFileName: PAnsiChar);
    end;
  end;
  {$EXTERNALSYM _PDH_LOG_SERVICE_QUERY_INFO_A}
  _PDH_LOG_SERVICE_QUERY_INFO_W = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwLogQuota: DWORD;
    szLogFileCaption: PWideChar;
    szDefaultDir: PWideChar;
    szBaseFileName: PWideChar;
    dwFileType: DWORD;
    dwReserved: DWORD;
    Union: record
      case Longint of
      1: (PdlAutoNameInterval: DWORD;
          PdlAutoNameUnits: DWORD;
          PdlCommandFilename: PWideChar;
          PdlCounterList: PWideChar;
          PdlAutoNameFormat: DWORD;
          PdlSampleInterval: DWORD;
          PdlLogStartTime: TFileTime;
          PdlLogEndTime: TFileTime);
      2: (TlNumberOfBuffers: DWORD;
          TlMinimumBuffers: DWORD;
          TlMaximumBuffers: DWORD;
          TlFreeBuffers: DWORD;
          TlBufferSize: DWORD;
          TlEventsLost: DWORD;
          TlLoggerThreadId: DWORD;
          TlBuffersWritten: DWORD;
          TlLogHandle: DWORD;
          TlLogFileName: PWideChar);
    end;
  end;
  {$EXTERNALSYM _PDH_LOG_SERVICE_QUERY_INFO_W}
  _PDH_LOG_SERVICE_QUERY_INFO_ = _PDH_LOG_SERVICE_QUERY_INFO_A;
  TPdhLogServiceQueryInfoA = _PDH_LOG_SERVICE_QUERY_INFO_A;
  TPdhLogServiceQueryInfoW = _PDH_LOG_SERVICE_QUERY_INFO_W;
  TPdhLogServiceQueryInfo = TPdhLogServiceQueryInfoA;

//
//  Time value constants
//

const
  MAX_TIME_VALUE = LONGLONG($7FFFFFFFFFFFFFFF);
  {$EXTERNALSYM MAX_TIME_VALUE}
  MIN_TIME_VALUE = LONGLONG(0);
  {$EXTERNALSYM MIN_TIME_VALUE}

// function definitions

function PdhGetDllVersion(var lpdwVersion: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDllVersion}

//
//  Query Functions
//

function PdhOpenQueryA(szDataSource: PAnsiChar; dwUserData: DWORD_PTR;
  var phQuery: HQUERY): Longint; stdcall;
{$EXTERNALSYM PdhOpenQueryA}
function PdhOpenQueryW(szDataSource: PWideChar; dwUserData: DWORD_PTR;
  var phQuery: HQUERY): Longint; stdcall;
{$EXTERNALSYM PdhOpenQueryW}
function PdhOpenQuery(szDataSource: PChar; dwUserData: DWORD_PTR;
  var phQuery: HQUERY): Longint; stdcall;
{$EXTERNALSYM PdhOpenQuery}

function PdhAddCounterA(hQuery: HQUERY; szFullCounterPath: PAnsiChar;
  dwUserData: DWORD_PTR; var phCounter: HCOUNTER): Longint; stdcall;
{$EXTERNALSYM PdhAddCounterA}
function PdhAddCounterW(hQuery: HQUERY; szFullCounterPath: PWideChar;
  dwUserData: DWORD_PTR; var phCounter: HCOUNTER): Longint; stdcall;
{$EXTERNALSYM PdhAddCounterW}
function PdhAddCounter(hQuery: HQUERY; szFullCounterPath: PChar;
  dwUserData: DWORD_PTR; var phCounter: HCOUNTER): Longint; stdcall;
{$EXTERNALSYM PdhAddCounter}

function PdhRemoveCounter(hCounter: HCOUNTER): Longint; stdcall;
{$EXTERNALSYM PdhRemoveCounter}

function PdhCollectQueryData(hQuery: HQUERY): Longint; stdcall;
{$EXTERNALSYM PdhCollectQueryData}

function PdhCloseQuery(hQuery: HQUERY): Longint; stdcall;
{$EXTERNALSYM PdhCloseQuery}

//
//  Counter Functions
//

function PdhGetFormattedCounterValue(hCounter: HCOUNTER; dwFormat: DWORD;
  lpdwType: LPDWORD; var pValue: TPdhFmtCounterValue): Longint; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterValue}

function PdhGetFormattedCounterArrayA(hCounter: HCOUNTER; dwFormat: DWORD;
  lpdwBufferSize: LPDWORD; lpdwItemCount: LPDWORD;
  ItemBuffer: PPdhFmtCounterValueItemA): Longint; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterArrayA}
function PdhGetFormattedCounterArrayW(hCounter: HCOUNTER; dwFormat: DWORD;
  lpdwBufferSize: LPDWORD; lpdwItemCount: LPDWORD;
  ItemBuffer: PPdhFmtCounterValueItemW): Longint; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterArrayW}
function PdhGetFormattedCounterArray(hCounter: HCOUNTER; dwFormat: DWORD;
  lpdwBufferSize: LPDWORD; lpdwItemCount: LPDWORD;
  ItemBuffer: PPdhFmtCounterValueItem): Longint; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterArray}

// dwFormat flag values

const
  PDH_FMT_RAW     = DWORD($00000010);
  {$EXTERNALSYM PDH_FMT_RAW}
  PDH_FMT_ANSI    = DWORD($00000020);
  {$EXTERNALSYM PDH_FMT_ANSI}
  PDH_FMT_UNICODE = DWORD($00000040);
  {$EXTERNALSYM PDH_FMT_UNICODE}
  PDH_FMT_LONG    = DWORD($00000100);
  {$EXTERNALSYM PDH_FMT_LONG}
  PDH_FMT_DOUBLE  = DWORD($00000200);
  {$EXTERNALSYM PDH_FMT_DOUBLE}
  PDH_FMT_LARGE   = DWORD($00000400);
  {$EXTERNALSYM PDH_FMT_LARGE}
  PDH_FMT_NOSCALE = DWORD($00001000);
  {$EXTERNALSYM PDH_FMT_NOSCALE}
  PDH_FMT_1000    = DWORD($00002000);
  {$EXTERNALSYM PDH_FMT_1000}
  PDH_FMT_NODATA  = DWORD($00004000);
  {$EXTERNALSYM PDH_FMT_NODATA}

  PERF_DETAIL_COSTLY   = DWORD($00010000);
  {$EXTERNALSYM PERF_DETAIL_COSTLY}
  PERF_DETAIL_STANDARD = DWORD($0000FFFF);
  {$EXTERNALSYM PERF_DETAIL_STANDARD}

function PdhGetRawCounterValue(hCounter: HCOUNTER; lpdwType: LPDWORD;
  var pValue: TPdhRawCounter): Longint; stdcall;
{$EXTERNALSYM PdhGetRawCounterValue}

function PdhGetRawCounterArrayA(hCounter: HCOUNTER; lpdwBufferSize: LPDWORD;
  lpdwItemCount: LPDWORD; ItemBuffer: PPdhRawCounterItemA): Longint; stdcall;
{$EXTERNALSYM PdhGetRawCounterArrayA}
function PdhGetRawCounterArrayW(hCounter: HCOUNTER; lpdwBufferSize: LPDWORD;
  lpdwItemCount: LPDWORD; ItemBuffer: PPdhRawCounterItemW): Longint; stdcall;
{$EXTERNALSYM PdhGetRawCounterArrayW}
function PdhGetRawCounterArray(hCounter: HCOUNTER; lpdwBufferSize: LPDWORD;
  lpdwItemCount: LPDWORD; ItemBuffer: PPdhRawCounterItem): Longint; stdcall;
{$EXTERNALSYM PdhGetRawCounterArray}

function PdhCalculateCounterFromRawValue(hCounter: HCOUNTER; dwFormat: DWORD;
  rawValue1, rawValue2: PPdhRawCounter; fmtValue: PPdhFmtCounterValue): Longint; stdcall;
{$EXTERNALSYM PdhCalculateCounterFromRawValue}

function PdhComputeCounterStatistics(hCounter: HCOUNTER; dwFormat, dwFirstEntry,
  dwNumEntries: DWORD; lpRawValueArray: PPdhRawCounter; var data: TPdhStatistics): Longint; stdcall;
{$EXTERNALSYM PdhComputeCounterStatistics}

function PdhGetCounterInfoA(hCounter: HCOUNTER; bRetrieveExplainText: Boolean;
  pdwBufferSize: LPDWORD; lpBuffer: PPdhCounterInfoA): Longint; stdcall;
{$EXTERNALSYM PdhGetCounterInfoA}
function PdhGetCounterInfoW(hCounter: HCOUNTER; bRetrieveExplainText: Boolean;
  pdwBufferSize: LPDWORD; lpBuffer: PPdhCounterInfoW): Longint; stdcall;
{$EXTERNALSYM PdhGetCounterInfoW}
function PdhGetCounterInfo(hCounter: HCOUNTER; bRetrieveExplainText: Boolean;
  pdwBufferSize: LPDWORD; lpBuffer: PPdhCounterInfo): Longint; stdcall;
{$EXTERNALSYM PdhGetCounterInfo}

const
  PDH_MAX_SCALE = Longint(7);
  {$EXTERNALSYM PDH_MAX_SCALE}
  PDH_MIN_SCALE = Longint(-7);
  {$EXTERNALSYM PDH_MIN_SCALE}

function PdhSetCounterScaleFactor(hCounter: HCOUNTER; lFactor: Longint): Longint; stdcall;
{$EXTERNALSYM PdhSetCounterScaleFactor}

//
//   Browsing and enumeration functions
//

function PdhConnectMachineA(szMachineName: PAnsiChar): Longint; stdcall;
{$EXTERNALSYM PdhConnectMachineA}
function PdhConnectMachineW(szMachineName: PWideChar): Longint; stdcall;
{$EXTERNALSYM PdhConnectMachineW}
function PdhConnectMachine(szMachineName: PChar): Longint; stdcall;
{$EXTERNALSYM PdhConnectMachine}

function PdhEnumMachinesA(szDataSource: PAnsiChar; mszMachineList: PAnsiChar;
  var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhEnumMachinesA}
function PdhEnumMachinesW(szDataSource: PWideChar; mszMachineList: PWideChar;
  var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhEnumMachinesW}
function PdhEnumMachines(szDataSource: PChar; mszMachineList: PChar;
  var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhEnumMachines}

function PdhEnumObjectsA(szDataSource, szMachineName: PAnsiChar; mszObjectList: PAnsiChar;
  var pcchBufferSize: DWORD; dwDetailLevel: DWORD; bRefresh: BOOL): Longint; stdcall;
{$EXTERNALSYM PdhEnumObjectsA}
function PdhEnumObjectsW(szDataSource, szMachineName: PWideChar; mszObjectList: PWideChar;
  var pcchBufferSize: DWORD; dwDetailLevel: DWORD; bRefresh: BOOL): Longint; stdcall;
{$EXTERNALSYM PdhEnumObjectsW}
function PdhEnumObjects(szDataSource, szMachineName: PChar; mszObjectList: PChar;
  var pcchBufferSize: DWORD; dwDetailLevel: DWORD; bRefresh: BOOL): Longint; stdcall;
{$EXTERNALSYM PdhEnumObjects}

function PdhEnumObjectItemsA(szDataSource, szMachineName, szObjectName: PAnsiChar;
  mszCounterList: PAnsiChar; var pcchCounterListLength: DWORD; mszInstanceList: PAnsiChar;
  var pcchInstanceListLength: DWORD; dwDetailLevel, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsA}
function PdhEnumObjectItemsW(szDataSource, szMachineName, szObjectName: PWideChar;
  mszCounterList: PWideChar; var pcchCounterListLength: DWORD; mszInstanceList: PWideChar;
  var pcchInstanceListLength: DWORD; dwDetailLevel, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsW}
function PdhEnumObjectItems(szDataSource, szMachineName, szObjectName: PChar;
  mszCounterList: PChar; var pcchCounterListLength: DWORD; mszInstanceList: PChar;
  var pcchInstanceListLength: DWORD; dwDetailLevel, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhEnumObjectItems}

function PdhMakeCounterPathA(pCounterPathElements: PPdhCounterPathElementsA;
  szFullPathBuffer: PAnsiChar; var pcchBufferSize: DWORD; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhMakeCounterPathA}
function PdhMakeCounterPathW(pCounterPathElements: PPdhCounterPathElementsW;
  szFullPathBuffer: PWideChar; var pcchBufferSize: DWORD; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhMakeCounterPathW}
function PdhMakeCounterPath(pCounterPathElements: PPdhCounterPathElements;
  szFullPathBuffer: PChar; var pcchBufferSize: DWORD; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhMakeCounterPath}

function PdhParseCounterPathA(szFullPathBuffer: PAnsiChar; pCounterPathElements:
  PPdhCounterPathElementsA; var pdwBufferSize: DWORD; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhParseCounterPathA}
function PdhParseCounterPathW(szFullPathBuffer: PWideChar; pCounterPathElements:
  PPdhCounterPathElementsW; var pdwBufferSize: DWORD; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhParseCounterPathW}
function PdhParseCounterPath(szFullPathBuffer: PChar; pCounterPathElements:
  PPdhCounterPathElements; var pdwBufferSize: DWORD; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhParseCounterPath}

const
  PDH_PATH_WBEM_RESULT       = DWORD($00000001);
  {$EXTERNALSYM PDH_PATH_WBEM_RESULT}
  PDH_PATH_WBEM_INPUT        = DWORD($00000002);
  {$EXTERNALSYM PDH_PATH_WBEM_INPUT}

function PDH_PATH_LANG_FLAGS(LangId, Flags: DWORD): DWORD;
{$EXTERNALSYM PDH_PATH_LANG_FLAGS}

function PdhParseInstanceNameA(szInstanceString: PAnsiChar; szInstanceName: PAnsiChar;
  var pcchInstanceNameLength: DWORD; szParentName: PAnsiChar;
  var pcchParentNameLength: DWORD; lpIndex: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhParseInstanceNameA}
function PdhParseInstanceNameW(szInstanceString: PWideChar; szInstanceName: PWideChar;
  var pcchInstanceNameLength: DWORD; szParentName: PWideChar;
  var pcchParentNameLength: DWORD; lpIndex: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhParseInstanceNameW}
function PdhParseInstanceName(szInstanceString: PChar; szInstanceName: PChar;
  var pcchInstanceNameLength: DWORD; szParentName: PChar;
  var pcchParentNameLength: DWORD; lpIndex: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhParseInstanceName}

function PdhValidatePathA(szFullPathBuffer: PAnsiChar): Longint; stdcall;
{$EXTERNALSYM PdhValidatePathA}
function PdhValidatePathW(szFullPathBuffer: PWideChar): Longint; stdcall;
{$EXTERNALSYM PdhValidatePathW}
function PdhValidatePath(szFullPathBuffer: PChar): Longint; stdcall;
{$EXTERNALSYM PdhValidatePath}

function PdhGetDefaultPerfObjectA(szDataSource, szMachineName: PAnsiChar;
  szDefaultObjectName: PAnsiChar; var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectA}
function PdhGetDefaultPerfObjectW(szDataSource, szMachineName: PWideChar;
  szDefaultObjectName: PWideChar; var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectW}
function PdhGetDefaultPerfObject(szDataSource, szMachineName: PChar;
  szDefaultObjectName: PChar; var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObject}

function PdhGetDefaultPerfCounterA(szDataSource, szMachineName, szObjectName: PAnsiChar;
  szDefaultCounterName: PAnsiChar; var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterA}
function PdhGetDefaultPerfCounterW(szDataSource, szMachineName, szObjectName: PWideChar;
  szDefaultCounterName: PWideChar; var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterW}
function PdhGetDefaultPerfCounter(szDataSource, szMachineName, szObjectName: PChar;
  szDefaultCounterName: PChar; var pcchBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounter}

type
  CounterPathCallBack = function (dwArg: DWORD_PTR): Longint; stdcall;
  {$EXTERNALSYM CounterPathCallBack}

const
  PDH_CF_INCLUDEINSTANCEINDEX    = 1 shl 0;
  PDH_CF_SINGLECOUNTERPERADD     = 1 shl 1;
  PDH_CF_SINGLECOUNTERPERDIALOG  = 1 shl 2;
  PDH_CF_LOCALCOUNTERSONLY       = 1 shl 3;
  PDH_CF_WILDCARDINSTANCES       = 1 shl 4;
  PDH_CF_HIDEDETAILBOX           = 1 shl 5;
  PDH_CF_INITIALIZEPATH          = 1 shl 6;
  PDH_CF_DISABLEMACHINESELECTION = 1 shl 7;
  PDH_CF_INCLUDECOSTLYOBJECTS    = 1 shl 8;
  PDH_CF_RESERVED                = DWORD($FFFFFE00);

type
  PPdhBrowseDlgConfigA = ^TPdhBrowseDlgConfigA;
  PPdhBrowseDlgConfigW = ^TPdhBrowseDlgConfigW;
  PPdhBrowseDlgConfig = PPdhBrowseDlgConfigA;
  _BrowseDlgConfig_A = record
    dwConfigFlags: DWORD;
    hWndOwner: HWND;
    szDataSource: PAnsiChar;
    szReturnPathBuffer: PAnsiChar;
    cchReturnPathLength: DWORD;
    pCallBack: CounterPathCallBack;
    dwCallBackArg: DWORD_PTR;
    CallBackStatus: PDH_STATUS;
    dwDefaultDetailLevel: DWORD;
    szDialogBoxCaption: PAnsiChar;
  end;
  {$EXTERNALSYM _BrowseDlgConfig_A}
  _BrowseDlgConfig_W = record
    dwConfigFlags: DWORD;
    hWndOwner: HWND;
    szDataSource: PWideChar;
    szReturnPathBuffer: PWideChar;
    cchReturnPathLength: DWORD;
    pCallBack: CounterPathCallBack;
    dwCallBackArg: DWORD_PTR;
    CallBackStatus: PDH_STATUS;
    dwDefaultDetailLevel: DWORD;
    szDialogBoxCaption: PWideChar;
  end;
  {$EXTERNALSYM _BrowseDlgConfig_W}
  _BrowseDlgConfig_ = _BrowseDlgConfig_A;
  TPdhBrowseDlgConfigA = _BrowseDlgConfig_A;
  TPdhBrowseDlgConfigW = _BrowseDlgConfig_W;
  TPdhBrowseDlgConfig = {$IFDEF D12}TPdhBrowseDlgConfigW{$ELSE}TPdhBrowseDlgConfigA{$ENDIF};

function PdhBrowseCountersA(var pBrowseDlgData: TPdhBrowseDlgConfigA): Longint; stdcall;
{$EXTERNALSYM PdhBrowseCountersA}
function PdhBrowseCountersW(var pBrowseDlgData: TPdhBrowseDlgConfigW): Longint; stdcall;
{$EXTERNALSYM PdhBrowseCountersW}
function PdhBrowseCounters(var pBrowseDlgData: TPdhBrowseDlgConfig): Longint; stdcall;
{$EXTERNALSYM PdhBrowseCounters}

function PdhExpandCounterPathA(szWildCardPath: PAnsiChar; mszExpandedPathList: PAnsiChar;
  var pcchPathListLength: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhExpandCounterPathA}
function PdhExpandCounterPathW(szWildCardPath: PWideChar; mszExpandedPathList: PWideChar;
  var pcchPathListLength: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhExpandCounterPathW}
function PdhExpandCounterPath(szWildCardPath: PChar; mszExpandedPathList: PChar;
  var pcchPathListLength: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhExpandCounterPath}

//
//  v2.0 functions
//

function PdhLookupPerfNameByIndexA(szMachineName: PAnsiChar; dwNameIndex: DWORD;
  szNameBuffer: PAnsiChar; var pcchNameBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhLookupPerfNameByIndexA}
function PdhLookupPerfNameByIndexW(szMachineName: PWideChar; dwNameIndex: DWORD;
  szNameBuffer: PWideChar; var pcchNameBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhLookupPerfNameByIndexW}
function PdhLookupPerfNameByIndex(szMachineName: PChar; dwNameIndex: DWORD;
  szNameBuffer: PChar; var pcchNameBufferSize: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhLookupPerfNameByIndex}

function PdhLookupPerfIndexByNameA(szMachineName, szNameBuffer: PAnsiChar;
  var pdwIndex: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhLookupPerfIndexByNameA}
function PdhLookupPerfIndexByNameW(szMachineName, szNameBuffer: PWideChar;
  var pdwIndex: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhLookupPerfIndexByNameW}
function PdhLookupPerfIndexByName(szMachineName, szNameBuffer: PChar;
  var pdwIndex: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhLookupPerfIndexByName}

//
//   Logging Functions
//

const
  PDH_LOG_READ_ACCESS        = DWORD($00010000);
  {$EXTERNALSYM PDH_LOG_READ_ACCESS}
  PDH_LOG_WRITE_ACCESS       = DWORD($00020000);
  {$EXTERNALSYM PDH_LOG_WRITE_ACCESS}
  PDH_LOG_UPDATE_ACCESS      = DWORD($00040000);
  {$EXTERNALSYM PDH_LOG_UPDATE_ACCESS}
  PDH_LOG_ACCESS_MASK        = DWORD($000F0000);
  {$EXTERNALSYM PDH_LOG_ACCESS_MASK}

  PDH_LOG_CREATE_NEW         = DWORD($00000001);
  {$EXTERNALSYM PDH_LOG_CREATE_NEW}
  PDH_LOG_CREATE_ALWAYS      = DWORD($00000002);
  {$EXTERNALSYM PDH_LOG_CREATE_ALWAYS}
  PDH_LOG_OPEN_ALWAYS        = DWORD($00000003);
  {$EXTERNALSYM PDH_LOG_OPEN_ALWAYS}
  PDH_LOG_OPEN_EXISTING      = DWORD($00000004);
  {$EXTERNALSYM PDH_LOG_OPEN_EXISTING}
  PDH_LOG_CREATE_MASK        = DWORD($0000000F);
  {$EXTERNALSYM PDH_LOG_CREATE_MASK}

  PDH_LOG_OPT_USER_STRING    = DWORD($01000000);
  {$EXTERNALSYM PDH_LOG_OPT_USER_STRING}
  PDH_LOG_OPT_CIRCULAR       = DWORD($02000000);
  {$EXTERNALSYM PDH_LOG_OPT_CIRCULAR}
  PDH_LOG_OPT_MAX_IS_BYTES   = DWORD($04000000);
  {$EXTERNALSYM PDH_LOG_OPT_MAX_IS_BYTES}
  PDH_LOG_OPT_MASK           = DWORD($0F000000);
  {$EXTERNALSYM PDH_LOG_OPT_MASK}

  PDH_LOG_TYPE_UNDEFINED     = 0;
  {$EXTERNALSYM PDH_LOG_TYPE_UNDEFINED}
  PDH_LOG_TYPE_CSV           = 1;
  {$EXTERNALSYM PDH_LOG_TYPE_CSV}
  PDH_LOG_TYPE_TSV           = 2;
  {$EXTERNALSYM PDH_LOG_TYPE_TSV}
  PDH_LOG_TYPE_BINARY        = 3;
  {$EXTERNALSYM PDH_LOG_TYPE_BINARY}
  PDH_LOG_TYPE_TRACE_KERNEL  = 4;
  {$EXTERNALSYM PDH_LOG_TYPE_TRACE_KERNEL}
  PDH_LOG_TYPE_TRACE_GENERIC = 5;
  {$EXTERNALSYM PDH_LOG_TYPE_TRACE_GENERIC}
  PDH_LOG_TYPE_PERFMON       = 6;
  {$EXTERNALSYM PDH_LOG_TYPE_PERFMON}

function PdhOpenLogA(szLogFileName: PAnsiChar; dwAccessFlags: DWORD;
  lpdwLogType: LPDWORD; hQuery: HQUERY; dwMaxRecords: DWORD;
  szUserCaption: PAnsiChar; var phLog: HLOG): Longint; stdcall;
{$EXTERNALSYM PdhOpenLogA}
function PdhOpenLogW(szLogFileName: PWideChar; dwAccessFlags: DWORD;
  lpdwLogType: LPDWORD; hQuery: HQUERY; dwMaxRecords: DWORD;
  szUserCaption: PWideChar; var phLog: HLOG): Longint; stdcall;
{$EXTERNALSYM PdhOpenLogW}
function PdhOpenLog(szLogFileName: PChar; dwAccessFlags: DWORD;
  lpdwLogType: LPDWORD; hQuery: HQUERY; dwMaxRecords: DWORD;
  szUserCaption: PChar; var phLog: HLOG): Longint; stdcall;
{$EXTERNALSYM PdhOpenLog}

function PdhUpdateLogA(hLog: HLOG; szUserString: PAnsiChar): Longint; stdcall;
{$EXTERNALSYM PdhUpdateLogA}
function PdhUpdateLogW(hLog: HLOG; szUserString: PWideChar): Longint; stdcall;
{$EXTERNALSYM PdhUpdateLogW}
function PdhUpdateLog(hLog: HLOG; szUserString: PChar): Longint; stdcall;
{$EXTERNALSYM PdhUpdateLog}

function PdhUpdateLogFileCatalog(hLog: HLOG): Longint; stdcall;
{$EXTERNALSYM PdhUpdateLogFileCatalog}

function PdhGetLogFileSize(hLog: HLOG; var llSize: LONGLONG): Longint; stdcall;
{$EXTERNALSYM PdhGetLogFileSize}

function PdhCloseLog(hLog: HLOG; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhCloseLog}

const
  PDH_FLAGS_CLOSE_QUERY = DWORD($00000001);
  {$EXTERNALSYM PDH_FLAGS_CLOSE_QUERY}

//
//  Data source selection dialog
//

  PDH_FLAGS_FILE_BROWSER_ONLY = DWORD($00000001);
  {$EXTERNALSYM PDH_FLAGS_FILE_BROWSER_ONLY}

function PdhSelectDataSourceA(hWndOwner: HWND; dwFlags: DWORD;
  szDataSource: PAnsiChar; var pcchBufferLength: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhSelectDataSourceA}
function PdhSelectDataSourceW(hWndOwner: HWND; dwFlags: DWORD;
  szDataSource: PWideChar; var pcchBufferLength: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhSelectDataSourceW}
function PdhSelectDataSource(hWndOwner: HWND; dwFlags: DWORD;
  szDataSource: PChar; var pcchBufferLength: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhSelectDataSource}

function PdhIsRealTimeQuery(hQuery: HQUERY): BOOL; stdcall;
{$EXTERNALSYM PdhIsRealTimeQuery}

function PdhSetQueryTimeRange(hQuery: HQUERY; pInfo: PPdhTimeInfo): Longint; stdcall;
{$EXTERNALSYM PdhSetQueryTimeRange}

function PdhGetDataSourceTimeRangeA(szDataSource: PAnsiChar; pdwNumEntries: LPDWORD;
  pInfo: PPdhTimeInfo; pdwBufferSize: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRangeA}
function PdhGetDataSourceTimeRangeW(szDataSource: PWideChar; pdwNumEntries: LPDWORD;
  pInfo: PPdhTimeInfo; pdwBufferSize: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRangeW}
function PdhGetDataSourceTimeRange(szDataSource: PChar; pdwNumEntries: LPDWORD;
  pInfo: PPdhTimeInfo; pdwBufferSize: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRange}

function PdhCollectQueryDataEx(hQuery: HQUERY; dwIntervalTime: DWORD;
  hNewDataEvent: THandle): Longint; stdcall;
{$EXTERNALSYM PdhCollectQueryDataEx}

function PdhFormatFromRawValue(dwCounterType, dwFormat: DWORD;
  var pTimeBase: LONGLONG; pRawValue1, pRawValue2: PPdhRawCounter;
  pFmtValue: PPdhFmtCounterValue): Longint; stdcall;
{$EXTERNALSYM PdhFormatFromRawValue}

function PdhGetCounterTimeBase(hCounter: HCOUNTER; var pTimeBase: LONGLONG): Longint; stdcall;
{$EXTERNALSYM PdhGetCounterTimeBase}

function PdhReadRawLogRecord(hLog: HLOG; ftRecord: TFileTime;
  pRawLogRecord: PPdhRawLogRecord; pdwBufferLength: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhReadRawLogRecord}

const
  DATA_SOURCE_REGISTRY    = DWORD($00000001);
  {$EXTERNALSYM DATA_SOURCE_REGISTRY}
  DATA_SOURCE_LOGFILE     = DWORD($00000002);
  {$EXTERNALSYM DATA_SOURCE_LOGFILE}
  DATA_SOURCE_WBEM        = DWORD($00000004);
  {$EXTERNALSYM DATA_SOURCE_WBEM}

function PdhSetDefaultRealTimeDataSource(dwDataSourceId: DWORD): Longint; stdcall;
{$EXTERNALSYM PdhSetDefaultRealTimeDataSource}

// flags for the log service api's

const
  PDH_LOGSVC_NO_WAIT          = DWORD($80000000);
  {$EXTERNALSYM PDH_LOGSVC_NO_WAIT}
  PDH_LOGSVC_ALL_QUERIES      = DWORD($00000001);
  {$EXTERNALSYM PDH_LOGSVC_ALL_QUERIES}
  PDH_LOGSVC_TRACE_LOG        = DWORD($00000002);
  {$EXTERNALSYM PDH_LOGSVC_TRACE_LOG}

  PDH_LOGSVC_CMD_START        = DWORD($00000010);
  {$EXTERNALSYM PDH_LOGSVC_CMD_START}
  PDH_LOGSVC_CMD_STOP         = DWORD($00000020);
  {$EXTERNALSYM PDH_LOGSVC_CMD_STOP}

  PDH_LOGSVC_CTRL_ADD         = DWORD($00000100);
  {$EXTERNALSYM PDH_LOGSVC_CTRL_ADD}
  PDH_LOGSVC_CTRL_REMOVE      = DWORD($00000200);
  {$EXTERNALSYM PDH_LOGSVC_CTRL_REMOVE}
  PDH_LOGSVC_CTRL_INFO        = DWORD($00000400);
  {$EXTERNALSYM PDH_LOGSVC_CTRL_INFO}

  PDH_LOGSVC_STATUS_RUNNING   = DWORD($00001000);
  {$EXTERNALSYM PDH_LOGSVC_STATUS_RUNNING}
  PDH_LOGSVC_STATUS_STOPPED   = DWORD($00002000);
  {$EXTERNALSYM PDH_LOGSVC_STATUS_STOPPED}
  PDH_LOGSVC_STATUS_PAUSED    = DWORD($00004000);
  {$EXTERNALSYM PDH_LOGSVC_STATUS_PAUSED}
  PDH_LOGSVC_STATUS_ERROR     = DWORD($00008000);
  {$EXTERNALSYM PDH_LOGSVC_STATUS_ERROR}
  PDH_LOGSVC_STATUS_PENDING   = DWORD($00010000);
  {$EXTERNALSYM PDH_LOGSVC_STATUS_PENDING}

  PDH_LOGSVC_NAME_UNDEFINED   = DWORD(-1);
  {$EXTERNALSYM PDH_LOGSVC_NAME_UNDEFINED}
  PDH_LOGSVC_NAME_MMDDHH      = DWORD(0);
  {$EXTERNALSYM PDH_LOGSVC_NAME_MMDDHH}
  PDH_LOGSVC_NAME_NNNNNN      = DWORD(1);
  {$EXTERNALSYM PDH_LOGSVC_NAME_NNNNNN}
  PDH_LOGSVC_NAME_YYDDD       = DWORD(2);
  {$EXTERNALSYM PDH_LOGSVC_NAME_YYDDD}
  PDH_LOGSVC_NAME_YYMM        = DWORD(3);
  {$EXTERNALSYM PDH_LOGSVC_NAME_YYMM}
  PDH_LOGSVC_NAME_YYMMDD      = DWORD(4);
  {$EXTERNALSYM PDH_LOGSVC_NAME_YYMMDD}
  PDH_LOGSVC_NAME_YYMMDDHH    = DWORD(5);
  {$EXTERNALSYM PDH_LOGSVC_NAME_YYMMDDHH}

  PDH_LOGSVC_RENAME_UNDEFINED = DWORD(-1);
  {$EXTERNALSYM PDH_LOGSVC_RENAME_UNDEFINED}
  PDH_LOGSVC_RENAME_HOURS     = DWORD(0);
  {$EXTERNALSYM PDH_LOGSVC_RENAME_HOURS}
  PDH_LOGSVC_RENAME_DAYS      = DWORD(1);
  {$EXTERNALSYM PDH_LOGSVC_RENAME_DAYS}
  PDH_LOGSVC_RENAME_MONTHS    = DWORD(2);
  {$EXTERNALSYM PDH_LOGSVC_RENAME_MONTHS}
  PDH_LOGSVC_RENAME_KBYTES    = DWORD(3);
  {$EXTERNALSYM PDH_LOGSVC_RENAME_KBYTES}
  PDH_LOGSVC_RENAME_MBYTES    = DWORD(4);
  {$EXTERNALSYM PDH_LOGSVC_RENAME_MBYTES}

function PdhLogServiceCommandA(szMachineName, szQueryName: PAnsiChar;
  dwFlags: DWORD; pdwStatus: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhLogServiceCommandA}
function PdhLogServiceCommandW(szMachineName, szQueryName: PWideChar;
  dwFlags: DWORD; pdwStatus: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhLogServiceCommandW}
function PdhLogServiceCommand(szMachineName, szQueryName: PChar;
  dwFlags: DWORD; pdwStatus: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhLogServiceCommand}

function PdhLogServiceControlA(szMachineName, szQueryName: PAnsiChar; dwFlags: DWORD;
  pInfoBuffer: PPdhLogServiceQueryInfoA; pdwBufferSize: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhLogServiceControlA}
function PdhLogServiceControlW(szMachineName, szQueryName: PWideChar; dwFlags: DWORD;
  pInfoBuffer: PPdhLogServiceQueryInfoW; pdwBufferSize: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhLogServiceControlW}
function PdhLogServiceControl(szMachineName, szQueryName: PChar; dwFlags: DWORD;
  pInfoBuffer: PPdhLogServiceQueryInfo; pdwBufferSize: LPDWORD): Longint; stdcall;
{$EXTERNALSYM PdhLogServiceControl}

implementation

const
  PdhLib = 'pdh.dll';

function IsSuccessSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $00000000;
end;

function IsInformationalSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $40000000;
end;

function IsWarningSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $80000000;
end;

function IsErrorSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $C0000000;
end;

const AWSuffix={$IFDEF UNICODE}'W'{$ELSE}'A'{$ENDIF};

function PdhGetDllVersion; external PdhLib name 'PdhGetDllVersion';
function PdhOpenQueryA; external PdhLib name 'PdhOpenQuery';
function PdhOpenQueryW; external PdhLib name 'PdhOpenQuery';
function PdhOpenQuery; external PdhLib name 'PdhOpenQuery'+AWSuffix;
function PdhAddCounterA; external PdhLib name 'PdhAddCounterA';
function PdhAddCounterW; external PdhLib name 'PdhAddCounterW';
function PdhAddCounter; external PdhLib name 'PdhAddCounter'+AWSuffix;
function PdhRemoveCounter; external PdhLib name 'PdhRemoveCounter';
function PdhCollectQueryData; external PdhLib name 'PdhCollectQueryData';
function PdhCloseQuery; external PdhLib name 'PdhCloseQuery';
function PdhGetFormattedCounterValue; external PdhLib name 'PdhGetFormattedCounterValue';
function PdhGetFormattedCounterArrayA; external PdhLib name 'PdhGetFormattedCounterArrayA';
function PdhGetFormattedCounterArrayW; external PdhLib name 'PdhGetFormattedCounterArrayW';
function PdhGetFormattedCounterArray; external PdhLib name 'PdhGetFormattedCounterArray'+AWSuffix;
function PdhGetRawCounterValue; external PdhLib name 'PdhGetRawCounterValue';
function PdhGetRawCounterArrayA; external PdhLib name 'PdhGetRawCounterArrayA';
function PdhGetRawCounterArrayW; external PdhLib name 'PdhGetRawCounterArrayW';
function PdhGetRawCounterArray; external PdhLib name 'PdhGetRawCounterArray'+AWSuffix;
function PdhCalculateCounterFromRawValue; external PdhLib name 'PdhCalculateCounterFromRawValue';
function PdhComputeCounterStatistics; external PdhLib name 'PdhComputeCounterStatistics';
function PdhGetCounterInfoA; external PdhLib name 'PdhGetCounterInfoA';
function PdhGetCounterInfoW; external PdhLib name 'PdhGetCounterInfoW';
function PdhGetCounterInfo; external PdhLib name  'PdhGetCounterInfo'+AWSuffix;
function PdhSetCounterScaleFactor; external PdhLib name 'PdhSetCounterScaleFactor';
function PdhConnectMachineA; external PdhLib name 'PdhConnectMachineA';
function PdhConnectMachineW; external PdhLib name 'PdhConnectMachineW';
function PdhConnectMachine; external PdhLib name 'PdhConnectMachine'+AWSuffix;
function PdhEnumMachinesA; external PdhLib name 'PdhEnumMachinesA';
function PdhEnumMachinesW; external PdhLib name 'PdhEnumMachinesW';
function PdhEnumMachines; external PdhLib name 'PdhEnumMachines'+AWSuffix;
function PdhEnumObjectsA; external PdhLib name 'PdhEnumObjectsA';
function PdhEnumObjectsW; external PdhLib name 'PdhEnumObjectsW';
function PdhEnumObjects; external PdhLib name 'PdhEnumObjects'+AWSuffix;
function PdhEnumObjectItemsA; external PdhLib name 'PdhEnumObjectItemsA';
function PdhEnumObjectItemsW; external PdhLib name 'PdhEnumObjectItemsW';
function PdhEnumObjectItems; external PdhLib name 'PdhEnumObjectItems'+AWSuffix;
function PdhMakeCounterPathA; external PdhLib name 'PdhMakeCounterPathA';
function PdhMakeCounterPathW; external PdhLib name 'PdhMakeCounterPathW';
function PdhMakeCounterPath; external PdhLib name 'PdhMakeCounterPath'+AWSuffix;
function PdhParseCounterPathA; external PdhLib name 'PdhParseCounterPathA';
function PdhParseCounterPathW; external PdhLib name 'PdhParseCounterPathW';
function PdhParseCounterPath; external PdhLib name 'PdhParseCounterPath'+AWSuffix;

function PDH_PATH_LANG_FLAGS(LangId, Flags: DWORD): DWORD;
begin
  Result := DWORD(((LangId and $0000FFFF) shl 16) or (Flags and $0000FFFF));
end;

function PdhParseInstanceNameA; external PdhLib name 'PdhParseInstanceNameA';
function PdhParseInstanceNameW; external PdhLib name 'PdhParseInstanceNameW';
function PdhParseInstanceName; external PdhLib name 'PdhParseInstanceName'+AWSuffix;
function PdhValidatePathA; external PdhLib name 'PdhValidatePathA';
function PdhValidatePathW; external PdhLib name 'PdhValidatePathW';
function PdhValidatePath; external PdhLib name 'PdhValidatePath'+AWSuffix;
function PdhGetDefaultPerfObjectA; external PdhLib name 'PdhGetDefaultPerfObjectA';
function PdhGetDefaultPerfObjectW; external PdhLib name 'PdhGetDefaultPerfObjectW';
function PdhGetDefaultPerfObject; external PdhLib name 'PdhGetDefaultPerfObject'+AWSuffix;
function PdhGetDefaultPerfCounterA; external PdhLib name 'PdhGetDefaultPerfCounterA';
function PdhGetDefaultPerfCounterW; external PdhLib name 'PdhGetDefaultPerfCounterW';
function PdhGetDefaultPerfCounter; external PdhLib name 'PdhGetDefaultPerfCounter'+AWSuffix;
function PdhBrowseCountersA; external PdhLib name 'PdhBrowseCountersA';
function PdhBrowseCountersW; external PdhLib name 'PdhBrowseCountersW';
function PdhBrowseCounters; external PdhLib name 'PdhBrowseCounters'+AWSuffix;
function PdhExpandCounterPathA; external PdhLib name 'PdhExpandCounterPathA';
function PdhExpandCounterPathW; external PdhLib name 'PdhExpandCounterPathW';
function PdhExpandCounterPath; external PdhLib name 'PdhExpandCounterPath'+AWSuffix;
function PdhLookupPerfNameByIndexA; external PdhLib name 'PdhLookupPerfNameByIndexA';
function PdhLookupPerfNameByIndexW; external PdhLib name 'PdhLookupPerfNameByIndexW';
function PdhLookupPerfNameByIndex; external PdhLib name 'PdhLookupPerfNameByIndex'+AWSuffix;
function PdhLookupPerfIndexByNameA; external PdhLib name 'PdhLookupPerfIndexByNameA';
function PdhLookupPerfIndexByNameW; external PdhLib name 'PdhLookupPerfIndexByNameW';
function PdhLookupPerfIndexByName; external PdhLib name 'PdhLookupPerfIndexByName'+AWSuffix;
function PdhOpenLogA; external PdhLib name 'PdhOpenLogA';
function PdhOpenLogW; external PdhLib name 'PdhOpenLogW';
function PdhOpenLog; external PdhLib name 'PdhOpenLog'+AWSuffix;
function PdhUpdateLogA; external PdhLib name 'PdhUpdateLogA';
function PdhUpdateLogW; external PdhLib name 'PdhUpdateLogW';
function PdhUpdateLog; external PdhLib name 'PdhUpdateLog'+AWSuffix;
function PdhUpdateLogFileCatalog; external PdhLib name 'PdhUpdateLogFileCatalog';
function PdhGetLogFileSize; external PdhLib name 'PdhGetLogFileSize';
function PdhCloseLog; external PdhLib name 'PdhCloseLog';
function PdhSelectDataSourceA; external PdhLib name 'PdhSelectDataSourceA';
function PdhSelectDataSourceW; external PdhLib name 'PdhSelectDataSourceW';
function PdhSelectDataSource; external PdhLib name 'PdhSelectDataSource'+AWSuffix;
function PdhIsRealTimeQuery; external PdhLib name 'PdhIsRealTimeQuery';
function PdhSetQueryTimeRange; external PdhLib name 'PdhSetQueryTimeRange';
function PdhGetDataSourceTimeRangeA; external PdhLib name 'PdhGetDataSourceTimeRangeA';
function PdhGetDataSourceTimeRangeW; external PdhLib name 'PdhGetDataSourceTimeRangeW';
function PdhGetDataSourceTimeRange; external PdhLib name 'PdhGetDataSourceTimeRange'+AWSuffix;
function PdhCollectQueryDataEx; external PdhLib name 'PdhCollectQueryDataEx';
function PdhFormatFromRawValue; external PdhLib name 'PdhFormatFromRawValue';
function PdhGetCounterTimeBase; external PdhLib name 'PdhGetCounterTimeBase';
function PdhReadRawLogRecord; external PdhLib name 'PdhReadRawLogRecord';
function PdhSetDefaultRealTimeDataSource; external PdhLib name 'PdhSetDefaultRealTimeDataSource';
function PdhLogServiceCommandA; external PdhLib name 'PdhLogServiceCommandA';
function PdhLogServiceCommandW; external PdhLib name 'PdhLogServiceCommandW';
function PdhLogServiceCommand; external PdhLib name 'PdhLogServiceCommand'+AWSuffix;
function PdhLogServiceControlA; external PdhLib name 'PdhLogServiceControlA';
function PdhLogServiceControlW; external PdhLib name 'PdhLogServiceControlW';
function PdhLogServiceControl; external PdhLib name 'PdhLogServiceControl'+AWSuffix;

end.
