//---------------------------------------------------------------------------

#ifndef SeriesType_HorizBarH
#define SeriesType_HorizBarH
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
class THorizBarSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TComboBox *ComboBox1;
        TLabel *Label2;
        TComboBox *ComboBox2;
        TButton *Button1;
        THorizBarSeries *Series1;
        THorizBarSeries *Series3;
        THorizBarSeries *Series2;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall ComboBox2Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall THorizBarSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THorizBarSeriesForm *HorizBarSeriesForm;
//---------------------------------------------------------------------------
#endif
