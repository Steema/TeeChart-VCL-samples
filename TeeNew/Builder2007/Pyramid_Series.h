//---------------------------------------------------------------------------

#ifndef Pyramid_SeriesH
#define Pyramid_SeriesH
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
#include "TeePyramid.hpp"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TPyramidForm : public TBaseForm
{
__published:	// IDE-managed Components
        TPyramidSeries *Series1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TButton *Button1;
        TCheckBox *CheckBox3;
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPyramidForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPyramidForm *PyramidForm;
//---------------------------------------------------------------------------
#endif
