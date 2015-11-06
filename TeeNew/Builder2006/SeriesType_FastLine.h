//---------------------------------------------------------------------------

#ifndef SeriesType_FastLineH
#define SeriesType_FastLineH
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
class TFastLineForm : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *FastLineSeries1;
        TFastLineSeries *FastLineSeries2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFastLineForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFastLineForm *FastLineForm;
//---------------------------------------------------------------------------
#endif
