//---------------------------------------------------------------------------

#ifndef Chart_EditorPanelH
#define Chart_EditorPanelH
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
#include "TeeEdit.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TChartEditorPanelForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartEditorPanel *ChartEditorPanel1;
        THorizLineSeries *Series1;
        TSplitter *Splitter1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TLabel *Label2;
        TComboBox *ComboBox2;
        TMarksTipTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall ComboBox2Change(TObject *Sender);
        void __fastcall Chart1MouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartEditorPanelForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartEditorPanelForm *ChartEditorPanelForm;
//---------------------------------------------------------------------------
#endif
