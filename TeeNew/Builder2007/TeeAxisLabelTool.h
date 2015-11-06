/*
  TAxisLabelTool. Example of a Custom Chart Tool.
  This custom tool is used to change Axis labels.

  If axis labels are bigger than 1000, the tool
  appends "K" (thousands) to the label.
  If the label is bigger than 100000, then it shows
  "M" (millions).

  Example: 2000 is displayed as "2K"
           4000000 is displayed as "4M".

  This tool is useful to reduce the space used by
  big axis label values.
*/
//---------------------------------------------------------------------------

#ifndef TeeAxisLabelToolH
#define TeeAxisLabelToolH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <TeeProcs.hpp>
#include <TeEngine.hpp>
#include <Chart.hpp>
//---------------------------------------------------------------------------
class TAxisLabelTool : public Teengine::TTeeCustomToolAxis
{
private:
        AnsiString FMillion;
        AnsiString FThousand;
        void __fastcall SetMillion(const AnsiString Value);
        void __fastcall SetThousand(const AnsiString Value);
protected:
        virtual void __fastcall SetParentChart(const TCustomAxisPanel* Value);
        void __fastcall OnGetLabel(TChartAxis *Sender,
                        TChartSeries *Series, int ValueIndex, AnsiString &LabelText);
__published:
        __property AnsiString MillionText = {read= FMillion, write = SetMillion};
        __property AnsiString ThousandText = {read= FThousand, write = SetThousand};
public :
	/* virtual class method */ virtual AnsiString __fastcall Description(TMetaClass* vmt);
        __fastcall virtual TAxisLabelTool(Classes::TComponent* AOwner);
};
//---------------------------------------------------------------------------
#endif
