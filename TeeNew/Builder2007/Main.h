//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <Chart.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <TeCanvas.hpp>
#include <TeeDraw3D.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <jpeg.hpp>

#ifdef VER180
#include <OleCtrls.hpp>
#include <SHDocVw.hpp>
#else
#include <shdocvw_ocx.h>
#endif

//---------------------------------------------------------------------------
class TTee9Form : public TForm
{
__published:	// IDE-managed Components
    TStatusBar *StatusBar1;
    TSplitter *Splitter1;
    TPanel *Panel2;
    TPanel *Panel3;
    TButton *Button1;
    TImageList *Images;
    TPopupMenu *PopupMenu1;
    TMenuItem *ShowAll1;
    TButton *Button2;
    TDraw3D *Draw3D1;
    TSpeedButton *BPrevious;
    TSpeedButton *BNext;
    TLabel *Label1;
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TTreeView *TreeView1;
    TTabSheet *TabSheet2;
    TTreeView *TreeView2;
    TTimer *Timer1;
    TMenuItem *Presentation1;
    TMemo *Memo2;
    TMemo *Memo1;
    TPageControl *PageExample;
    TTabSheet *TabExample;
    TTabSheet *TabSource;
    TTabSheet *TabSupport;
    TButton *ButtonConfig;
    TMenuItem *Checksource1;
    TTabSheet *TabSearch;
	TPanel*Panel1;
    TLabel *Label2;
    TComboFlat *CBSearch;
    TLabel *Label3;
    TCheckBox *CBSearchSource;
    TCheckBox *CBFindAll;
    TTreeView *TreeSearch;
    TSpeedButton *SearchButton;
    TLabel *Label5;
    TLabel *LabelTopic;
    TLabel *Label6;
    TMemo *MemoSupport;
    TBitBtn *BSupport;
    TChart *Chart1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Label1Click(TObject *Sender);
        void __fastcall BNextClick(TObject *Sender);
        void __fastcall TreeView1GetImageIndex(TObject *Sender,
          TTreeNode *Node);
        void __fastcall TreeView1GetSelectedIndex(TObject *Sender,
          TTreeNode *Node);
        void __fastcall PageControl1Change(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
        void __fastcall TreeView1Change(TObject *Sender, TTreeNode *Node);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall BPreviousClick(TObject *Sender);
        void __fastcall ShowAll1Click(TObject *Sender);
        void __fastcall Presentation1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall ButtonConfigClick(TObject *Sender);
		void __fastcall PageExampleChange(TObject *Sender);
  void __fastcall BSupportClick(TObject *Sender);
  void __fastcall MemoSupportChange(TObject *Sender);
  void __fastcall CBSearchChange(TObject *Sender);
  void __fastcall CBSearchKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
  void __fastcall SearchButtonClick(TObject *Sender);
  void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
     TForm *tmpForm;
	 TRichEdit *RichEditCode;
	 AnsiString OldCodeFile;

	 #ifndef VER180
	 TCppWebBrowser *WebBrowser1;
	 #endif

     void __fastcall ShowForm(TTreeView *ATree);
     void __fastcall ShowFormClass(TFormClass AClass);
     void __fastcall SendEmail(AnsiString Text, AnsiString Subject);
     TTreeView* __fastcall TheTree(void);
     int __fastcall ImageIndex(TTreeNode *Node);
     AnsiString __fastcall CodeFile(void);
     AnsiString __fastcall ExtractVersionInfo(void);
     AnsiString __fastcall CPUType(void);
     AnsiString __fastcall WindowsVersion(void);
	 void __fastcall DoSearch(void);
public:		// User declarations
        __fastcall TTee9Form(TComponent* Owner);
};

struct TTeeFormInfo
        {
        TFormClass FormClass;
        AnsiString UnitName;
        };
//---------------------------------------------------------------------------
extern PACKAGE TTee9Form *Tee9Form;
//---------------------------------------------------------------------------
#endif
