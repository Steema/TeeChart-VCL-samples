//---------------------------------------------------------------------------

#ifndef Contour_SmoothSegmentsH
#define Contour_SmoothSegmentsH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TContourSmooth : public TBaseForm
{
__published:	// IDE-managed Components
    TContourSeries *Series1;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TCheckBox *CheckBox3;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TMarksTipTool *ChartTool1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall ChartTool1GetText(TMarksTipTool *Sender,
          AnsiString &Text);
  void __fastcall CheckBox3Click(TObject *Sender);
  void __fastcall Chart1AfterDraw(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TContourSmooth(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourSmooth *ContourSmooth;
//---------------------------------------------------------------------------
#endif
