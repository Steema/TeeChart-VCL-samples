//---------------------------------------------------------------------------

#ifndef BackWall_ImageH
#define BackWall_ImageH
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
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TBackWallImage : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TImage *Image1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBackWallImage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBackWallImage *BackWallImage;
//---------------------------------------------------------------------------
#endif
