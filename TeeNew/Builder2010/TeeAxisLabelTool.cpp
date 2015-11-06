//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeeAxisLabelTool.h"

//---------------------------------------------------------------------------
__fastcall TAxisLabelTool::TAxisLabelTool(TComponent* Owner)
        : TTeeCustomToolAxis(Owner)
{
  FMillion = "M";
  FThousand = "k";
}
//---------------------------------------------------------------------------
AnsiString __fastcall TAxisLabelTool::Description(TMetaClass* vmt)
{
  return "Axis Label";
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelTool::SetMillion(const AnsiString Value)
{
  if (FMillion!=Value)
  {
    FMillion = Value;
    if (ParentChart != NULL) ParentChart->Invalidate();
  }
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelTool::SetThousand(const AnsiString Value)
{
  if (FThousand!=Value)
  {
    FThousand = Value;
    if (ParentChart != NULL) ParentChart->Invalidate();
  }
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelTool::OnGetLabel(TChartAxis *Sender, TChartSeries *Series,
                                        int ValueIndex, AnsiString &LabelText)
{
  if (Active && Axis != NULL && Sender == Axis)
  {
    try
    {
        AnsiString tmpStr = LabelText;
        // remove thousand separators
        while (tmpStr.Pos(ThousandSeparator) > 0) tmpStr.Delete(tmpStr.Pos(ThousandSeparator),1);
        double tmp = StrToFloat(tmpStr);
        if (tmp >= 100000) LabelText = FormatFloat("0.#",tmp/1000000.0)+MillionText;
        else if (tmp >= 1000) LabelText = FormatFloat("0.#",tmp/1000.0)+ThousandText;
    }
    catch (EConvertError*)
    {}
  }
}
//---------------------------------------------------------------------------
void __fastcall TAxisLabelTool::SetParentChart(const TCustomAxisPanel* Value)
{
  Teengine::TTeeCustomToolAxis::SetParentChart(Value);
  //if (ParentChart != NULL) ParentChart->OnGetAxisLabel = OnGetLabel;
}

static void __fastcall Init_AxisLabelTool()
{
#pragma startup Init_AxisLabelTool 0
  TComponentClass Tools[1] = {__classid(TAxisLabelTool)};
  RegisterTeeTools(EXISTINGARRAY(Tools));
}

#pragma package(smart_init)
