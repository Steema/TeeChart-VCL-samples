//---------------------------------------------------------------------------

#ifndef SeriesType_ArrowH
#define SeriesType_ArrowH
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
#include "TeeTools.hpp"
#include <ArrowCha.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TArrowSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox3;
        TArrowSeries *Series1;
        TCheckBox *CheckBox1;
        TTimer *Timer1;
        TCheckBox *CheckBox2;
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
        void __fastcall AddRandomArrows();
public:		// User declarations
        __fastcall TArrowSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TArrowSeriesForm *ArrowSeriesForm;
//---------------------------------------------------------------------------
#endif
