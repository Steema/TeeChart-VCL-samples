//---------------------------------------------------------------------------

#ifndef Legend_CustomPosH
#define Legend_CustomPosH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base_CustomPos.h"
#include <Chart.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendCustomPos : public TBaseCustomPos
{
__published:	// IDE-managed Components
        TPieSeries *Series1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TrackBar1Change(TObject *Sender);
        void __fastcall TrackBar2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendCustomPos(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendCustomPos *LegendCustomPos;
//---------------------------------------------------------------------------
#endif
