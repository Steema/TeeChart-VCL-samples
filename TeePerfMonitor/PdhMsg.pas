{******************************************************************}
{                                                       	   }
{       Borland Delphi Runtime Library                  	   }
{       Performance Data Helper Messages interface unit            }
{ 								   }
{ Portions created by Microsoft are 				   }
{ Copyright (C) 1995-1999 Microsoft Corporation. 		   }
{ All Rights Reserved. 						   }
{ 								   }
{ The original file is: PdhMsg.pas, released 3 Dec 1999. 	   }
{ The original Pascal code is: PdhMsg.pas, released 3 Dec 1999.    }
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

unit PdhMsg;

{$WEAKPACKAGEUNIT}

interface

uses
  Windows;

{$HPPEMIT ''}
{$HPPEMIT '#include "pdhmsg.h"'}
{$HPPEMIT ''}

//     PDH DLL messages
//
//
//      Success Messages
//
//         the Win32 error value ERROR_SUCCESS is used for success returns
//
//      MESSAGE NAME FORMAT
//
//          PDH_CSTATUS_...   messages are data item status message and
//                     are returned in reference to the status of a data
//                     item
//          PDH_...           messages are returned by FUNCTIONS only and
//                     not used as data item status values
//
//      Success Messages
//         These messages are normally returned when the operation completed
//         successfully.
//
//
//  Values are 32 bit values layed out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes

const

//
// Define the severity codes
//

  STATUS_SEVERITY_WARNING          = $2;
  {$EXTERNALSYM STATUS_SEVERITY_WARNING}
  STATUS_SEVERITY_SUCCESS          = $0;
  {$EXTERNALSYM STATUS_SEVERITY_SUCCESS}
  STATUS_SEVERITY_INFORMATIONAL    = $1;
  {$EXTERNALSYM STATUS_SEVERITY_INFORMATIONAL}
  STATUS_SEVERITY_ERROR            = $3;
  {$EXTERNALSYM STATUS_SEVERITY_ERROR}

//
// MessageId: PDH_CSTATUS_VALID_DATA
//
// MessageText:
//
//  The returned data is valid.
//

  PDH_CSTATUS_VALID_DATA           = DWORD($00000000);
  {$EXTERNALSYM PDH_CSTATUS_VALID_DATA}

//
// MessageId: PDH_CSTATUS_NEW_DATA
//
// MessageText:
//
//  The return data value is valid and different from the last sample.
//

  PDH_CSTATUS_NEW_DATA             = DWORD($00000001);
  {$EXTERNALSYM PDH_CSTATUS_NEW_DATA}

//
//        Informational messages
//
//  None
//
//      Warning Messages
//         These messages are returned when the function has completed
//         successfully but the results may be different than expected.
//
//
// MessageId: PDH_CSTATUS_NO_MACHINE
//
// MessageText:
//
//  Unable to connect to specified machine or machine is off line.
//

  PDH_CSTATUS_NO_MACHINE           = DWORD($800007D0);
  {$EXTERNALSYM PDH_CSTATUS_NO_MACHINE}

//
// MessageId: PDH_CSTATUS_NO_INSTANCE
//
// MessageText:
//
//  The specified instance is not present.
//

  PDH_CSTATUS_NO_INSTANCE          = DWORD($800007D1);
  {$EXTERNALSYM PDH_CSTATUS_NO_INSTANCE}

//
// MessageId: PDH_MORE_DATA
//
// MessageText:
//
//  There is more data to return than would fit in the supplied buffer. Allocate
//  a larger buffer and call the function again.
//

  PDH_MORE_DATA                    = DWORD($800007D2);
  {$EXTERNALSYM PDH_MORE_DATA}

//
// MessageId: PDH_CSTATUS_ITEM_NOT_VALIDATED
//
// MessageText:
//
//  The data item has been added to the query, but has not been validated nor
//  accessed. No other status information on this data item is available.
//

  PDH_CSTATUS_ITEM_NOT_VALIDATED   = DWORD($800007D3);
  {$EXTERNALSYM PDH_CSTATUS_ITEM_NOT_VALIDATED}

//
// MessageId: PDH_RETRY
//
// MessageText:
//
//  The selected operation should be retried.
//

  PDH_RETRY                        = DWORD($800007D4);
  {$EXTERNALSYM PDH_RETRY}

