//---------------------------------------------------------------------------

#ifndef Export_ExcelH
#define Export_ExcelH
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
class TExportExcelForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TBarSeries *Series1;
        TBarSeries *Series2;
        TBarSeries *Series3;
        TBarSeries *Series4;
        TSaveDialog *SaveDialog1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
        void __fastcall ShowSavedFile();
public:		// User declarations
        __fastcall TExportExcelForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportExcelForm *ExportExcelForm;
//---------------------------------------------------------------------------
#endif
