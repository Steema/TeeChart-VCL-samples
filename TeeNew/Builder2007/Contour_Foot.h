//---------------------------------------------------------------------------

#ifndef Contour_FootH
#define Contour_FootH
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
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------

class TContourFoot : public TBaseForm
{
__published:	// IDE-managed Components
    TContourSeries *Series1;
    TRadioGroup *RadioGroup1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall RadioGroup1Click(TObject *Sender);
private:	// User declarations
  static const int BIGPADLENGTH = 96;
  static const int BIGPADWIDTH = 64;
  static const int MAXPALETTESTEPS = 16;
  TColor ColorPalette[MAXPALETTESTEPS];
  byte FootScanArray[BIGPADLENGTH][BIGPADWIDTH];
  void __fastcall AddDataToSeries(TCustom3DGridSeries *ASeries, AnsiString fname);
  void __fastcall InitContourSeries(TContourSeries *ASeries);
  void __fastcall InitSeries(TCustom3DGridSeries *ASeries);
public:		// User declarations
  __fastcall TContourFoot(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourFoot *ContourFoot;
//---------------------------------------------------------------------------
#endif
