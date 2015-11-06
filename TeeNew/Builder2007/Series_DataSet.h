//---------------------------------------------------------------------------

#ifndef Series_DataSetH
#define Series_DataSetH
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
#include "TeeData.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TSeriesDataSetForm : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TSeriesDataSet *SeriesDataSet1;
        TDataSource *DataSource1;
        TIntegerField *SeriesDataSet1Color;
        TFloatField *SeriesDataSet1X;
        TFloatField *SeriesDataSet1Y;
        TStringField *SeriesDataSet1Label;
        TFloatField *SeriesDataSet1Z;
        TCheckBox *CheckBox1;
        TRotateTool *ChartTool1;
        TPanel *Panel2;
        TDBGrid *DBGrid1;
        TDBNavigator *DBNavigator1;
        void __fastcall DBGrid1DrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall DBGrid1EditButtonClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSeriesDataSetForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesDataSetForm *SeriesDataSetForm;
//---------------------------------------------------------------------------
#endif
