//---------------------------------------------------------------------------

#ifndef Gallery_PanelH
#define Gallery_PanelH
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
#include <TeeGalleryPanel.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TGalleryPanelForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartGalleryPanel *ChartGalleryPanel1;
        TLabel *Label1;
        TLineSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ChartGalleryPanel1ChangeChart(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TGalleryPanelForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGalleryPanelForm *GalleryPanelForm;
//---------------------------------------------------------------------------
#endif
