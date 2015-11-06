//---------------------------------------------------------------------------

#ifndef SeriesType_PolarH
#define SeriesType_PolarH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeEdit.hpp"
#include "TeePolar.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TPolarForm : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TPolarSeries *PolarSeries1;
        TPolarSeries *PolarSeries2;
        TPanel *Panel1;
        TCheckBox *CheckBox1;
        TTimer *Timer1;
        TCheckBox *CheckBox2;
        TTeeCommander *TeeCommander1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall PolarSeries1Click(TChartSeries *Sender,
          int ValueIndex, TMouseButton Button, TShiftState Shift, int X,
          int Y);
        void __fastcall Chart1AfterDraw(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPolarForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarForm *PolarForm;
//---------------------------------------------------------------------------
#endif
