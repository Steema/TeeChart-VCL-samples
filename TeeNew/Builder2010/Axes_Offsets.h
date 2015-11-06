//---------------------------------------------------------------------------

#ifndef Axes_OffsetsH
#define Axes_OffsetsH
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
class TAxesOffsets : public TBaseForm
{
__published:	// IDE-managed Components
    TFastLineSeries *Series1;
    TLabel *Label1;
    TComboBox *ComboBox1;
    TLabel *Label2;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TLabel *Label3;
    TEdit *Edit2;
    TUpDown *UpDown2;
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall Edit2Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ComboBox1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TAxesOffsets(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxesOffsets *AxesOffsets;
//---------------------------------------------------------------------------
#endif
