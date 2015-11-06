//---------------------------------------------------------------------------

#ifndef Welcome_AllH
#define Welcome_AllH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeDraw3D.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TWelcomeAllForm : public TForm
{
__published:	// IDE-managed Components
        TDraw3D *Draw3D1;
        TMemo *Memo1;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TLabel *Label12;
        TLabel *Label13;
        TLabel *Label14;
        TImage *Image1;
        TChart *Chart1;
        TLineSeries *Series1;
        TTimer *Timer1;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TWelcomeAllForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWelcomeAllForm *WelcomeAllForm;
//---------------------------------------------------------------------------
#endif
