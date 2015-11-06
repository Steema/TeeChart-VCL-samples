//---------------------------------------------------------------------------

#ifndef ColorGrid_TransparentH
#define ColorGrid_TransparentH
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
//---------------------------------------------------------------------------
class TColorGridTransparent : public TBaseForm
{
__published:	// IDE-managed Components
        TColorGridSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
        void __fastcall SetTransparentColors();
public:		// User declarations
        __fastcall TColorGridTransparent(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorGridTransparent *ColorGridTransparent;
//---------------------------------------------------------------------------
#endif
