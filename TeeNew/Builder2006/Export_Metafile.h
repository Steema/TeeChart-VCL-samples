//---------------------------------------------------------------------------

#ifndef Export_MetafileH
#define Export_MetafileH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <Chart.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TMetafileForm : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TImage *Image1;
        TBarSeries *BarSeries1;
        TPanel *Panel1;
        TPanel *Panel2;
        TSaveDialog *SaveDialog1;
        TBitBtn *BitBtn2;
        TBitBtn *BitBtn3;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall BitBtn3Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMetafileForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMetafileForm *MetafileForm;
//---------------------------------------------------------------------------
#endif
