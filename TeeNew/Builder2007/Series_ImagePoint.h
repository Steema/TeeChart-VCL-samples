//---------------------------------------------------------------------------

#ifndef Series_ImagePointH
#define Series_ImagePointH
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
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtDlgs.hpp>
#include <Graphics.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TImagePointForm : public TBaseForm
{
__published:	// IDE-managed Components
        TImagePointSeries *Series1;
        TLabel *Label1;
        TImage *Image1;
        TOpenPictureDialog *OpenPictureDialog1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TLabel *Label3;
        TEdit *Edit2;
        TUpDown *UpDown2;
        void __fastcall Image1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TImagePointForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TImagePointForm *ImagePointForm;
//---------------------------------------------------------------------------
#endif
