//---------------------------------------------------------------------------

#ifndef SeriesType_RadarH
#define SeriesType_RadarH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeePolar.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TRadarForm : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TMemo *Memo1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox5;
        TChart *Chart1;
        TRadarSeries *Series1;
        TRadarSeries *Series2;
        TRadarSeries *Series3;
        TTeeCommander *TeeCommander1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox5Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRadarForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRadarForm *RadarForm;
//---------------------------------------------------------------------------
#endif
