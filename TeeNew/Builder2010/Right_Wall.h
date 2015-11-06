//---------------------------------------------------------------------------

#ifndef Right_WallH
#define Right_WallH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TRightWallForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRightWallForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRightWallForm *RightWallForm;
//---------------------------------------------------------------------------
#endif
