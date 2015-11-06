//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OpenGL_Editor.h"
#include "TeeGLEditor.hpp" // <<< IMPORTANT !!!!
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "Bar3D"
#pragma link "TeeEdit"
#pragma link "TeeOpenGL"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TOpenGLEditorForm *OpenGLEditorForm;
//---------------------------------------------------------------------------
__fastcall TOpenGLEditorForm::TOpenGLEditorForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOpenGLEditorForm::CheckBox1Click(TObject *Sender)
{
  Screen->Cursor = crHourGlass;
  try
  {
    TeeOpenGL1->Active = CheckBox1->Checked;
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLEditorForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TOpenGLEditorForm::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

