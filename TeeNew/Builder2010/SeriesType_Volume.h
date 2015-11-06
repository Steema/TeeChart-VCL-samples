//---------------------------------------------------------------------------

#ifndef SeriesType_VolumeH
#define SeriesType_VolumeH
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
#include "CandleCh.hpp"
#include "TeePenDlg.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TVolumeForm : public TBaseForm
{
__published:	// IDE-managed Components
        TVolumeSeries *Series1;
        TButtonPen *ButtonPen1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ButtonPen1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TVolumeForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TVolumeForm *VolumeForm;
//---------------------------------------------------------------------------
#endif
