//---------------------------------------------------------------------------

#ifndef Bubble_TransparencyH
#define Bubble_TransparencyH
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
#include "TeeOpenGL.hpp"
#include <BubbleCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBubbleTransparency : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TScrollBar *ScrollBar1;
    TLabel *Label2;
    TBubbleSeries *Series1;
    TTeeOpenGL *TeeOpenGL1;
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TBubbleTransparency(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBubbleTransparency *BubbleTransparency;
//---------------------------------------------------------------------------
#endif
