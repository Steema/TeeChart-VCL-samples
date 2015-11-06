//---------------------------------------------------------------------------

#ifndef Chart_SubGalleryH
#define Chart_SubGalleryH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Chart_Gallery.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TChartSubGallery : public TChartGallery
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
        __fastcall TChartSubGallery(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartSubGallery *ChartSubGallery;
//---------------------------------------------------------------------------
#endif
