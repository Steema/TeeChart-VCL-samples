//---------------------------------------------------------------------------

#ifndef Series3D_RangePaletteH
#define Series3D_RangePaletteH
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
#include <ComCtrls.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TSeries3DRangePalette : public TBaseForm
{
__published:	// IDE-managed Components
        TButtonColor *ButtonColor1;
        TButtonColor *ButtonColor2;
        TButtonColor *ButtonColor3;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TCheckBox *CheckBox1;
        TColorGridSeries *Series1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ButtonColor1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSeries3DRangePalette(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeries3DRangePalette *Series3DRangePalette;
//---------------------------------------------------------------------------
#endif
