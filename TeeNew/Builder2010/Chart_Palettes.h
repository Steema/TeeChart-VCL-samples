//---------------------------------------------------------------------------

#ifndef Chart_PalettesH
#define Chart_PalettesH
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
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TCustomPalettes : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabel *Label2;
    TComboBox *ComboBox1;
    TComboFlat *CBPalette;
    TBarSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CBPaletteChange(TObject *Sender);
  void __fastcall ComboBox1Change(TObject *Sender);
private:	// User declarations
    TColor *RedPalette;
    TColor *BluePalette;
    TColor *GreenPalette;
public:		// User declarations
  __fastcall TCustomPalettes(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomPalettes *CustomPalettes;
//---------------------------------------------------------------------------
#endif
