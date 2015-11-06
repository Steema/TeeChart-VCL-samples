//---------------------------------------------------------------------------

#ifndef Volume_OriginH
#define Volume_OriginH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TVolumeOrigin : public TBaseForm
{
__published:	// IDE-managed Components
    TVolumeSeries *Series1;
    TCheckBox *CheckBox1;
    TEdit *Edit1;
    TUpDown *UpDown1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TVolumeOrigin(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TVolumeOrigin *VolumeOrigin;
//---------------------------------------------------------------------------
#endif
