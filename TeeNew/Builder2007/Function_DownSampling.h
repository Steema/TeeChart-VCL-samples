//---------------------------------------------------------------------------

#ifndef Function_DownSamplingH
#define Function_DownSamplingH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
#include <TeeDownSampling.hpp>
//---------------------------------------------------------------------------
class TDownSampling : public TBaseForm
{
__published:	// IDE-managed Components
    TPointSeries *Series1;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TLabel *Label2;
    TEdit *Edit2;
    TUpDown *UpDown2;
    TLabel *Label3;
    TComboFlat *ComboBox1;
    TLineSeries *Series2;
    TButton *Button1;
    TLabel *Label4;
  void __fastcall ComboBox1Change(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall Edit2Change(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
private:	// User declarations
    TDownSamplingFunction *DownSampleFun;
public:		// User declarations
  __fastcall TDownSampling(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDownSampling *DownSampling;
//---------------------------------------------------------------------------
#endif
