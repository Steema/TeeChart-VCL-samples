//---------------------------------------------------------------------------

#ifndef Tools_ColorLineH
#define Tools_ColorLineH
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
class TColorLineForm : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        TLineSeries *Series2;
        TColorLineTool *ChartTool1;
        TColorLineTool *ChartTool2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TButtonPen *ButtonPen1;
        TButtonPen *ButtonPen2;
        TLabel *Label1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall ChartTool1DragLine(TColorLineTool *Sender);
        void __fastcall ChartTool1EndDragLine(TColorLineTool *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TColorLineForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorLineForm *ColorLineForm;
//---------------------------------------------------------------------------
#endif
