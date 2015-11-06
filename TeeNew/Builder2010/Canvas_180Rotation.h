//---------------------------------------------------------------------------

#ifndef Canvas_180RotationH
#define Canvas_180RotationH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCanvas180Rotation : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TScrollBar *ScrollBar1;
    TLabel *Label2;
    TBarSeries *Series1;
  TCheckBox *CheckBox1;
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
  void __fastcall AutoHideWalls(TCustomChart *AChart);
public:		// User declarations
  __fastcall TCanvas180Rotation(TComponent* Owner);
};

//---------------------------------------------------------------------------
extern PACKAGE TCanvas180Rotation *Canvas180Rotation;
//---------------------------------------------------------------------------
#endif
