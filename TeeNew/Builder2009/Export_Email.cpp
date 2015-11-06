//---------------------------------------------------------------------------

#include <vcl.h>
#include <Sysutils.hpp>
#pragma hdrstop

#include "Export_Email.h"
#include "TeExport.hpp"
#include "TeeJPEG.hpp"
#include "TeeConst.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ImaPoint"
#pragma resource "*.dfm"
TExportEmailForm *ExportEmailForm;
//---------------------------------------------------------------------------
__fastcall TExportEmailForm::TExportEmailForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TExportEmailForm::Button1Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TExportEmailForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TExportEmailForm::Button2Click(TObject *Sender)
{
  char tmpPath[MAX_PATH];
  char tmpName[MAX_PATH];
  // obtain the "temp" folder path...
  if (GetTempPath(MAX_PATH,tmpPath) == 0) ShowMessage(TeeMsg_CanNotFindTempPath);

  // set the filename to "\temp\teechart.jpg"
  StrPCopy(tmpName,(AnsiString)(tmpPath)+"\\TeeChart.jpg");

  // create the JPEG chart... }
  TJPEGExportFormat *tmpF = new TJPEGExportFormat();
  try
  {
    tmpF->Panel = Chart1;
    tmpF->SaveToFile(tmpName);
  }
  __finally
  {
    delete tmpF;
  }
  // email the jpeg chart...
  TeeEmailFile(tmpName,"TeeChart");

  // delete the temporary jpeg file...
  DeleteFile(tmpName);

}
//---------------------------------------------------------------------------

