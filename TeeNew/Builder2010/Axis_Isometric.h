//---------------------------------------------------------------------------

#ifndef Axis_IsometricH
#define Axis_IsometricH
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
class TIsometricAxis : public TBaseForm
{
__published:	// IDE-managed Components
  TLineSeries *Series1;
  TButton *Button1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Chart1Zoom(TObject *Sender);
  void __fastcall Chart1UndoZoom(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TIsometricAxis(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TIsometricAxis *IsometricAxis;
//---------------------------------------------------------------------------
#endif