//
// MessageId: PDH_NO_DATA
//
// MessageText:
//
//  No data to return.
//

  PDH_NO_DATA                      = DWORD($800007D5);
  {$EXTERNALSYM PDH_NO_DATA}

//
// MessageId: PDH_CALC_NEGATIVE_DENOMINATOR
//
// MessageText:
//
//  A counter with a negative denominator value was detected.
//

  PDH_CALC_NEGATIVE_DENOMINATOR    = DWORD($800007D6);
  {$EXTERNALSYM PDH_CALC_NEGATIVE_DENOMINATOR}

//
// MessageId: PDH_CALC_NEGATIVE_TIMEBASE
//
// MessageText:
//
//  A counter with a negative timebase value was detected.
//

  PDH_CALC_NEGATIVE_TIMEBASE       = DWORD($800007D7);
  {$EXTERNALSYM PDH_CALC_NEGATIVE_TIMEBASE}

//
// MessageId: PDH_CALC_NEGATIVE_VALUE
//
// MessageText:
//
//  A counter with a negative value was detected.
//

  PDH_CALC_NEGATIVE_VALUE          = DWORD($800007D8);
  {$EXTERNALSYM PDH_CALC_NEGATIVE_VALUE}

//
// MessageId: PDH_DIALOG_CANCELLED
//
// MessageText:
//
//  The user cancelled the dialog box.
//

  PDH_DIALOG_CANCELLED             = DWORD($800007D9);
  {$EXTERNALSYM PDH_DIALOG_CANCELLED}

//
// MessageId: PDH_END_OF_LOG_FILE
//
// MessageText:
//
//  The end of the log file was reached.
//

  PDH_END_OF_LOG_FILE              = DWORD($800007DA);
  {$EXTERNALSYM PDH_END_OF_LOG_FILE}

//
//     Error Messages
//        These messages are returned when the function could not complete
//        as requested and some corrective action may be required by the
//        the caller or the user.
//
//
// MessageId: PDH_CSTATUS_NO_OBJECT
//
// MessageText:
//
//  The specified object is not found on the system.
//

  PDH_CSTATUS_NO_OBJECT            = DWORD($C0000BB8);
  {$EXTERNALSYM PDH_CSTATUS_NO_OBJECT}

//
// MessageId: PDH_CSTATUS_NO_COUNTER
//
// MessageText:
//
//  The specified counter could not be found.
//

  PDH_CSTATUS_NO_COUNTER           = DWORD($C0000BB9);
  {$EXTERNALSYM PDH_CSTATUS_NO_COUNTER}

//
// MessageId: PDH_CSTATUS_INVALID_DATA
//
// MessageText:
//
//  The returned data is not valid.
//

  PDH_CSTATUS_INVALID_DATA         = DWORD($C0000BBA);
  {$EXTERNALSYM PDH_CSTATUS_INVALID_DATA}

//
// MessageId: PDH_MEMORY_ALLOCATION_FAILURE
//
// MessageText:
//
//  A PDH function could not allocate enough temporary memory to complete the
//  operation. Close some applications or extend the pagefile and retry the
//  function.
//

  PDH_MEMORY_ALLOCATION_FAILURE    = DWORD($C0000BBB);
  {$EXTERNALSYM PDH_MEMORY_ALLOCATION_FAILURE}

//
// MessageId: PDH_INVALID_HANDLE
//
// MessageText:
//
//  The handle is not a valid PDH object.
//

  PDH_INVALID_HANDLE               = DWORD($C0000BBC);
  {$EXTERNALSYM PDH_INVALID_HANDLE}

//
// MessageId: PDH_INVALID_ARGUMENT
//
// MessageText:
//
//  A required argument is missing or incorrect.
//

  PDH_INVALID_ARGUMENT             = DWORD($C0000BBD);
  {$EXTERNALSYM PDH_INVALID_ARGUMENT}

//
// MessageId: PDH_FUNCTION_NOT_FOUND
//
// MessageText:
//
//  Unable to find the specified function.
//

  PDH_FUNCTION_NOT_FOUND           = DWORD($C0000BBE);
  {$EXTERNALSYM PDH_FUNCTION_NOT_FOUND}

//
// MessageId: PDH_CSTATUS_NO_COUNTERNAME
//
// MessageText:
//
//  No counter was specified.
//

  PDH_CSTATUS_NO_COUNTERNAME       = DWORD($C0000BBF);
  {$EXTERNALSYM PDH_CSTATUS_NO_COUNTERNAME}

