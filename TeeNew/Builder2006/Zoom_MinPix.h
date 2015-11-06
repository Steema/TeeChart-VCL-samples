//---------------------------------------------------------------------------

#ifndef Zoom_MinPixH
#define Zoom_MinPixH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TZoomMinPixel : public TBaseForm
{
__published:	// IDE-managed Components
        THorizLineSeries *Series1;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TComboBox *ComboBox1;
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TZoomMinPixel(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TZoomMinPixel *ZoomMinPixel;
//---------------------------------------------------------------------------
#endif
