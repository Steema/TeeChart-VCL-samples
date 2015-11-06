//---------------------------------------------------------------------------

#ifndef BaseH
#define BaseH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <EditChar.hpp>
//---------------------------------------------------------------------------
class TBaseForm : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
        TChart *Chart1;
        TPanel *Panel1;
        TSplitter *BaseSplitter1;
        void __fastcall Memo1DblClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBaseForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBaseForm *BaseForm;
//---------------------------------------------------------------------------
#endif
