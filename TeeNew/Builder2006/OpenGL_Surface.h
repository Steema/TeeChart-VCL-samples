//---------------------------------------------------------------------------

#ifndef OpenGL_SurfaceH
#define OpenGL_SurfaceH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeOpenGL.hpp"
#include "TeeSurfa.hpp"
#include <Chart.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TOpenGLSurface : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TTeeCommander *TeeCommander1;
        TSurfaceSeries *Series1;
        TTeeOpenGL *TeeOpenGL1;
        TPanel *Panel1;
        TScrollBar *ScrollBar2;
        TScrollBar *ScrollBar3;
        TScrollBar *ScrollBar4;
        TScrollBar *ScrollBar5;
        TTimer *Timer1;
        TCheckBox *CheckBox2;
        TLabel *Label1;
        TLabel*Label2;
        TLabel *Label3;
        TLabel *Label4;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        TRadioGroup *RadioGroup1;
        TCheckBox *CheckBox5;
        TCheckBox *CheckBox6;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TCheckBox *CheckBox7;
        TLabel *Label9;
        TCheckBox *CheckBox1;
        TTrackBar *TrackBar1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ScrollBar2Change(TObject *Sender);
        void __fastcall ScrollBar3Change(TObject *Sender);
        void __fastcall ScrollBar4Change(TObject *Sender);
        void __fastcall ScrollBar5Change(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall TeeOpenGL1Init(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall CheckBox5Click(TObject *Sender);
        void __fastcall CheckBox6Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall TrackBar1Change(TObject *Sender);
private:	// User declarations
        double a,b,c,d;
        bool Changing;
        int Formula;
        int DeltaA, DeltaB, DeltaC, DeltaD;
        double Calc(double x, double y);
        void Fill();
public:		// User declarations
        __fastcall TOpenGLSurface(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOpenGLSurface *OpenGLSurface;
//---------------------------------------------------------------------------
#endif
