//---------------------------------------------------------------------------

#ifndef Tools_ImageH
#define Tools_ImageH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
#include <jpeg.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TImageToolForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartImageTool *ChartTool1;
        TContourSeries *Series1;
        TLabel *Label1;
        TScrollBar *ScrollBar1;
        TPointSeries *Series2;
        TButton *Button1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
        int OldZoom;
public:		// User declarations
        __fastcall TImageToolForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TImageToolForm *ImageToolForm;
//---------------------------------------------------------------------------
#endif
