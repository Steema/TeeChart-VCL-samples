//---------------------------------------------------------------------------

#ifndef Legend_ImageH
#define Legend_ImageH
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
#include "TeeRose.hpp"
#include <Graphics.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendImage : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TWindRoseSeries *Series1;
        TImage *Image1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendImage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendImage *LegendImage;
//---------------------------------------------------------------------------
#endif
