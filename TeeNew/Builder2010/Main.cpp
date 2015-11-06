//---------------------------------------------------------------------------

#include <vcl.h>
#include <wstring.h>
#pragma hdrstop

#include "Main.h"
#include <TeeAbout.hpp>
#include <TeCanvas.hpp>
#include <TeeConst.hpp>
#include <Registry.hpp>
#include <FileCtrl.hpp>
#include <MMSystem.hpp>
#include <Mapi.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeDraw3D"
#pragma link "TeeGDIPlusEditor"
#pragma link "TeeGLEditor"
#pragma resource "*.dfm"

TTee9Form *Tee9Form;
//---------------------------------------------------------------------------
__fastcall TTee9Form::TTee9Form(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::Button1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::Button2Click(TObject *Sender)
{
  TeeShowAboutBox("","");
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::Label1Click(TObject *Sender)
{
  TeeGotoURL(int(Handle), Label1->Caption);
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::BNextClick(TObject *Sender)
{
  TheTree()->Items->Item[TheTree()->Selected->AbsoluteIndex+1]->Selected = true;
}
//---------------------------------------------------------------------------
TTreeView* __fastcall TTee9Form::TheTree(void)
{
  if (PageControl1->ActivePage==TabSheet1)
     return TreeView1;
  else if (PageControl1->ActivePage==TabSheet2)
     return TreeView2;
  else return TreeSearch;
}

AnsiString __fastcall TTee9Form::CodeFile()
{
  if (TheTree()->Selected != NULL && TheTree()->Selected->Data != NULL)
	return static_cast<TTeeFormInfo*>(TheTree()->Selected->Data)->UnitName;
  else
    return "";
}

int __fastcall TTee9Form::ImageIndex(TTreeNode *Node)
{
  if (Node->HasChildren) {
     if (Node->Expanded) return 1; else return 0;
  }
  else if (Node->TreeView == TreeView1) return 2;
  else return 3;
}

void __fastcall TTee9Form::TreeView1GetImageIndex(TObject *Sender,
      TTreeNode *Node)
{
  Node->ImageIndex=ImageIndex(Node);
}
//---------------------------------------------------------------------------

void __fastcall TTee9Form::TreeView1GetSelectedIndex(TObject *Sender,
      TTreeNode *Node)
{
  Node->SelectedIndex=ImageIndex(Node);
}
//---------------------------------------------------------------------------


void __fastcall TTee9Form::PageControl1Change(TObject *Sender)
{
  TreeView1Change(TheTree(),TheTree()->Selected);
}
//---------------------------------------------------------------------------

void PlaySoundResource(char *Sound)
{
//  int tmp=LoadResource(HInstance,FindResource(HInstance,Sound,RT_RCDATA));
//  PlaySound(LockResource(tmp),HInstance,SND_MEMORY or SND_ASYNC or SND_NODEFAULT);
}

void ClearTreeNodes(TTreeView *Tree)
{
  for (int t=0; t<Tree->Items->Count; t++)
  {
    if (Tree->Items->Item[t]->Data != NULL)
       delete static_cast<TTeeFormInfo*>(Tree->Items->Item[t]->Data);
  }
}

void __fastcall TTee9Form::FormDestroy(TObject *Sender)
{
  ClearTreeNodes(TreeView1);
  ClearTreeNodes(TreeView2);
  // PlaySoundResource("THANKYOU");
}
//---------------------------------------------------------------------------

void __fastcall TTee9Form::TreeView1Change(TObject *Sender, TTreeNode *Node)
{
  PageExample->ActivePage = TabExample;
  ShowForm(dynamic_cast<TTreeView*>(Sender));

  TTreeView *tmpView = dynamic_cast<TTreeView*>(Sender);
  BPrevious->Enabled = (tmpView->Selected != NULL) && (tmpView->Selected->AbsoluteIndex > 0);
  BNext->Enabled = (tmpView->Selected!=NULL) && (tmpView->Selected->AbsoluteIndex < tmpView->Items->Count-1);
  TabSource->TabVisible = CodeFile() != "";
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::ShowForm(TTreeView *ATree)
{

  if (ATree->Selected != NULL)
  {
    if (ATree->Selected->Data != NULL)
    {
      delete tmpForm;
      tmpForm=NULL;
	  ShowFormClass(static_cast<TTeeFormInfo*>(TheTree()->Selected->Data)->FormClass);
    }
    StatusBar1->SimpleText=ATree->Selected->Text;
  }
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::ShowFormClass(TFormClass AClass)
{
  TForm *tmpForm;
  Application->CreateForm(AClass,&tmpForm);
  tmpForm->BorderStyle=bsNone;
  tmpForm->Parent=TabExample;
  tmpForm->Align=alClient;
  tmpForm->Show();
}


  void LoadTree(TTreeView *ATree, TMemo *AMemo)
  {
    int i;
    AnsiString tmpClass;
    AnsiString tmpUnit;
    TTeeFormInfo *FormInfo;

    TStringStream *tmp=new TStringStream(AMemo->Lines->Text);
    try
    {
      ATree->LoadFromStream(tmp);
    }
    __finally
    {
      delete tmp;
    }

      for (int t=0;t<ATree->Items->Count;t++)
      {
        AnsiString tmp = ATree->Items->Item[t]->Text;
        i=tmp.Pos(",");
        if (i>0)
        {
          ATree->Items->Item[t]->Text = tmp.SubString(1,i-1);
          tmpClass=tmp.SubString(i+1, tmp.Length());
          tmpUnit = "";
          i = tmpClass.Pos(",");
          if (i>0)
          {
            tmpUnit = tmpClass.SubString(i+1,tmp.Length());
            tmpClass = tmpClass.SubString(1,i-1);
          }


          FormInfo = new TTeeFormInfo;
          FormInfo->FormClass = FindClass(tmpClass);
          FormInfo->UnitName = tmpUnit;
          ATree->Items->Item[t]->Data= FormInfo;
        }


      }
      ATree->Items->Item[0]->Expand(false);
   }

void __fastcall TTee9Form::FormCreate(TObject *Sender)
{
  #ifdef TEELITE
  Application->Title = "TeeChart Standard v9 - What's New !";
  ShowMessage("Attention:\n\nPlease be aware that a number of the forms in this demo'#13'were compiled with the TeeChart Professional version.");
  Caption = Application->Title;
  #endif

  Label1->Transparent = true;

  PageControl1->ActivePage = TabSheet1;
  LoadTree(TreeView1,Memo1);
  LoadTree(TreeView2,Memo2);
  TreeView1->Items->Item[0]->Item[0]->Expand(false);

  TreeView1->HotTrack = true;
  TreeView2->HotTrack = true;

  PageExample->HotTrack = true;

  if ((Screen->Width<1024) || (Screen->Height<768)) {
	 WindowState=wsMaximized;
  }
  else
  {
	Width=1000;
	Height=600;
  }
}
//---------------------------------------------------------------------------



void __fastcall TTee9Form::BPreviousClick(TObject *Sender)
{
  TheTree()->Items->Item[TheTree()->Selected->AbsoluteIndex-1]->Selected = true;
}
//---------------------------------------------------------------------------

void __fastcall TTee9Form::ShowAll1Click(TObject *Sender)
{
  TTreeView *tmp = TheTree();
  for (int t =0; t<tmp->Items->Count; t++)
  {
    tmp->Selected = tmp->Items->Item[t];
    Application->ProcessMessages();
  }
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::Presentation1Click(TObject *Sender)
{
  Presentation1->Checked = ! Presentation1->Checked;
  Timer1->Enabled = Presentation1->Checked;
  if (Timer1->Enabled) TheTree()->Selected = TheTree()->Items->Item[0];

}
//---------------------------------------------------------------------------

void __fastcall TTee9Form::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled =false;
  TTreeView *tmp = TheTree();
  tmp->Selected = tmp->Items->Item[tmp->Selected->AbsoluteIndex+1];
  Timer1->Enabled = true;
}
//---------------------------------------------------------------------------
  bool __fastcall FindItem(TTreeView *ATree, AnsiString tmp)
  {
	 for (int t=0; t< ATree->Items->Count - 1;t++)
       if (ATree->Items->Item[t]->Data != NULL &&
           UpperCase(static_cast<TTeeFormInfo*>(ATree->Items->Item[t]->Data)->FormClass->ClassName()) == tmp)
     {
        ATree->Selected = ATree->Items->Item[t];
        return true;
     }
     return false;
  }

void __fastcall TTee9Form::FormShow(TObject *Sender)
{
  PageExample->ActivePage = TabExample;
  if (ParamCount() > 0) // find a Form...
  {
    AnsiString tmp = UpperCase(ParamStr(1));
    if (! FindItem(TreeView1,tmp))
      if (FindItem(TreeView2,tmp)) PageControl1->ActivePage = TabSheet2;
  }
  else TreeView1->Selected = TreeView1->Items->Item[0];
}
//---------------------------------------------------------------------------
const AnsiString SteemaDotCom = "http://www.steema.com/support";
const AnsiString TeeRegistryKey = "\\Software\\Steema Software\\TeeChart Pro v9 VCL";
//---------------------------------------------------------------------------
AnsiString CodePath()
{
  AnsiString Res = "";
  TRegistry *reg = new TRegistry();
  try
  {
    if (reg->OpenKeyReadOnly(TeeRegistryKey))
      Res = reg->ReadString("DemoPath");
  }
  __finally
  {
    delete reg;
  }
  if (Res =="")
     if (FileExists("Tee8New.bpr")) Res = GetCurrentDir();

  return Res;
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::ButtonConfigClick(TObject *Sender)
{
  UnicodeString tmpDir;
  if (SelectDirectory("Folder with TeeChart Pro 9 Demo Sources",
                     "",tmpDir))
  {
    TRegistry *reg = new TRegistry();
    try
    {
      if (reg->OpenKey(TeeRegistryKey,true)) reg->WriteString("DemoPath",tmpDir);
    }
    __finally
    {
      delete reg;
    }
    PageExampleChange(this);
  }
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::SendEmail(AnsiString Text, AnsiString Subject)
{
  Screen->Cursor = crHourGlass;
  try
  {
    Subject ="[Tee9New: "+Subject+"]";
    TMapiRecipDesc *Recipients;
    Recipients->ulReserved = 0;
    Recipients->ulRecipClass = MAPI_TO;
    Recipients->lpszName = "TeeChart Support";
    Recipients->lpszAddress ="support@steema.com";
    Recipients->ulEIDSize = 0;
    Recipients->lpEntryID = 0;
    TMapiMessage MapiMessage;
    MapiMessage.ulReserved = 0;
    MapiMessage.lpszSubject = Subject.c_str();
    MapiMessage.lpszNoteText = Text.c_str();
    MapiMessage.lpszMessageType = NULL;
    MapiMessage.lpszDateReceived = NULL;
    MapiMessage.lpszConversationID = NULL;
    MapiMessage.flFlags = 0;
    MapiMessage.lpOriginator = NULL;
    MapiMessage.nRecipCount = 1;
    MapiMessage.lpRecips = Recipients;
    MapiMessage.nFileCount = 0;
    MapiMessage.lpFiles = NULL;
/*
    try
    {
      ULONG MError = MapiSendMail(0,Application->Handle,MapiMessage, MAPI_NEW_SESSION || MAPI_LOGON_UI, 0);
    }
    catch(...)
    {
        Exception::CreateFmt("Error sending email",[MError]);
    }
*/
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
  ShowMessage("Email to Steema Support is now at your Outbox.");
}
//---------------------------------------------------------------------------
void __fastcall AppendStrings(TStrings *Dest, AnsiString AFileName)
{
        TStringList *strl = new TStringList();
        try
        {
          strl->LoadFromFile(AFileName);
          Dest->AddStrings(strl);
        }
        __finally
        {
          delete strl;
        }
}
void __fastcall TTee9Form::PageExampleChange(TObject *Sender)
{
  if (PageExample->ActivePage == TabSource)
  {
    if (! FileExists(CodePath()+AnsiString("\\Tee9New.bpr")))
    {
      TRegistry *reg = new TRegistry();
      try {  reg->DeleteKey(TeeRegistryKey); }
      __finally { delete reg; }
    }

    ButtonConfig->Visible = (CodePath() =="");
    if (CodePath() != "" && CodeFile() != "")
    {
      if (OldCodeFile != CodeFile())
      {
        delete RichEditCode;
        TRichEdit *RichEditCode = new TRichEdit(this);
        RichEditCode->Align = alClient;
        RichEditCode->ReadOnly = true;
        RichEditCode->WordWrap = false;
        RichEditCode->ScrollBars = ssBoth;
        RichEditCode->Font->Name = "Courier New";
        RichEditCode->Font->Size = 9;
        RichEditCode->Parent = TabSource;
        AnsiString FN = CodePath()+"\\"+CodeFile();
        RichEditCode->Lines->BeginUpdate();
        RichEditCode->Lines->Add(CodeFile()+".h");
        AppendStrings(RichEditCode->Lines,FN+AnsiString(".h"));
        RichEditCode->Lines->Add("\n \n");
        RichEditCode->Lines->Add(CodeFile()+".cpp");
        AppendStrings(RichEditCode->Lines,FN+AnsiString(".cpp"));
        // HighLight(RichEditCode); TODO : missing
        RichEditCode->Lines->EndUpdate();
        OldCodeFile = CodeFile();
      }
    }
    else { delete RichEditCode; }
  }
  else if(PageExample->ActivePage == TabSupport)
  {
    LabelTopic->Caption = CodeFile();
    MemoSupport->Lines->Clear();
    MemoSupport->SetFocus();
  }
}
//---------------------------------------------------------------------------
AnsiString __fastcall TTee9Form::ExtractVersionInfo(void)
{
  AnsiString res = "";
  // TODO : missing

  return res;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TTee9Form::CPUType(void)
{
  AnsiString res = "";
  TRegistry *reg = new TRegistry();
  try
  {
    reg->RootKey = HKEY_LOCAL_MACHINE;
    if (reg->OpenKey("\\Hardware\\Description\\System\\CentralProcessor\\0", false))
      res = reg->ReadString("Identifier");
  }
  __finally
  {
    delete reg;
  }
  return res;
}
//---------------------------------------------------------------------------
AnsiString __fastcall TTee9Form::WindowsVersion(void)
{
  AnsiString res = "";
  TOSVersionInfo WinVer;
  WinVer.dwOSVersionInfoSize = sizeof(WinVer);
  if (GetVersionExW(&WinVer)== 0 ) return res;

  TVarRec arguments[3] = {(int)WinVer.dwMajorVersion, (int)WinVer.dwMinorVersion, (int)WinVer.dwPlatformId};
  res = Format("Windows v%d.%d (%d)", arguments,3);
  if (WinVer.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS)
  {
    switch (WinVer.dwMajorVersion)
    {
      case 3: res = Format("Win v%d.%d", arguments,2); break;
      case 4 :  { if (WinVer.dwMinorVersion == 0) res = "Windows 95";
                  else if (WinVer.dwMinorVersion == 10) res = "Windows 98";
                  else if (WinVer.dwMinorVersion == 90) res = "Windows ME";
                } break;
    }
  }
  else if (WinVer.dwPlatformId == VER_PLATFORM_WIN32_NT)
  {
    switch (WinVer.dwMajorVersion)
    {
      case 3,4 : res = Format("Windows NT v%d.%d", arguments,2); break;
      case 5 :  { if (WinVer.dwMinorVersion == 0) res = "Windows 2000";
                  else if (WinVer.dwMinorVersion == 1) res = "Windows XP";
                } break;
      case 6 : res = "Windows Vista";
      case 7 : res = "Windows 7";
    }
  }
  res += " "+(AnsiString)WinVer.szCSDVersion;
  return res;
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::BSupportClick(TObject *Sender)
{
  MemoSupport->Lines->Add("------------------");
  MemoSupport->Lines->Add(ExtractVersionInfo());
  MemoSupport->Lines->Add("Windows: "+WindowsVersion());
  MemoSupport->Lines->Add("CPU: "+CPUType());
  MemoSupport->Lines->Add("Screen: "+IntToStr(Screen->Width)+" x "+IntToStr(Screen->Height));
  MemoSupport->Lines->Add("Bits per Color: "+IntToStr(GetDeviceCaps(Canvas->Handle,BITSPIXEL)*
                                 GetDeviceCaps(Canvas->Handle,PLANES)));

  SendEmail(MemoSupport->Text,LabelTopic->Caption);

}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::MemoSupportChange(TObject *Sender)
{
  BSupport->Enabled = MemoSupport->Text!="";
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::DoSearch(void)
{
  // TODO : copy it from NET demo
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::CBSearchChange(TObject *Sender)
{
  SearchButton->Enabled = CBSearch->Text!="";
}
//---------------------------------------------------------------------------
void __fastcall TTee9Form::CBSearchKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
  if (Key==TeeKey_Return) DoSearch();
}
//---------------------------------------------------------------------------

void __fastcall TTee9Form::SearchButtonClick(TObject *Sender)
{
  DoSearch();
}
//---------------------------------------------------------------------------

void __fastcall TTee9Form::FormClose(TObject *Sender, TCloseAction &Action)
{
  Timer1->Enabled = false;
}
//---------------------------------------------------------------------------

