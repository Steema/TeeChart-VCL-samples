//---------------------------------------------------------------------------

#ifndef Surface_SidesH
#define Surface_SidesH
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
class TSurfaceSidesDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TCheckBox *CheckBox1;
        TButton *Button1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSurfaceSidesDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceSidesDemo *SurfaceSides;
//---------------------------------------------------------------------------
#endif
