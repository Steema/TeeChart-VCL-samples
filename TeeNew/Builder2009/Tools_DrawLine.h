//---------------------------------------------------------------------------

#ifndef Tools_DrawLineH
#define Tools_DrawLineH
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
#include "TeeTools.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TDrawLineToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TDrawLineTool *ChartTool1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TLabel *NumLines;
        TButtonPen *ButtonPen1;
        TLabel *Label2;
        TComboBox *ComboBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TButton *ButtonDelete;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ChartTool1NewLine(TObject *Sender);
        void __fastcall ButtonPen1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall ChartTool1Select(TObject *Sender);
        void __fastcall ButtonDeleteClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDrawLineToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDrawLineToolDemo *DrawLineToolDemo;
//---------------------------------------------------------------------------
#endif
