//---------------------------------------------------------------------------

#ifndef Marks_PerPointH
#define Marks_PerPointH
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
class TMarksPerPoint : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TButton *Button1;
    TButton *Button2;
    TPieSeries *Series1;
    TLabel *Label2;
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TMarksPerPoint(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksPerPoint *MarksPerPoint;
//---------------------------------------------------------------------------
#endif
