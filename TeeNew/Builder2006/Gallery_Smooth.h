//---------------------------------------------------------------------------

#ifndef Gallery_SmoothH
#define Gallery_SmoothH
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
#include "TeeGalleryPanel.hpp"
//---------------------------------------------------------------------------
class TGallerySmooth : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TChartGalleryPanel *ChartGalleryPanel1;
    TButton *Button1;
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TGallerySmooth(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGallerySmooth *GallerySmooth;
//---------------------------------------------------------------------------
#endif
