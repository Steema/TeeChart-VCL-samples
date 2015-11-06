//---------------------------------------------------------------------------

#ifndef Contour_LevelsH
#define Contour_LevelsH
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
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TContourLevelsForm : public TBaseForm
{
__published:	// IDE-managed Components
        TContourSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
        void __fastcall AddCustomLevels();
public:		// User declarations
        __fastcall TContourLevelsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourLevelsForm *ContourLevelsForm;
//---------------------------------------------------------------------------
#endif
