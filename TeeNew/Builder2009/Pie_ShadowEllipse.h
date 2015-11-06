//---------------------------------------------------------------------------

#ifndef Pie_ShadowEllipseH
#define Pie_ShadowEllipseH
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

// Draw elliptical shadow on Canvas with starting Color, at R rectangle.
void __fastcall DrawEllipseShadow(TTeeCanvas *Canvas, TColor Color, TRect R);

//---------------------------------------------------------------------------
class TPieShadowEllipse : public TBaseForm
{
__published:	// IDE-managed Components
    TPieSeries *Series1;
    TButtonColor *ButtonColor1;
    TCheckBox *CheckBox1;
  void __fastcall Chart1BeforeDrawSeries(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPieShadowEllipse(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieShadowEllipse *PieShadowEllipse;
//---------------------------------------------------------------------------
#endif
