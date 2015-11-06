//---------------------------------------------------------------------------

#ifndef Tool_DragPointH
#define Tool_DragPointH
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
#include <TeeDragPoint.hpp>
#include "TeeChartGrid.hpp"
#include <Grids.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDragPointToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TChartGrid *ChartGrid1;
        TButton *Button1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TLineSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
        TDragPointTool *DragPoint;
        void __fastcall DragPointEvent(TDragPointTool *Sender, int Index);
public:		// User declarations
        __fastcall TDragPointToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDragPointToolDemo *DragPointToolDemo;
//---------------------------------------------------------------------------
#endif
