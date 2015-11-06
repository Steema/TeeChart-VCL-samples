//---------------------------------------------------------------------------

#ifndef TeeCommander_DemoH
#define TeeCommander_DemoH
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
#include "Bar3D.hpp"
#include "TeeComma.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TTeeCommanderDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TTeeCommander *TeeCommander1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        TBar3DSeries *Series1;
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTeeCommanderDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTeeCommanderDemo *TeeCommanderDemo;
//---------------------------------------------------------------------------
#endif
