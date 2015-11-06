//---------------------------------------------------------------------------

#ifndef Function_CompressionH
#define Function_CompressionH
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
#include <Series.hpp>
#include "TeeCompressOHLC.hpp"
//---------------------------------------------------------------------------
class TCompressionDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TComboBox *ComboBox1;
    TLabel *Label2;
    TComboBox *ComboBox2;
    TCandleSeries *Series1;
    TCandleSeries *Series2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ComboBox1Change(TObject *Sender);
  void __fastcall ComboBox2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
    TCompressFunction *Compression;
  __fastcall TCompressionDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCompressionDemo *CompressionDemo;
//---------------------------------------------------------------------------
#endif
