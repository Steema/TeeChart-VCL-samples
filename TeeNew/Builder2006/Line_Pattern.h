//---------------------------------------------------------------------------

#ifndef Line_PatternH
#define Line_PatternH
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
#include <Dialogs.hpp>
#include <Graphics.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLinePatternForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TLineSeries *Series2;
        TLineSeries *Series3;
        TImage *Image1;
        TImage *Image2;
        TImage *Image3;
        TOpenDialog *OpenDialog1;
        void __fastcall Image1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLinePatternForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLinePatternForm *LinePatternForm;
//---------------------------------------------------------------------------
#endif
