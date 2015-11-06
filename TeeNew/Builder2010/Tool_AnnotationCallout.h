//---------------------------------------------------------------------------

#ifndef Tool_AnnotationCalloutH
#define Tool_AnnotationCalloutH
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
class TAnnotationCO : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TButtonPen *ButtonPen1;
    TPointSeries *Series1;
    TAnnotationTool *ChartTool1;
    TCheckBox *CheckBox1;
  void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Chart1ClickSeries(TCustomChart *Sender,
          TChartSeries *Series, int ValueIndex, TMouseButton Button,
          TShiftState Shift, int X, int Y);
private:	// User declarations
  void __fastcall SetCallout(int AIndex);
  int __fastcall NearestPoint(TChartSeries *ASeries, int x, int y);
public:		// User declarations
  __fastcall TAnnotationCO(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAnnotationCO *AnnotationCO;
//---------------------------------------------------------------------------
#endif
