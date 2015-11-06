//---------------------------------------------------------------------------

#ifndef Export_HTMLH
#define Export_HTMLH
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
#include <Dialogs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TExportHTMLForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TBarSeries *Series3;
        TBarSeries *Series4;
        TButton *Button1;
        TSaveDialog *SaveDialog1;
        TButton *Button2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
        void __fastcall ShowSavedFile();
public:		// User declarations
        __fastcall TExportHTMLForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportHTMLForm *ExportHTMLForm;
//---------------------------------------------------------------------------
#endif
