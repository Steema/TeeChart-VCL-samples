//---------------------------------------------------------------------------

#ifndef Pie_SemiH
#define Pie_SemiH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPieSemi : public TBaseForm
{
__published:	// IDE-managed Components
        TPieSeries *Series1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPieSemi(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieSemi *PieSemi;
//---------------------------------------------------------------------------
#endif
