//---------------------------------------------------------------------------

#ifndef Tool_PageNumDemoH
#define Tool_PageNumDemoH
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
#include <TeeNavigator.hpp>
#include <Series.hpp>
#include <TeeTools.hpp>
#include <TeePageNumTool.hpp>
#include "TeeEdiGene.hpp"
//---------------------------------------------------------------------------
class TPageNumToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        TLineSeries *Series2;
        TLabel *Label1;
        TEdit *Edit1;
        TLabel *Label2;
        TComboBox *ComboBox1;
        TChartPageNavigator *ChartPageNavigator1;
        TLabel *Label3;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
        TPageNumTool *PageTool;
        __fastcall TPageNumToolDemo(TComponent* Owner);
        __fastcall ~TPageNumToolDemo(void);

};
//---------------------------------------------------------------------------
extern PACKAGE TPageNumToolDemo *PageNumToolDemo;
//---------------------------------------------------------------------------
#endif
