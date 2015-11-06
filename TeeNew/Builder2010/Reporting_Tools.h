//---------------------------------------------------------------------------

#ifndef Reporting_ToolsH
#define Reporting_ToolsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TChartReports : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TChartReports(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartReports *ChartReports;
//---------------------------------------------------------------------------
#endif
