//---------------------------------------------------------------------------

#ifndef Tool_PieH
#define Tool_PieH
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
#include "TeePieTool.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TPieToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TPieSeries *Series1;
    TPieTool *ChartTool1;
    TLabel *Label1;
    TLabel *Label2;
    TShape *Shape1;
    TButtonPen *ButtonPen1;
    TButton *Button1;
  void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ButtonPen1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPieToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieToolDemo *PieToolDemo;
//---------------------------------------------------------------------------
#endif
