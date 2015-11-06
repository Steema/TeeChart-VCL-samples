//---------------------------------------------------------------------------

#ifndef Tool_AnnotationH
#define Tool_AnnotationH
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
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAnnotationToolForm : public TBaseForm
{
__published:	// IDE-managed Components
    TAnnotationTool *ChartTool1;
    TAnnotationTool *ChartTool2;
    TAnnotationTool *ChartTool3;
    TCheckBox *CheckBox1;
    TFastLineSeries *Series1;
    TButton *Button1;

        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAnnotationToolForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAnnotationToolForm *AnnotationToolForm;
//---------------------------------------------------------------------------
#endif
