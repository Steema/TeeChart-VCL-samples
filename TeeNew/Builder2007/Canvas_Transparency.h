//---------------------------------------------------------------------------

#ifndef Canvas_TransparencyH
#define Canvas_TransparencyH
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
#include <BubbleCh.hpp>
#include <jpeg.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TTransparencyForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBubbleSeries *Series1;
        TLabel *Label1;
        TScrollBar *ScrollBar1;
        TLabel *Label2;
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTransparencyForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTransparencyForm *TransparencyForm;
//---------------------------------------------------------------------------
#endif
