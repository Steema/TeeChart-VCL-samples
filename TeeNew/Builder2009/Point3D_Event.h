//---------------------------------------------------------------------------

#ifndef Point3D_EventH
#define Point3D_EventH
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
#include "TeeComma.hpp"
#include "TeePoin3.hpp"
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TPoint3DEvent : public TBaseForm
{
__published:	// IDE-managed Components
        TPoint3DSeries *Series1;
        TCheckBox *CheckBox1;
        TTeeCommander *TeeCommander1;
        TSeriesPointerStyle __fastcall Series1GetPointerStyle(
          TChartSeries *Sender, int ValueIndex);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPoint3DEvent(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPoint3DEvent *Point3DEvent;
//---------------------------------------------------------------------------
#endif
