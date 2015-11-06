//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Template_Chart.h"
#include "TeeStore.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartActions"
#pragma resource "*.dfm"
TTemplateChart *TemplateChart;
//---------------------------------------------------------------------------
__fastcall TTemplateChart::TTemplateChart(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTemplateChart::Button2Click(TObject *Sender)
{
  // 1) Save the template into a Stream...
  TMemoryStream *tmp = new TMemoryStream();
  try
  {
    // save only Chart and Series formatting, not data
    SaveChartToStream(TemplateChart,tmp,false);

    // 2) Load the template...

    // Reset stream position to begin:
    tmp->Position=0;

    // Load chart reference from stream:
    LoadChartFromStream(dynamic_cast<TCustomChart*>(Chart1),tmp);

    // restore the chart alignment (in this example)
    Chart1->Align = alClient;
    // repaint the Chart
    Chart1->Repaint();
  }
  __finally
  {
    // remove the stream, it's no longer necessary...
    delete tmp;
  }
}
//---------------------------------------------------------------------------

void __fastcall TTemplateChart::FormCreate(TObject *Sender)
{
  // global variable, to add random points at runtime
  TeeRandomAtRunTime = true;
}
//---------------------------------------------------------------------------

