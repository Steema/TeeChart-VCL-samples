//---------------------------------------------------------------------------

#ifndef Zoom_PenH
#define Zoom_PenH
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
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TZoomPen : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TButtonPen *ButtonPen1;
        TButton *Button1;
        TLabel *Label1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TZoomPen(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TZoomPen *ZoomPen;
//---------------------------------------------------------------------------
#endif
