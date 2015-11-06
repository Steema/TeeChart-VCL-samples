//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop


#include "Gantt_MouseDrag.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TGanttMouseForm *GanttMouseForm;
//---------------------------------------------------------------------------
__fastcall TGanttMouseForm::TGanttMouseForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void _fastcall TGanttMouseForm::GanttTool1DragBar(TGanttTool *Sender, int GanttBar)
{
  Label1->Caption = DateTimeToStr(Sender->Gantt()->StartValues->Items[GanttBar])+" "+
                   DateTimeToStr(Sender->Gantt()->EndValues->Items[GanttBar]);
}
//---------------------------------------------------------------------------
void __fastcall TGanttMouseForm::FormCreate(TObject *Sender)
{
  // Set 2D
  Chart1->View3D = false;

  // Disable automatic sorting by date
  Series1->XValues->Order = loNone;

  // Fill Gantt with sample date-time values:
  Series1->AddGantt(EncodeDate(2002,4,1),EncodeDate(2002,4,10), 0,"A");
  Series1->AddGantt(EncodeDate(2002,4,5),EncodeDate(2002,4,15), 1,"B");
  Series1->AddGantt(EncodeDate(2002,4,2),EncodeDate(2002,4,8),  2,"C");
  Series1->AddGantt(EncodeDate(2002,4,9),EncodeDate(2002,4,21), 3,"D");

  // Make marks visible
  Series1->Marks->Visible = true;
  Series1->Marks->ShadowSize = 0;
  Series1->Marks->Gradient->Visible = true;

  // Set horizontal bottom axis minimum and maximum
  Chart1->BottomAxis->SetMinMax( EncodeDate(2002,4,1), EncodeDate(2002,5,1) );

  // Set vertical left axis minimum and maximum
  Chart1->LeftAxis->SetMinMax( -2, 5 );
  Chart1->LeftAxis->GridCentered = false;

  // Disable zoom
  Chart1->Zoom->Allow = false;

  // Set horizontal daily Increment for labels and grids:
  Chart1->BottomAxis->Increment = 1.0; // one day;
  Chart1->BottomAxis->LabelsAngle = 90;
  Chart1->BottomAxis->DateTimeFormat = "dd-mmm";

  // initialize Gantt Tool:
  Gantt = new TGanttTool(this);
  Gantt->Series = Series1;
  Gantt->ParentChart = Chart1;
  Gantt->OnDragBar = GanttTool1DragBar;

  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::Chart1MouseUp(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  Label1->Caption = "";
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::ScrollBar1Change(TObject *Sender)
{
  Series1->Pointer->VertSize = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::Button1Click(TObject *Sender)
{
  Chart1->BottomAxis->SetMinMax(Chart1->BottomAxis->Minimum-1.0,Chart1->BottomAxis->Maximum-1.0);
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::Button2Click(TObject *Sender)
{
  Chart1->BottomAxis->SetMinMax(Chart1->BottomAxis->Minimum+1.0,Chart1->BottomAxis->Maximum+1.0);
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Chart1->BottomAxis->Increment = 1.0; break;
    case 1: Chart1->BottomAxis->Increment = 7; break;
    case 2: Chart1->BottomAxis->Increment = 15; break;
    case 3: Chart1->BottomAxis->Increment = 30; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::Button3Click(TObject *Sender)
{
  Chart1->BottomAxis->SetMinMax(Chart1->BottomAxis->Minimum+1.0,Chart1->BottomAxis->Maximum-1.0);
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::Button4Click(TObject *Sender)
{
  Chart1->BottomAxis->SetMinMax(Chart1->BottomAxis->Minimum-1.0,Chart1->BottomAxis->Maximum+1.0);
}
//---------------------------------------------------------------------------

void __fastcall TGanttMouseForm::Series1GetMarkText(TChartSeries *Sender,
      int ValueIndex, AnsiString &MarkText)
{
  // Example, customize Series marks...
  switch (ValueIndex)
  {
    case 0: MarkText = "John"; break;
    case 1: MarkText = "Ann"; break;
    case 2: MarkText = "David"; break;
    case 3: MarkText = "Carol"; break;
  }
}
//---------------------------------------------------------------------------

