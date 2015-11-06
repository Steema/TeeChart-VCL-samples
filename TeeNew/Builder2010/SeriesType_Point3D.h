//---------------------------------------------------------------------------

#ifndef SeriesType_Point3DH
#define SeriesType_Point3DH
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
#include "TeePoin3.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TPoint3DSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        TCheckBox *CheckBox5;
        TCheckBox *CheckBox6;
        TRotateTool *ChartTool1;
        TPoint3DSeries *Series1;
        TTimer *Timer1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall CheckBox5Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox6Click(TObject *Sender);
private:	// User declarations
        int DeltaRotate;
        int DeltaElevate;
public:		// User declarations
        __fastcall TPoint3DSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPoint3DSeriesForm *Point3DSeriesForm;
//---------------------------------------------------------------------------
#endif
