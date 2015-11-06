//---------------------------------------------------------------------------

#ifndef Tool_DragMarksH
#define Tool_DragMarksH
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
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDragMarksToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        TDragMarksTool *ChartTool1;
        TCheckBox *CheckBox1;
        TButton *Button1;
        TButton *Button2;
        TLineSeries *Series2;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDragMarksToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDragMarksToolDemo *DragMarksToolDemo;
//---------------------------------------------------------------------------
#endif
