//---------------------------------------------------------------------------

#ifndef TriSurface_HiddingH
#define TriSurface_HiddingH
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
#include "TeeTools.hpp"
#include "TeeTriSurface.hpp"
//---------------------------------------------------------------------------
class TTriSurfaceHidding : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TRotateTool *ChartTool1;
    TTriSurfaceSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTriSurfaceHidding(TComponent* Owner);
        void __fastcall Fill(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TTriSurfaceHidding *TriSurfaceHidding;
//---------------------------------------------------------------------------
#endif
