//---------------------------------------------------------------------------

#ifndef SeriesType_SurfaceH
#define SeriesType_SurfaceH
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
class TSurfaceSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *Animation1;
        TComboBox *CBColorMode;
        TLabel *Label1;
        TTimer *Timer1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TSurfaceSeries *SurfaceSeries1;
        TRotateTool *ChartTool1;
        TComboBox *ComboBox1;
        void __fastcall FormCreate(TObject *Sender);
        double __fastcall SurfaceSeries1GetYValue(TChartSeries *Sender,
          int X, int Z);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Animation1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall CBColorModeChange(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSurfaceSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceSeriesForm *SurfaceSeriesForm;
//---------------------------------------------------------------------------
#endif
