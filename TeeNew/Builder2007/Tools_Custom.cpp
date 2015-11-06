//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tools_Custom.h"
#include "TeeAxisLabelTool.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisLabelToolDemo *AxisLabelToolDemo;
//---------------------------------------------------------------------------
__fastcall TAxisLabelToolDemo::TAxisLabelToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelToolDemo::FormCreate(TObject *Sender)
{
  // sample values for the series
  double vals[8] = { 8, 800, 150, 1500, 2000, 1000,
                    120000, 30000 };
  Series1->AddArray(vals,7);

  // create the custom tool
  TAxisLabelTool *AxisLabelTool = new TAxisLabelTool(this);
  // set the chart
  AxisLabelTool->ParentChart = Chart1;
  // set the tool axis
  AxisLabelTool->Axis = Chart1->LeftAxis;
  AxisLabelTool->Active = true;
}
//---------------------------------------------------------------------------

void __fastcall TAxisLabelToolDemo::CheckBox1Click(TObject *Sender)
{
  Chart1->Tools->Items[0]->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------


