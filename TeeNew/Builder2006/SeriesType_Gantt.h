//---------------------------------------------------------------------------

#ifndef SeriesType_GanttH
#define SeriesType_GanttH
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
#include <GanttCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TGanttSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TGanttSeries *Series1;
        TCheckBox *CheckBox1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TGanttSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGanttSeriesForm *GanttSeriesForm;
//---------------------------------------------------------------------------
#endif
