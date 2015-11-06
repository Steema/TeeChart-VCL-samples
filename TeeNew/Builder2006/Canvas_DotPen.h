//---------------------------------------------------------------------------

#ifndef Canvas_DotPenH
#define Canvas_DotPenH
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
class TCanvasDotPen : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TFastLineSeries *Series1;
        TFastLineSeries *Series2;
        TFastLineSeries *Series3;
        TFastLineSeries *Series4;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCanvasDotPen(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCanvasDotPen *CanvasDotPen;
//---------------------------------------------------------------------------
#endif
