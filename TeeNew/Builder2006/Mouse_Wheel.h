//---------------------------------------------------------------------------

#ifndef Mouse_WheelH
#define Mouse_WheelH
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
class TMouseWheelForm : public TBaseForm
{
__published:	// IDE-managed Components
        THorizLineSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *LabelMouse;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMouseWheelForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMouseWheelForm *MouseWheelForm;
//---------------------------------------------------------------------------
#endif
