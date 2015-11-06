//---------------------------------------------------------------------------

#ifndef Series_DeltaPointH
#define Series_DeltaPointH
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
#include "ImaPoint.hpp"
#include <Dialogs.hpp>
#include <ExtDlgs.hpp>
#include <Graphics.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDeltaPointForm : public TBaseForm
{
__published:	// IDE-managed Components
        TDeltaPointSeries *Series1;
        TLabel *Label1;
        TImage *Image1;
        TImage *Image2;
        TImage *Image3;
        TOpenPictureDialog *OpenPictureDialog1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Image1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDeltaPointForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDeltaPointForm *DeltaPointForm;
//---------------------------------------------------------------------------
#endif
