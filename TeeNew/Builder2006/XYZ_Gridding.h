//---------------------------------------------------------------------------

#ifndef XYZ_GriddingH
#define XYZ_GriddingH
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
#include "TeePoin3.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TXYZGridding : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TPoint3DSeries *Series1;
    TSurfaceSeries *Series2;
    TRadioButton *RadioButton1;
    TRadioButton *RadioButton2;
    TRotateTool *ChartTool1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall RadioButton1Click(TObject *Sender);
  void __fastcall RadioButton2Click(TObject *Sender);
private:	// User declarations
    void __fastcall Fill(void);
    TChartValue __fastcall ClosestValue(TCustom3DSeries *Source, const TChartValue X, const TChartValue Z);
    void __fastcall Gridding(TCustom3DSeries *Source, TCustom3DGridSeries *Dest, const int GridSize);
public:		// User declarations
  __fastcall TXYZGridding(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TXYZGridding *XYZGridding;
//---------------------------------------------------------------------------
#endif
