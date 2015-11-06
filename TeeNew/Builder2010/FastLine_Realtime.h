//---------------------------------------------------------------------------

#ifndef FastLine_RealtimeH
#define FastLine_RealtimeH
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
#include <Buttons.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TFastDeleteRealtime : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabel *Label2;
    TBitBtn *BitBtn1;
    TCheckBox *CheckBox1;
    TEdit *Edit1;
    TEdit *Edit2;
    TCheckBox *CheckBox2;
    TFastLineSeries *Series1;
    TFastLineSeries *Series2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall BitBtn1Click(TObject *Sender);
  void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
    bool Stopped;    // are we in "loop" mode ?
    int MaxPoints;    // total points per Series
    int ScrollPoints;    // number of points to scroll when filled
    void __fastcall DoScrollPoints(void);
public:		// User declarations
  __fastcall TFastDeleteRealtime(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFastDeleteRealtime *FastDeleteRealtime;
//---------------------------------------------------------------------------
#endif
