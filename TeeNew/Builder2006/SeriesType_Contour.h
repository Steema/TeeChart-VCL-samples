//---------------------------------------------------------------------------

#ifndef SeriesType_ContourH
#define SeriesType_ContourH
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
//---------------------------------------------------------------------------
class TContourSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        TCheckBox *CheckBox5;
        TRotateTool *ChartTool1;
        TScrollBar *ScrollBar1;
        TContourSeries *ContourSeries;
        TSurfaceSeries *SurfaceSeries;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox5Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall ContourSeriesGetLevel(TContourSeries *Sender,
          int LevelIndex, double &Value, TColor &Color);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
private:	// User declarations
        double __fastcall RandomXYZ(int X, int Z);
public:		// User declarations
        __fastcall TContourSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourSeriesForm *ContourSeriesForm;
//---------------------------------------------------------------------------
#endif
