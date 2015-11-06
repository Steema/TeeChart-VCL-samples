//---------------------------------------------------------------------------

#ifndef Function_CCIH
#define Function_CCIH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include "TeeCCIFunction.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCCIFuncDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TLabel *Label2;
    TEdit *Edit2;
    TCandleSeries *Series1;
    TLineSeries *Series2;
    TCCIFunction *TeeFunction1;
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall Edit2Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCCIFuncDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCCIFuncDemo *CCIFuncDemo;
//---------------------------------------------------------------------------
#endif
