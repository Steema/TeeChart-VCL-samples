//---------------------------------------------------------------------------

#ifndef ChartGrid_Grid3DH
#define ChartGrid_Grid3DH
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
#include "TeeChartGrid.hpp"
#include "TeeSurfa.hpp"
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TChartGrid3D : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TChartGrid *ChartGrid1;
    TSplitter *Splitter1;
    TColorGridSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TChartGrid3D(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartGrid3D *ChartGrid3D;
//---------------------------------------------------------------------------
#endif
