//---------------------------------------------------------------------------

#ifndef Shape_VertAlignH
#define Shape_VertAlignH
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
#include <TeeShape.hpp>
//---------------------------------------------------------------------------
class TShapeVertAlign : public TBaseForm
{
__published:	// IDE-managed Components
        TChartShape *Series1;
        TChartShape *Series2;
        TChartShape *Series3;
        TRadioGroup *RadioGroup1;
        TLabel *Label1;
        void __fastcall RadioGroup1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TShapeVertAlign(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TShapeVertAlign *ShapeVertAlign;
//---------------------------------------------------------------------------
#endif
