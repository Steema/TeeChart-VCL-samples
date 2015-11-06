//---------------------------------------------------------------------------

#ifndef ColorLine_Draw3DH
#define ColorLine_Draw3DH
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
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TColorLine3D : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TColorLineTool *ChartTool1;
    TPointSeries *Series1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TColorLine3D(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorLine3D *ColorLine3D;
//---------------------------------------------------------------------------
#endif
