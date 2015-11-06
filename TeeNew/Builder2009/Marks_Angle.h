//---------------------------------------------------------------------------

#ifndef Marks_AngleH
#define Marks_AngleH
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
class TMarksAngle : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TAreaSeries *Series1;
        TButton *Button1;
        TButton *Button2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksAngle(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksAngle *MarksAngle;
//---------------------------------------------------------------------------
#endif
