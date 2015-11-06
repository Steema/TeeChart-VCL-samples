// CodeGear C++Builder
// Copyright (c) 1995, 2007 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Teedesignoptions.pas' rev: 11.00

#ifndef TeedesignoptionsHPP
#define TeedesignoptionsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Tecanvas.hpp>	// Pascal unit
#include <Teetranslate.hpp>	// Pascal unit
#include <Teeprocs.hpp>	// Pascal unit
#include <Teegallerypanel.hpp>	// Pascal unit
#include <Teeeditcha.hpp>	// Pascal unit
#include <Teefilters.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Teedesignoptions
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOptionsForm;
class PASCALIMPLEMENTATION TOptionsForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* TabLanguage;
	Comctrls::TTabSheet* TabGallery;
	Comctrls::TTabSheet* TabEditor;
	Comctrls::TTabSheet* TabNewChart;
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* Label2;
	Stdctrls::TButton* Button1;
	Stdctrls::TCheckBox* CBSmooth;
	Stdctrls::TCheckBox* CBSize;
	Stdctrls::TCheckBox* CBPosition;
	Stdctrls::TCheckBox* CBTree;
	Stdctrls::TButton* Button4;
	Extctrls::TPanel* Panel1;
	Extctrls::TPanel* Panel2;
	Stdctrls::TButton* Button2;
	Stdctrls::TButton* Button3;
	Extctrls::TRadioGroup* RGGalleryMode;
	Extctrls::TPanel* Panel3;
	Stdctrls::TLabel* LabelTheme;
	Stdctrls::TListBox* LBTheme;
	Extctrls::TPanel* Panel4;
	Extctrls::TPanel* Panel5;
	Teefilters::TImageFiltered* ImageFiltered1;
	Tecanvas::TComboFlat* CBPalette;
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall Button3Click(System::TObject* Sender);
	void __fastcall Button2Click(System::TObject* Sender);
	void __fastcall Button4Click(System::TObject* Sender);
	void __fastcall LBThemeClick(System::TObject* Sender);
	void __fastcall PageControl1Change(System::TObject* Sender);
	void __fastcall CBPaletteChange(System::TObject* Sender);
	
private:
	int OldLang;
	void __fastcall ChangeLangLabel(void);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TOptionsForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOptionsForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOptionsForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TOptionsForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE int TeeNewChartTheme;
extern PACKAGE int TeeNewChartPalette;

}	/* namespace Teedesignoptions */
using namespace Teedesignoptions;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Teedesignoptions
