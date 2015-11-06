//---------------------------------------------------------------------------

#ifndef PrintPreview_MultiH
#define PrintPreview_MultiH
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
#include "TeePreviewPanel.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPrintPreviewMulti : public TBaseForm
{
__published:	// IDE-managed Components
        TTeePreviewPanel *TeePreviewPanel1;
        TPanel *Panel2;
        TChart *FirstChart;
        TChart *SecondChart;
        TLineSeries *Series1;
        TPointSeries *Series2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TLabel *Label1;
        TComboBox *ComboBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPrintPreviewMulti(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrintPreviewMulti *PrintPreviewMulti;
//---------------------------------------------------------------------------
#endif
