//---------------------------------------------------------------------------

#ifndef DrawLine_StyleH
#define DrawLine_StyleH
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
class TDrawLineStyleForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TComboBox *ComboBox1;
        TDrawLineTool *ChartTool1;
        TLabel *Label2;
        TFastLineSeries *Series1;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall ChartTool1NewLine(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDrawLineStyleForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDrawLineStyleForm *DrawLineStyleForm;
//---------------------------------------------------------------------------
#endif
