//---------------------------------------------------------------------------

#ifndef Surface_WirePaletteH
#define Surface_WirePaletteH
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
class TSurfaceWire : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSurfaceWire(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceWire *SurfaceWire;
//---------------------------------------------------------------------------
#endif
