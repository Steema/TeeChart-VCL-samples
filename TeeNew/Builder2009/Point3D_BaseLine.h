//---------------------------------------------------------------------------

#ifndef Point3D_BaseLineH
#define Point3D_BaseLineH
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
#include "TeePenDlg.hpp"
#include "TeePoin3.hpp"
#include "TeeSurfa.hpp"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TPoint3DBaseLine : public TBaseForm
{
__published:	// IDE-managed Components
    TButtonPen *ButtonPen1;
    TPoint3DSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPoint3DBaseLine(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPoint3DBaseLine *Point3DBaseLine;
//---------------------------------------------------------------------------
#endif
