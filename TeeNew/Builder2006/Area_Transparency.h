//---------------------------------------------------------------------------

#ifndef Area_TransparencyH
#define Area_TransparencyH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAreaTransparency : public TBaseForm
{
__published:	// IDE-managed Components
        TAreaSeries *Series1;
        TAreaSeries *Series2;
        TAreaSeries *Series3;
        TTrackBar *TrackBar1;
        TTrackBar *TrackBar2;
        TTrackBar *TrackBar3;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TrackBar1Change(TObject *Sender);
        void __fastcall TrackBar2Change(TObject *Sender);
        void __fastcall TrackBar3Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAreaTransparency(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAreaTransparency *AreaTransparency;
//---------------------------------------------------------------------------
#endif
