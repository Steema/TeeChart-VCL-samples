//---------------------------------------------------------------------------

#ifndef Chart_GalleryH
#define Chart_GalleryH
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
#include <TeeGally.hpp>
//---------------------------------------------------------------------------
class TChartGallery : public TBaseForm
{
__published:	// IDE-managed Components
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        TTeeGallery *Gallery;
        __fastcall TChartGallery(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartGallery *ChartGallery;
//---------------------------------------------------------------------------
#endif