//
// MessageId: PDH_CSTATUS_BAD_COUNTERNAME
//
// MessageText:
//
//  Unable to parse the counter path. Check the format and syntax of the
//  specified path.
//

  PDH_CSTATUS_BAD_COUNTERNAME      = DWORD($C0000BC0);
  {$EXTERNALSYM PDH_CSTATUS_BAD_COUNTERNAME}

//
// MessageId: PDH_INVALID_BUFFER
//
// MessageText:
//
//  The buffer passed by the caller is invalid.
//

  PDH_INVALID_BUFFER               = DWORD($C0000BC1);
  {$EXTERNALSYM PDH_INVALID_BUFFER}

//
// MessageId: PDH_INSUFFICIENT_BUFFER
//
// MessageText:
//
//  The requested data is larger than the buffer supplied. Unable to return the
//  requested data.
//

  PDH_INSUFFICIENT_BUFFER          = DWORD($C0000BC2);
  {$EXTERNALSYM PDH_INSUFFICIENT_BUFFER}

//
// MessageId: PDH_CANNOT_CONNECT_MACHINE
//
// MessageText:
//
//  Unable to connect to the requested machine.
//

  PDH_CANNOT_CONNECT_MACHINE       = DWORD($C0000BC3);
  {$EXTERNALSYM PDH_CANNOT_CONNECT_MACHINE}

//
// MessageId: PDH_INVALID_PATH
//
// MessageText:
//
//  The specified counter path could not be interpreted.
//

  PDH_INVALID_PATH                 = DWORD($C0000BC4);
  {$EXTERNALSYM PDH_INVALID_PATH}

//
// MessageId: PDH_INVALID_INSTANCE
//
// MessageText:
//
//  The instance name could not be read from the specified counter path.
//

  PDH_INVALID_INSTANCE             = DWORD($C0000BC5);
  {$EXTERNALSYM PDH_INVALID_INSTANCE}

//
// MessageId: PDH_INVALID_DATA
//
// MessageText:
//
//  The data is not valid.
//

  PDH_INVALID_DATA                 = DWORD($C0000BC6);
  {$EXTERNALSYM PDH_INVALID_DATA}

//
// MessageId: PDH_NO_DIALOG_DATA
//
// MessageText:
//
//  The dialog box data block was missing or invalid.
//

  PDH_NO_DIALOG_DATA               = DWORD($C0000BC7);
  {$EXTERNALSYM PDH_NO_DIALOG_DATA}

//
// MessageId: PDH_CANNOT_READ_NAME_STRINGS
//
// MessageText:
//
//  Unable to read the counter and/or explain text from the specified machine.
//

  PDH_CANNOT_READ_NAME_STRINGS     = DWORD($C0000BC8);
  {$EXTERNALSYM PDH_CANNOT_READ_NAME_STRINGS}

//
// MessageId: PDH_LOG_FILE_CREATE_ERROR
//
// MessageText:
//
//  Unable to create the specified log file.
//

  PDH_LOG_FILE_CREATE_ERROR        = DWORD($C0000BC9);
  {$EXTERNALSYM PDH_LOG_FILE_CREATE_ERROR}

//
// MessageId: PDH_LOG_FILE_OPEN_ERROR
//
// MessageText:
//
//  Unable to open the specified log file.
//

  PDH_LOG_FILE_OPEN_ERROR          = DWORD($C0000BCA);
  {$EXTERNALSYM PDH_LOG_FILE_OPEN_ERROR}

//
// MessageId: PDH_LOG_TYPE_NOT_FOUND
//
// MessageText:
//
//  The specified log file type has not been installed on this system.
//

  PDH_LOG_TYPE_NOT_FOUND           = DWORD($C0000BCB);
  {$EXTERNALSYM PDH_LOG_TYPE_NOT_FOUND}

//
// MessageId: PDH_NO_MORE_DATA
//
// MessageText:
//
//  No more data is available.
//

  PDH_NO_MORE_DATA                 = DWORD($C0000BCC);
  {$EXTERNALSYM PDH_NO_MORE_DATA}

//
// MessageId: PDH_ENTRY_NOT_IN_LOG_FILE
//
// MessageText:
//
//  The specified record was not found in the log file.
//

  PDH_ENTRY_NOT_IN_LOG_FILE        = DWORD($C0000BCD);
  {$EXTERNALSYM PDH_ENTRY_NOT_IN_LOG_FILE}

