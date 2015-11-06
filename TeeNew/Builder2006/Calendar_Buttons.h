//---------------------------------------------------------------------------

#ifndef Calendar_ButtonsH
#define Calendar_ButtonsH
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
#include <EditChar.hpp>
#include "TeeCalendar.hpp"
//---------------------------------------------------------------------------
class TCalendarButtons : public TBaseForm
{
__published:	// IDE-managed Components
    TCalendarSeries *Series1;
    TCheckBox *CheckBox1;
    TLabel *Label1;
    TComboBox *ComboBox1;
    TButton *Button1;
    TButton *Button2;
    TCheckBox *CheckBox2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCalendarButtons(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCalendarButtons *CalendarButtons;
//---------------------------------------------------------------------------
#endif
