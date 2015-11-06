//---------------------------------------------------------------------------

#ifndef DesignTime_OptionsH
#define DesignTime_OptionsH
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
#include "TeeEdit.hpp"
//---------------------------------------------------------------------------
class TDesignTimeOptions : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TButton *Button2;
    TButton *Button3;
    TChartEditor *ChartEditor1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall Button3Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TDesignTimeOptions(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDesignTimeOptions *DesignTimeOptions;
//---------------------------------------------------------------------------
#endif
