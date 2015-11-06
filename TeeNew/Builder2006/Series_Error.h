//---------------------------------------------------------------------------

#ifndef Series_ErrorH
#define Series_ErrorH
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
#include "ErrorBar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TErrorSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TErrorSeries *Series1;
        TButton *Button1;
        TComboBox *ComboBox1;
        TLabel *Label1;
        TLabel *Label2;
        TScrollBar *ScrollBar1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TErrorSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TErrorSeriesForm *ErrorSeriesForm;
//---------------------------------------------------------------------------
#endif
