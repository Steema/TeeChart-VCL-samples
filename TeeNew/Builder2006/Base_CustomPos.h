//---------------------------------------------------------------------------

#ifndef Base_CustomPosH
#define Base_CustomPosH
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
class TBaseCustomPos : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TTrackBar *TrackBar1;
        TTrackBar *TrackBar2;
        TLabel *Label2;
private:	// User declarations
public:		// User declarations
        __fastcall TBaseCustomPos(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBaseCustomPos *BaseCustomPos;
//---------------------------------------------------------------------------
#endif
