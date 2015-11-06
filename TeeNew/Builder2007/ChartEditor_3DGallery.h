//---------------------------------------------------------------------------

#ifndef ChartEditor_3DGalleryH
#define ChartEditor_3DGalleryH
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
#include <TeeThemes.hpp>
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TGallery3DForm : public TBaseForm
{
__published:	// IDE-managed Components
    TSurfaceSeries *Series1;
    TButton *Button1;
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TGallery3DForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGallery3DForm *Gallery3DForm;
//---------------------------------------------------------------------------
#endif
