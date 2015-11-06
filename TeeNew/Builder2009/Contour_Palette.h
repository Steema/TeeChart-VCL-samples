//---------------------------------------------------------------------------

#ifndef Contour_PaletteH
#define Contour_PaletteH
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
class TContourPaletteForm : public TBaseForm
{
__published:	// IDE-managed Components
        TContourSeries *Series1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TContourPaletteForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourPaletteForm *ContourPaletteForm;
//---------------------------------------------------------------------------
#endif
