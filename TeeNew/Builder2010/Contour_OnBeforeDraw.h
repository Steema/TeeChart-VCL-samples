//---------------------------------------------------------------------------

#ifndef Contour_OnBeforeDrawH
#define Contour_OnBeforeDrawH
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
#include "TeeSurfa.hpp"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TContourOnBefore : public TBaseForm
{
__published:	// IDE-managed Components
    TContourSeries *Series1;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Series1BeforeDrawLevel(TContourSeries *Sender,
          int LevelIndex);
  void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TContourOnBefore(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TContourOnBefore *ContourOnBefore;
//---------------------------------------------------------------------------
#endif
