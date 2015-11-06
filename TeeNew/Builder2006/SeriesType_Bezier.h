//---------------------------------------------------------------------------

#ifndef SeriesType_BezierH
#define SeriesType_BezierH
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
#include "TeeBezie.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBezierSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBezierSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TLabel *Label2;
        TUpDown *UpDown1;
        TButton *Button1;
        TComboBox *ComboBox1;
        TEdit *Edit1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBezierSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBezierSeriesForm *BezierSeriesForm;
//---------------------------------------------------------------------------
#endif