//
// MessageId: PDH_DATA_SOURCE_IS_LOG_FILE
//
// MessageText:
//
//  The specified data source is a log file.
//

  PDH_DATA_SOURCE_IS_LOG_FILE      = DWORD($C0000BCE);
  {$EXTERNALSYM PDH_DATA_SOURCE_IS_LOG_FILE}

//
// MessageId: PDH_DATA_SOURCE_IS_REAL_TIME
//
// MessageText:
//
//  The specified data source is the current activity.
//

  PDH_DATA_SOURCE_IS_REAL_TIME     = DWORD($C0000BCF);
  {$EXTERNALSYM PDH_DATA_SOURCE_IS_REAL_TIME}

//
// MessageId: PDH_UNABLE_READ_LOG_HEADER
//
// MessageText:
//
//  The log file header could not be read.
//

  PDH_UNABLE_READ_LOG_HEADER       = DWORD($C0000BD0);
  {$EXTERNALSYM PDH_UNABLE_READ_LOG_HEADER}

//
// MessageId: PDH_FILE_NOT_FOUND
//
// MessageText:
//
//  Unable to find the specified file.
//

  PDH_FILE_NOT_FOUND               = DWORD($C0000BD1);
  {$EXTERNALSYM PDH_FILE_NOT_FOUND}

//
// MessageId: PDH_FILE_ALREADY_EXISTS
//
// MessageText:
//
//  There is already a file with the specified file name.
//

  PDH_FILE_ALREADY_EXISTS          = DWORD($C0000BD2);
  {$EXTERNALSYM PDH_FILE_ALREADY_EXISTS}

//
// MessageId: PDH_NOT_IMPLEMENTED
//
// MessageText:
//
//  The function referenced has not been implemented.
//

  PDH_NOT_IMPLEMENTED              = DWORD($C0000BD3);
  {$EXTERNALSYM PDH_NOT_IMPLEMENTED}

//
// MessageId: PDH_STRING_NOT_FOUND
//
// MessageText:
//
//  Unable to find the specified string in the list of performance name and
//  explain text strings.
//

  PDH_STRING_NOT_FOUND             = DWORD($C0000BD4);
  {$EXTERNALSYM PDH_STRING_NOT_FOUND}

//
// MessageId: PDH_UNABLE_MAP_NAME_FILES
//
// MessageText:
//
//  Unable to map to the performance counter name data files. The data
//  will be read from the registry and stored locally.
//

  PDH_UNABLE_MAP_NAME_FILES        = DWORD($80000BD5);
  {$EXTERNALSYM PDH_UNABLE_MAP_NAME_FILES}

//
// MessageId: PDH_UNKNOWN_LOG_FORMAT
//
// MessageText:
//
//  The format of the specified log file is not recognized by the PDH DLL.
//

  PDH_UNKNOWN_LOG_FORMAT           = DWORD($C0000BD6);
  {$EXTERNALSYM PDH_UNKNOWN_LOG_FORMAT}

//
// MessageId: PDH_UNKNOWN_LOGSVC_COMMAND
//
// MessageText:
//
//  The specified Log Service command value is not recognized.
//

  PDH_UNKNOWN_LOGSVC_COMMAND       = DWORD($C0000BD7);
  {$EXTERNALSYM PDH_UNKNOWN_LOGSVC_COMMAND}

//
// MessageId: PDH_LOGSVC_QUERY_NOT_FOUND
//
// MessageText:
//
//  The specified Query from the Log Service could not be found or could not
//  be opened.
//

  PDH_LOGSVC_QUERY_NOT_FOUND       = DWORD($C0000BD8);
  {$EXTERNALSYM PDH_LOGSVC_QUERY_NOT_FOUND}

//
// MessageId: PDH_LOGSVC_NOT_OPENED
//
// MessageText:
//
//  The Performance Data Log Service key could not be opened. This may be due
//  to insufficient privilege or because the service has not been installed.
//

  PDH_LOGSVC_NOT_OPENED            = DWORD($C0000BD9);
  {$EXTERNALSYM PDH_LOGSVC_NOT_OPENED}

//
// MessageId: PDH_WBEM_ERROR
//
// MessageText:
//
//  An error occured while accesing the WBEM data store. The WBEM error code
//  is contained in the LastError value.
//

  PDH_WBEM_ERROR                   = DWORD($C0000BDA);
  {$EXTERNALSYM PDH_WBEM_ERROR}

implementation

end.
