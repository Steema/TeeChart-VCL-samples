//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FastLine_Realtime.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFastDeleteRealtime *FastDeleteRealtime;
//---------------------------------------------------------------------------
__fastcall TFastDeleteRealtime::TFastDeleteRealtime(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFastDeleteRealtime::FormCreate(TObject *Sender)
{
  // Prepare chart for maximum speed:

  Chart1->ClipPoints = false;
  Chart1->Title->Visible = false;
  Chart1->Legend->Visible = false;
  Chart1->LeftAxis->Axis->Width = 1;
  Chart1->BottomAxis->Axis->Width = 1;
  Chart1->BottomAxis->RoundFirstLabel = false;
  Chart1->View3D = false;

  // Private variables for this demo:
  Stopped = true;
  MaxPoints = 10000;
  ScrollPoints = 5000;

  // Prepare series.
  // Disable AutoRepaint and X Order

  // AutoRepaint=False means "real-time" drawing mode.
  // Points are displayed just after adding them,
  // without redrawing the whole chart.
  Series1->AutoRepaint = false;
  Series1->XValues->Order = loNone;
  Series2->AutoRepaint = false;
  Series2->XValues->Order = loNone;

  // Initial axis
  Chart1->LeftAxis->SetMinMax(0,10000);
  Chart1->BottomAxis->SetMinMax(1,MaxPoints);

  // Speed tips:
  // When using only a single thread, disable locking:
  Chart1->Canvas->ReferenceCanvas->Pen->OwnerCriticalSection = 0;
  Series1->LinePen->OwnerCriticalSection = 0;
  Series2->LinePen->OwnerCriticalSection = 0;

  // For Windows NT, 2000 and XP only:
  // Speed realtime painting with solid pens of width 1.
  Series1->FastPen = true;
  Series2->FastPen = true;
}
//---------------------------------------------------------------------------
void __fastcall RealTimeAdd(TChartSeries *Series)
{
  double XValue,YValue;
  if (Series->Count() == 0) // First random point
  {
    YValue = random(10000);
    XValue = 1;
  }
  else // Next random point
  {
    YValue = Series->YValues->Last()+random(10)-4.5;
    XValue = Series->XValues->Last()+1;
  }
  // Add new point
  Series->AddXY(XValue,YValue ,"",clTeeColor);
}

  // When the chart is filled with points, this procedure
  // deletes and scrolls points to the left.
void __fastcall TFastDeleteRealtime::DoScrollPoints(void)
{
  double tmpMin,tmpMax;
  // Delete multiple points with a single call.
  // Much faster than deleting points using a loop.
  Series1->Delete(0,ScrollPoints);
  Series2->Delete(0,ScrollPoints);
  // Scroll horizontal bottom axis
  double tmp = Series1->XValues->Last();
  Chart1->BottomAxis->SetMinMax(tmp-MaxPoints+ScrollPoints,tmp+ScrollPoints);

  // Scroll vertical left axis
  tmpMin = Series1->YValues->MinValue;
  if (Series2->YValues->MinValue<tmpMin) tmpMin = Series2->YValues->MinValue;

  tmpMax = Series1->YValues->MaxValue;
  if (Series2->YValues->MaxValue>tmpMax) tmpMax = Series2->YValues->MaxValue;

  Chart1->LeftAxis->SetMinMax(tmpMin-tmpMin/5,tmpMax+tmpMax/5);

  // Do chart repaint after deleting and scrolling
  Application->ProcessMessages();
}

// This button starts / stops a fast loop to add points
// to Series1 and Series2.
void __fastcall TFastDeleteRealtime::BitBtn1Click(TObject *Sender)
{
  if (Stopped)
  {
    // Start loop...
    BitBtn1->Caption = "&Stop";
    Edit1->Enabled = false;
    Edit2->Enabled = false;

    // Prepare variables
    MaxPoints = StrToInt(Edit1->Text);
    ScrollPoints = StrToInt(Edit2->Text);
    Chart1->BottomAxis->SetMinMax(1,MaxPoints);

    // Clear
    Series1->Clear();
    Series2->Clear();
    Application->ProcessMessages();

    Stopped = false;

    // Start loop
    while (!Stopped)
    {
      // Add one more point
      RealTimeAdd(Series1);
      RealTimeAdd(Series2);
      // Delete and Scroll points
      if (Series1->Count()>MaxPoints-1) DoScrollPoints();
    }
  }
  else
  {
    // Finish
    Stopped = true;
    BitBtn1->Caption = "&Start";
    Edit1->Enabled = true;
    Edit2->Enabled = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TFastDeleteRealtime::FormCloseQuery(TObject *Sender,
      bool &CanClose)
{
  TBaseForm::~TBaseForm();  // inherited
  Stopped = true;  // Break loop to allow close form
}
//---------------------------------------------------------------------------

void __fastcall TFastDeleteRealtime::CheckBox1Click(TObject *Sender)
{
  Series1->DrawAllPoints = CheckBox1->Checked;
  Series2->DrawAllPoints = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFastDeleteRealtime::CheckBox2Click(TObject *Sender)
{
  // When FastLine series have AutoRepaint = False ,
  // setting FastPen to True increases speed.
  Series1->FastPen = CheckBox2->Checked;
  Series2->FastPen = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

