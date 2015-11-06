//---------------------------------------------------------------------------

#ifndef Draw3D_CanvasH
#define Draw3D_CanvasH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeDraw3D.hpp"
#include "TeeOpenGL.hpp"
#include <ExtCtrls.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TDraw3DCanvas : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TMemo *Memo1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBoxDrawAxes;
        TCheckBox *CheckBoxDrawRoom;
        TCheckBox *CheckBoxGradient;
        TTeeCommander *TeeCommander1;
        TDraw3D *Draw3D1;
        TTeeOpenGL *TeeOpenGL1;
        TCheckBox *CheckBox2;
        void __fastcall Draw3D1Paint(TObject *Sender, const TRect &ARect);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBoxDrawAxesClick(TObject *Sender);
        void __fastcall CheckBoxDrawRoomClick(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBoxGradientClick(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDraw3DCanvas(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDraw3DCanvas *Draw3DCanvas;
//---------------------------------------------------------------------------
#endif
