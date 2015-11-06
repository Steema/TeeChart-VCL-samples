//---------------------------------------------------------------------------

#ifndef Series_ImageBarH
#define Series_ImageBarH
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
#include "ImageBar.hpp"
#include <Dialogs.hpp>
#include <ExtDlgs.hpp>
#include <Graphics.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TImageBarForm : public TBaseForm
{
__published:	// IDE-managed Components
        TImageBarSeries *Series1;
        TLabel *Label1;
        TImage *Image1;
        TCheckBox *CheckBox1;
        TOpenPictureDialog *OpenPictureDialog1;
        TCheckBox *CheckBox2;
        TButtonColor *ButtonColor1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Image1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TImageBarForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TImageBarForm *ImageBarForm;
//---------------------------------------------------------------------------
#endif
