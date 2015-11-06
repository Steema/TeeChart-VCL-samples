//---------------------------------------------------------------------------

#ifndef Series_CalendarH
#define Series_CalendarH
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
#include "TeeCalendar.hpp"
//---------------------------------------------------------------------------
class TCalendarSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TPanel *Panel2;
        TChart *Chart2;
        TCalendarSeries *Series1;
        TChart *Chart3;
        TCalendarSeries *Series2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        TCalendarSeries *Calendar;
        __fastcall TCalendarSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCalendarSeriesForm *CalendarSeriesForm;
//---------------------------------------------------------------------------
#endif
