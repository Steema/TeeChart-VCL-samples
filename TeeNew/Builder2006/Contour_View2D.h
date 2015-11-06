//---------------------------------------------------------------------------

#ifndef Contour_View2DH
#define Contour_View2DH
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
class TContourView2D : public TBaseForm
{
__published:	// IDE-managed Components
        TContourSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TContourView2D(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourView2D *ContourView2D;
//---------------------------------------------------------------------------
#endif
