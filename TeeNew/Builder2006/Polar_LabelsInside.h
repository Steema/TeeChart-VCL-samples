//---------------------------------------------------------------------------

#ifndef Polar_LabelsInsideH
#define Polar_LabelsInsideH
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
#include "TeePolar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPolarLabelsInside : public TBaseForm
{
__published:	// IDE-managed Components
        TPolarSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPolarLabelsInside(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarLabelsInside *PolarLabelsInside;
//---------------------------------------------------------------------------
#endif
