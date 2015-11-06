//---------------------------------------------------------------------------

#ifndef Polar_ZonesH
#define Polar_ZonesH
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
#include "TeePolar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPolarZones : public TBaseForm
{
__published:	// IDE-managed Components
    TPolarSeries *Series1;
    TCheckBox *CheckBox1;
  TButton *Button1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Series1BeforeDrawValues(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
    void __fastcall DrawPolarZones(void);
public:		// User declarations
  __fastcall TPolarZones(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarZones *PolarZones;
//---------------------------------------------------------------------------
#endif
