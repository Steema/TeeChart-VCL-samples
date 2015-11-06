//---------------------------------------------------------------------------

#ifndef Tool_3DTransposeH
#define Tool_3DTransposeH
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
#include <TeeTransposeTool.hpp>
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TTransposeToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TSurfaceSeries *Series1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
  double __fastcall GetXZValue(int x,int z);
public:		// User declarations
    TGridTransposeTool *Tool;
  __fastcall TTransposeToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTransposeToolDemo *TransposeToolDemo;
//---------------------------------------------------------------------------
#endif
