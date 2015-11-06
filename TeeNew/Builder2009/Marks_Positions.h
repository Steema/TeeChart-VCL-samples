//---------------------------------------------------------------------------

#ifndef Marks_PositionsH
#define Marks_PositionsH
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
#include <Buttons.hpp>
#include <Dialogs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMarksPositions : public TBaseForm
{
__published:	// IDE-managed Components
        TPieSeries *Series1;
        TDragMarksTool *ChartTool1;
        TSpeedButton *Button1;
        TSpeedButton *Button2;
        TOpenDialog *OpenDialog1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksPositions(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksPositions *MarksPositions;
//---------------------------------------------------------------------------
#endif
