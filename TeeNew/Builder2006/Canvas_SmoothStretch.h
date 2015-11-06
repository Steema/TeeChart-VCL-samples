//---------------------------------------------------------------------------

#ifndef Canvas_SmoothStretchH
#define Canvas_SmoothStretchH
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
//---------------------------------------------------------------------------
class TCanvasSmoothStretch : public TBaseForm
{
__published:	// IDE-managed Components
    TRadioGroup *RadioGroup1;
    TPieSeries *Series1;
    TPanel *Panel2;
    TImage *Image1;
    TLabel *Label1;
    TLabel *Label2;
    TImage *Image2;
  void __fastcall RadioGroup1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCanvasSmoothStretch(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCanvasSmoothStretch *CanvasSmoothStretch;
//---------------------------------------------------------------------------
#endif
