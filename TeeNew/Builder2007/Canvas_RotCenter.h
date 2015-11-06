//---------------------------------------------------------------------------

#ifndef Canvas_RotCenterH
#define Canvas_RotCenterH
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
#include "TeeChartActions.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TRotationCenter : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TLabel *Label1;
        TLabel *Label2;
        TTrackBar *TrackBar1;
        TLabel *Label4;
        TLabel *Label3;
        TTrackBar *TrackBar2;
        TTrackBar *TrackBar3;
        TCheckBox *CheckBox1;
        TTimer *Timer1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TActionList *ActionList1;
        TSeriesActionActive *SeriesActionActive1;
        TRotateTool *ChartTool1;
        void __fastcall TrackBar1Change(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall TrackBar2Change(TObject *Sender);
        void __fastcall TrackBar3Change(TObject *Sender);
        void __fastcall Chart1AfterDraw(TObject *Sender);
private:	// User declarations
        int Delta;
public:		// User declarations
        __fastcall TRotationCenter(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRotationCenter *RotationCenter;
//---------------------------------------------------------------------------
#endif
