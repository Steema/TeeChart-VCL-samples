//---------------------------------------------------------------------------

#ifndef WindRose_SeriesH
#define WindRose_SeriesH
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
class TWindRoseForm : public TBaseForm
{
__published:	// IDE-managed Components
        TWindRoseSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TButton *Button1;
        TWindRoseSeries *Series2;
        TCheckBox *CheckBox2;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TWindRoseForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWindRoseForm *WindRoseForm;
//---------------------------------------------------------------------------
#endif
