//---------------------------------------------------------------------------

#ifndef WelcomeH
#define WelcomeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Menus.hpp>
#include "TeeAntiAlias.hpp"
//---------------------------------------------------------------------------
class TWelcomeForm : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TPieSeries *Series1;
        TLineSeries *Series2;
        TLineSeries *Series3;
        TFastLineSeries *Series4;
        TTimer *Timer1;
        TPopupMenu *PopupMenu1;
        TMenuItem *estExcelTheme1;
        TTimer *Timer2;
	TAntiAliasTool *ChartTool1;
        void __fastcall Timer1Timer(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall estExcelTheme1Click(TObject *Sender);
  void __fastcall Timer2Timer(TObject *Sender);
private:	// User declarations
    int Delta;
    int DeltaRot;
    int DeltaElev;
    int NewRotation;
    TChartSeries *TheSeries;
public:		// User declarations
        __fastcall TWelcomeForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWelcomeForm *WelcomeForm;
//---------------------------------------------------------------------------
#endif
