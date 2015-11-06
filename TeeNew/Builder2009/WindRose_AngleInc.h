//---------------------------------------------------------------------------

#ifndef WindRose_AngleIncH
#define WindRose_AngleIncH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TWindAngleInc : public TBaseForm
{
__published:	// IDE-managed Components
        TWindRoseSeries *Series1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TLabel *Label2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TWindAngleInc(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWindAngleInc *WindAngleInc;
//---------------------------------------------------------------------------
#endif
