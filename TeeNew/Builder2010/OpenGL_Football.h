//---------------------------------------------------------------------------

#ifndef OpenGL_FootballH
#define OpenGL_FootballH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeDraw3D.hpp"
#include "TeeOpenGL.hpp"
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TOpenGLFootBall : public TForm
{
__published:	// IDE-managed Components
        TDraw3D *Draw3D1;
        TTeeCommander *TeeCommander1;
        TTeeOpenGL *TeeOpenGL1;
        TTimer *Timer1;
        TPanel *Panel1;
        TButton *Button1;
        TButton *Button2;
        TCheckBox *CheckBox2;
        TButton *Button3;
        TButton *Button4;
        TLabel *Label1;
        TTrackBar *TrackBar1;
        TLabel *Label2;
        TTrackBar *TrackBar2;
        TTrackBar *TrackBar3;
        TLabel *Label3;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox1;
        void __fastcall Draw3D1Paint(TObject *Sender, const TRect &ARect);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall TrackBar2Change(TObject *Sender);
        void __fastcall TrackBar3Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
        TPoint DeltaBall,Ball; // coordinates of the ball
        TPoint Players[5];
        TPoint DeltaPlayers[5];
        int W,D,DeltaZoom;
        TColor FBall,FLines,FGreen; // colors
        public:		// User declarations
        __fastcall TOpenGLFootBall(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOpenGLFootBall *OpenGLFootBall;
//---------------------------------------------------------------------------
#endif
