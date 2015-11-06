//---------------------------------------------------------------------------

#ifndef RichText_DrawingH
#define RichText_DrawingH
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
//---------------------------------------------------------------------------
class TRichTextDrawing : public TBaseForm
{
__published:	// IDE-managed Components
  void __fastcall Chart1AfterDraw(TObject *Sender);
private:	// User declarations
  void __fastcall DrawRichText(TCustomTeePanel *Chart,TRichEdit *RichEdit,TRect R);
  void __fastcall DrawRichText(TCustomTeePanel *Chart,const AnsiString RichText,TRect R);
public:		// User declarations
  __fastcall TRichTextDrawing(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRichTextDrawing *RichTextDrawing;
//---------------------------------------------------------------------------
#endif
