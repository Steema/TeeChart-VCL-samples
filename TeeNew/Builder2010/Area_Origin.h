//---------------------------------------------------------------------------

#ifndef Area_OriginH
#define Area_OriginH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAreaOriginForm : public TBaseForm
{
__published:	// IDE-managed Components
        TAreaSeries *Series1;
        TEdit *EOrigin;
        TUpDown *UDOrigin;
        TCheckBox *CBUseOrigin;
        TLabel *Label1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CBUseOriginClick(TObject *Sender);
        void __fastcall EOriginChange(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAreaOriginForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAreaOriginForm *AreaOriginForm;
//---------------------------------------------------------------------------
#endif
