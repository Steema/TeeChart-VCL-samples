//---------------------------------------------------------------------------

#ifndef Brush_StylesH
#define Brush_StylesH
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
#include <Buttons.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBrushStyleForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton2;
        TSpeedButton *SpeedButton3;
        TSpeedButton *SpeedButton4;
        TSpeedButton *SpeedButton5;
        TSpeedButton *SpeedButton6;
        TSpeedButton *SpeedButton7;
        TSpeedButton *SpeedButton8;
        TSpeedButton *SpeedButton9;
        TSpeedButton *SpeedButton10;
        TSpeedButton *SpeedButton11;
        TSpeedButton *SpeedButton12;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBrushStyleForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBrushStyleForm *BrushStyleForm;
//---------------------------------------------------------------------------
#endif
