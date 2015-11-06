//---------------------------------------------------------------------------

#ifndef Export_XMLH
#define Export_XMLH
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
class TExportXMLForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TCheckBox *CheckBox1;
        TButton *Button2;
        TSaveDialog *SaveDialog1;
        TPointSeries *Series1;
        TPointSeries *Series2;
        TPointSeries *Series3;
        TPointSeries *Series4;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
        void __fastcall ShowSavedFile();
public:		// User declarations
        __fastcall TExportXMLForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportXMLForm *ExportXMLForm;
//---------------------------------------------------------------------------
#endif
