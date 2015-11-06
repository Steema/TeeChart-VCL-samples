//---------------------------------------------------------------------------

#ifndef ColorGrid_SeriesH
#define ColorGrid_SeriesH
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
#include "TeePenDlg.hpp"
#include "TeeSurfa.hpp"
#include <ComCtrls.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TColorGrid : public TBaseForm
{
__published:	// IDE-managed Components
        TColorGridSeries *Series1;
        TCheckBox *CheckBox1;
        TButtonPen *ButtonPen1;
        TButton *Button1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ButtonPen1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
        void __fastcall SetGridControls();
public:		// User declarations
        __fastcall TColorGrid(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorGrid *ColorGrid;
//---------------------------------------------------------------------------
#endif
