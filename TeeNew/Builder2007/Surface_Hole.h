//---------------------------------------------------------------------------

#ifndef Surface_HoleH
#define Surface_HoleH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeSurfa.hpp"
#include <Buttons.hpp>
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TSurfaceHolesForm : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TSurfaceSeries *Series1;
        TTimer *Timer1;
        TTeeCommander *TeeCommander1;
        TPanel *Panel1;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
        int Angle, Delta3D;
public:		// User declarations
        __fastcall TSurfaceHolesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceHolesForm *SurfaceHolesForm;
//---------------------------------------------------------------------------
#endif
