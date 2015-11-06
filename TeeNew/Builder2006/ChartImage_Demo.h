// NOTE:
// The ChartImage class resides at TeeEditPro.pas unit.
// It is automatically registered into VCL image formats.
//
// If you wish to remove ChartImage from the list of registered
// formats, do this:
//
//  TPicture->UnRegisterGraphicClass(TChartImage);
//


//---------------------------------------------------------------------------

#ifndef ChartImage_DemoH
#define ChartImage_DemoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeEditPro.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TChartImageForm : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
        TImage *Image1;
        TPanel *Panel1;
        TCheckBox *CheckBox1;
        TButton *Button1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartImageForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartImageForm *ChartImageForm;
//---------------------------------------------------------------------------
#endif
