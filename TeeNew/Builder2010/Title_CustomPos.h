//---------------------------------------------------------------------------

#ifndef Title_CustomPosH
#define Title_CustomPosH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base_CustomPos.h"
#include <Chart.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TTitleCustomPos : public TBaseCustomPos
{
__published:	// IDE-managed Components
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TrackBar1Change(TObject *Sender);
        void __fastcall TrackBar2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTitleCustomPos(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTitleCustomPos *TitleCustomPos;
//---------------------------------------------------------------------------
#endif
