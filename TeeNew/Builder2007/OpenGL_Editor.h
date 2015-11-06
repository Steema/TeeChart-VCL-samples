//---------------------------------------------------------------------------

#ifndef OpenGL_EditorH
#define OpenGL_EditorH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include "Bar3D.hpp"
#include "TeeEdit.hpp"
#include "TeeOpenGL.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TOpenGLEditorForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TTeeOpenGL *TeeOpenGL1;
        TBar3DSeries *Series1;
        TButton *Button1;
        TChartEditor *ChartEditor1;
        TRotateTool *ChartTool1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TOpenGLEditorForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOpenGLEditorForm *OpenGLEditorForm;
//---------------------------------------------------------------------------
#endif
