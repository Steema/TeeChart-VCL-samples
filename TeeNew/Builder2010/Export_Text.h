//---------------------------------------------------------------------------

#ifndef Export_TextH
#define Export_TextH
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
class TExportTextForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TLineSeries *Series2;
        TLineSeries *Series3;
        TButton *Button1;
        TButton *Button2;
        TSaveDialog *SaveDialog1;
        TCheckBox *CheckBox1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
        void __fastcall ShowSavedFile();
public:		// User declarations
        __fastcall TExportTextForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportTextForm *ExportTextForm;
//---------------------------------------------------------------------------
#endif
