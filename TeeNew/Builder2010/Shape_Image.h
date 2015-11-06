//---------------------------------------------------------------------------

#ifndef Shape_ImageH
#define Shape_ImageH
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
class TShapeImage : public TBaseForm
{
__published:	// IDE-managed Components
        TChartShape *Series1;
        TChartShape *Series2;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TShapeImage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TShapeImage *ShapeImage;
//---------------------------------------------------------------------------
#endif
