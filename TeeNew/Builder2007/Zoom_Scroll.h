//---------------------------------------------------------------------------

#ifndef Zoom_ScrollH
#define Zoom_ScrollH
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
class TZoomScrollForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TLineSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TZoomScrollForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TZoomScrollForm *ZoomScrollForm;
//---------------------------------------------------------------------------
#endif
