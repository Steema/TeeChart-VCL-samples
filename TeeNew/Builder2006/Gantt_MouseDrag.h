//---------------------------------------------------------------------------

#ifndef Gantt_MouseDragH
#define Gantt_MouseDragH
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
#include "TeeGanttTool.hpp"
#include <GanttCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TGanttMouseForm : public TBaseForm
{
__published:	// IDE-managed Components
    TGanttSeries *Series1;
    TButton *Button1;
    TButton *Button2;
    TComboBox *ComboBox1;
    TButton *Button3;
    TButton *Button4;
    TScrollBar *ScrollBar1;
    TLabel *Label1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Chart1MouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall ComboBox1Change(TObject *Sender);
  void __fastcall Button3Click(TObject *Sender);
  void __fastcall Button4Click(TObject *Sender);
  void __fastcall Series1GetMarkText(TChartSeries *Sender, int ValueIndex,
          AnsiString &MarkText);
private:	// User declarations
    TGanttTool *Gantt;
    void _fastcall GanttTool1DragBar(TGanttTool *Sender, int GanttBar);
public:		// User declarations
  __fastcall TGanttMouseForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGanttMouseForm *GanttMouseForm;
//---------------------------------------------------------------------------
#endif
