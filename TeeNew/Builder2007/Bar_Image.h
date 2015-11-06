//---------------------------------------------------------------------------

#ifndef Bar_ImageH
#define Bar_ImageH
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
#include <ImgList.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBarImage : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TImageList *ImageList1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarImage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarImage *BarImage;
//---------------------------------------------------------------------------
#endif
