//---------------------------------------------------------------------------

#ifndef BackWall_GradientH
#define BackWall_GradientH
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
//---------------------------------------------------------------------------
class TBackWallGradient : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TButton *Button1;
    TRotateTool *ChartTool1;
    TTimer *Timer1;
    TCheckBox *CheckBox2;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
        int DeltaR, DeltaE;
public:		// User declarations
        __fastcall TBackWallGradient(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBackWallGradient *BackWallGradient;
//---------------------------------------------------------------------------
#endif
