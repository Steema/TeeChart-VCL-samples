//---------------------------------------------------------------------------

#ifndef Axes_LabelsFormatH
#define Axes_LabelsFormatH
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
class TAxesLabelsFormat : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TComboBox *ComboBox1;
    TCheckBox *CheckBox1;
    TButton *Button1;
    TBarSeries *Series1;
  void __fastcall ComboBox1Change(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
    TTeeShape * __fastcall LabelsFormat(void);
public:		// User declarations
  __fastcall TAxesLabelsFormat(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxesLabelsFormat *AxesLabelsFormat;
//---------------------------------------------------------------------------
#endif
