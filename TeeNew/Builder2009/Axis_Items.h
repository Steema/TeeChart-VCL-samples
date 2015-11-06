//---------------------------------------------------------------------------

#ifndef Axis_ItemsH
#define Axis_ItemsH
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
class TAxisItemsDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TLineSeries *Series1;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TEdit *Edit2;
    TButton *Button1;
    TUpDown *UpDown2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall Edit2Change(TObject *Sender);
private:	// User declarations
  void __fastcall AddCustomLabels(void);
  void __fastcall SetDemoControls(void);
public:		// User declarations
  __fastcall TAxisItemsDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisItemsDemo *AxisItemsDemo;
//---------------------------------------------------------------------------
#endif
