//---------------------------------------------------------------------------

#ifndef Series_Bar3DH
#define Series_Bar3DH
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
#include "Bar3D.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBar3DForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBar3DSeries *Series1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TButton *Button1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBar3DForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBar3DForm *Bar3DForm;
//---------------------------------------------------------------------------
#endif
