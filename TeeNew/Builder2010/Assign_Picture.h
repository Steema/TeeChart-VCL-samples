//---------------------------------------------------------------------------

#ifndef Assign_PictureH
#define Assign_PictureH
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
#include "TeePolar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAssignPicture : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TRadarSeries *Series1;
        TImage *Image1;
        TSplitter *Splitter1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAssignPicture(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAssignPicture *AssignPicture;
//---------------------------------------------------------------------------
#endif
