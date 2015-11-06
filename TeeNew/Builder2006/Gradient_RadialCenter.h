//---------------------------------------------------------------------------

#ifndef Gradient_RadialCenterH
#define Gradient_RadialCenterH
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
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TGradientRadial : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TTrackBar *TrackBar1;
    TLabel *Label2;
    TTrackBar *TrackBar2;
    TButton *Button1;
  void __fastcall TrackBar1Change(TObject *Sender);
  void __fastcall TrackBar2Change(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TGradientRadial(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGradientRadial *GradientRadial;
//---------------------------------------------------------------------------
#endif
