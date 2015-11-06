//---------------------------------------------------------------------------

#ifndef ColorGrid_BitmapH
#define ColorGrid_BitmapH
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
#include "TeePenDlg.hpp"
#include "TeeSurfa.hpp"
#include <jpeg.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TColorGridBitmap : public TBaseForm
{
__published:	// IDE-managed Components
    TColorGridSeries *Series1;
    TImage *Image1;
    TButton *Button1;
    TButton *Button2;
    TButtonPen *ButtonPen1;
    TComboFlat *ComboFlat1;
    TTeeOpenGL *TeeOpenGL1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall ComboFlat1Change(TObject *Sender);
  void __fastcall Memo1DblClick(TObject *Sender);
private:	// User declarations
    void __fastcall SetFlower(void);
public:		// User declarations
  __fastcall TColorGridBitmap(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorGridBitmap *ColorGridBitmap;
//---------------------------------------------------------------------------
#endif
