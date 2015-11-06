//---------------------------------------------------------------------------

#ifndef Tool_RotateOutlineH
#define Tool_RotateOutlineH
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
#include "TeePenDlg.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TRotateOutline : public TBaseForm
{
__published:	// IDE-managed Components
    TButtonPen *ButtonPen1;
    TCheckBox *CheckBox1;
    THorizAreaSeries *Series1;
    TRotateTool *ChartTool1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TRotateOutline(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRotateOutline *RotateOutline;
//---------------------------------------------------------------------------
#endif
