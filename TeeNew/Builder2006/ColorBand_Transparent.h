//---------------------------------------------------------------------------

#ifndef ColorBand_TransparentH
#define ColorBand_TransparentH
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
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TColorBandTransp : public TBaseForm
{
__published:	// IDE-managed Components
        TColorBandTool *ChartTool1;
        TLabel *Label1;
        TTrackBar *TrackBar1;
        TAreaSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TrackBar1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TColorBandTransp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorBandTransp *ColorBandTransp;
//---------------------------------------------------------------------------
#endif
