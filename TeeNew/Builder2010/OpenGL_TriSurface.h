//---------------------------------------------------------------------------

#ifndef OpenGL_TriSurfaceH
#define OpenGL_TriSurfaceH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include "TeeOpenGL.hpp"
#include "TeePoin3.hpp"
#include "TeeSurfa.hpp"
#include "TeeTriSurface.hpp"
#include <Chart.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TOpenGLTriSurface : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TTeeOpenGL *TeeOpenGL1;
        TPanel *Panel1;
        TLabel *Label1;
        TButton *Button1;
        TButton *Button2;
        TCheckBox *CheckBox6;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TScrollBar *ScrollBar1;
        TScrollBar *ScrollBar2;
        TScrollBar *ScrollBar3;
        TCheckBox *CheckBox8;
        TCheckBox *CheckBox9;
        TTriSurfaceSeries *Series1;
        TPoint3DSeries *Series2;
        TSurfaceSeries *Series3;
        TTeeCommander *TeeCommander1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall CheckBox6Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall ScrollBar2Change(TObject *Sender);
        void __fastcall ScrollBar3Change(TObject *Sender);
        void __fastcall CheckBox8Click(TObject *Sender);
        void __fastcall CheckBox9Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Series1GetMarkText(TChartSeries *Sender,
          int ValueIndex, AnsiString &MarkText);
private:	// User declarations
        bool Changing;
        void __fastcall AddRandomPoint();
public:		// User declarations
        __fastcall TOpenGLTriSurface(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOpenGLTriSurface *OpenGLTriSurface;
//---------------------------------------------------------------------------
#endif
