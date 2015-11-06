//---------------------------------------------------------------------------

#ifndef Tools_NearestH
#define Tools_NearestH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TNearestToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TButton *Button1;
        TNearestTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TNearestToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TNearestToolDemo *NearestToolDemo;
//---------------------------------------------------------------------------
#endif
