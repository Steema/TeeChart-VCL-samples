//---------------------------------------------------------------------------

#ifndef PolarRadar_TransparencyH
#define PolarRadar_TransparencyH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPolarRadarTransp : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TEdit *Edit2;
    TUpDown *UpDown2;
    TEdit *Edit3;
    TUpDown *UpDown3;
    TPolarSeries *Series1;
    TPolarSeries *Series2;
    TPolarSeries *Series3;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
        void __fastcall Edit3Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPolarRadarTransp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarRadarTransp *PolarRadarTransp;
//---------------------------------------------------------------------------
#endif
