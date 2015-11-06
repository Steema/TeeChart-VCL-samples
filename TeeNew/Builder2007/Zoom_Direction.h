//---------------------------------------------------------------------------

#ifndef Zoom_DirectionH
#define Zoom_DirectionH
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
class TZoomDirection : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TComboBox *ComboBox1;
        TLineSeries *Series1;
        TLabel *Label2;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TZoomDirection(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TZoomDirection *ZoomDirection;
//---------------------------------------------------------------------------
#endif
