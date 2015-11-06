//---------------------------------------------------------------------------

#ifndef OpenGL_CanvasH
#define OpenGL_CanvasH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeOpenGL.hpp"
#include "TeeSurfa.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TOpenGLCanvas : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TTeeCommander *TeeCommander1;
        TTeeOpenGL *TeeOpenGL1;
        TPanel *Panel1;
        TLabel *Label1;
        TScrollBar *ScrollBar1;
        TScrollBar *ScrollBar2;
        TScrollBar *ScrollBar3;
        TScrollBar *ScrollBar4;
        TScrollBar *ScrollBar5;
        TScrollBar *ScrollBar6;
        TLabel *Label2;
        TLabel *Label3;
        TScrollBar *ScrollBar7;
        TScrollBar *ScrollBar8;
        TScrollBar *ScrollBar9;
        TTimer *Timer1;
        TSurfaceSeries *Series1;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TImage *Image2;
        TImage *Image3;
        TImage *Image4;
        TImage *Image5;
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ScrollBar3Change(TObject *Sender);
        void __fastcall ScrollBar7Change(TObject *Sender);
        void __fastcall ScrollBar8Change(TObject *Sender);
        void __fastcall ScrollBar9Change(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        Graphics::TBitmap *MyBitmap0, *MyBitmap1,
                          *MyBitmap2, *MyBitmap3;
        TColor ConeColor;
        int ConeRotation, DeltaZ;
        __fastcall TOpenGLCanvas(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOpenGLCanvas *OpenGLCanvas;
//---------------------------------------------------------------------------
#endif
