//---------------------------------------------------------------------------

#ifndef Series_DesignerH
#define Series_DesignerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TSeriesDesigner : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
        TPanel *Panel1;
        TImage *Image2;
        TImage *Image1;
        TImage *Image3;
private:	// User declarations
public:		// User declarations
        __fastcall TSeriesDesigner(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesDesigner *SeriesDesigner;
//---------------------------------------------------------------------------
#endif
