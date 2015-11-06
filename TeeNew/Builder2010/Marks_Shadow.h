//---------------------------------------------------------------------------

#ifndef Marks_ShadowH
#define Marks_ShadowH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMarksShadow : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TShape *Shape1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Shape1MouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
        void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksShadow(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksShadow *MarksShadow;
//---------------------------------------------------------------------------
#endif
