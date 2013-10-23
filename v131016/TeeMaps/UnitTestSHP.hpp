// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'UnitTestSHP.pas' rev: 6.00

#ifndef UnitTestSHPHPP
#define UnitTestSHPHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <TeeVRML3D.hpp>	// Pascal unit
#include <TeeWorldSeries.hpp>	// Pascal unit
#include <TeeChartActions.hpp>	// Pascal unit
#include <Series.hpp>	// Pascal unit
#include <TeeSeriesTextEd.hpp>	// Pascal unit
#include <TeeURL.hpp>	// Pascal unit
#include <TeeOpenGL.hpp>	// Pascal unit
#include <TeeEdiGrad.hpp>	// Pascal unit
#include <TeeLighting.hpp>	// Pascal unit
#include <TeeVMLCanvas.hpp>	// Pascal unit
#include <TeePSCanvas.hpp>	// Pascal unit
#include <TeeFlexCanvas.hpp>	// Pascal unit
#include <TeeXAMLCanvas.hpp>	// Pascal unit
#include <TeePDFCanvas.hpp>	// Pascal unit
#include <TeeSVGCanvas.hpp>	// Pascal unit
#include <TeeGIF.hpp>	// Pascal unit
#include <TeePNG.hpp>	// Pascal unit
#include <TeeJPEG.hpp>	// Pascal unit
#include <TeeThemes.hpp>	// Pascal unit
#include <TeeThemeEditor.hpp>	// Pascal unit
#include <TeeGLEditor.hpp>	// Pascal unit
#include <TeeTools.hpp>	// Pascal unit
#include <TeeLegendScrollBar.hpp>	// Pascal unit
#include <TeeLisB.hpp>	// Pascal unit
#include <TeeObjectInspector.hpp>	// Pascal unit
#include <TeeInspector.hpp>	// Pascal unit
#include <DBTables.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <TeCanvas.hpp>	// Pascal unit
#include <TeeComma.hpp>	// Pascal unit
#include <Chart.hpp>	// Pascal unit
#include <TeeProcs.hpp>	// Pascal unit
#include <TeeMapSeries.hpp>	// Pascal unit
#include <TeeSurfa.hpp>	// Pascal unit
#include <TeEngine.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <ActnList.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Unittestshp
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TForm1;
class PASCALIMPLEMENTATION TForm1 : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Comctrls::TPageControl* PageControl1;
	Comctrls::TTabSheet* TabSheet1;
	Teecomma::TTeeCommander* TeeCommander1;
	Stdctrls::TButton* Button1;
	Stdctrls::TCheckBox* CheckBox1;
	Tecanvas::TComboFlat* ComboFlat1;
	Stdctrls::TCheckBox* CheckBox2;
	Stdctrls::TLabel* Label2;
	Stdctrls::TEdit* Edit1;
	Stdctrls::TEdit* Edit2;
	Stdctrls::TLabel* Label3;
	Extctrls::TPanel* Panel1;
	Teelisb::TChartListBox* ChartListBox1;
	Extctrls::TSplitter* Splitter2;
	Stdctrls::TCheckBox* CheckBox3;
	Stdctrls::TCheckBox* CBOutline;
	Comctrls::TStatusBar* StatusBar1;
	Buttons::TSpeedButton* SBZoom;
	Buttons::TSpeedButton* SpeedButton1;
	Stdctrls::TCheckBox* CBClipOutline;
	Stdctrls::TCheckBox* CheckBox4;
	Buttons::TSpeedButton* SpeedButton2;
	Buttons::TSpeedButton* SpeedButton3;
	Stdctrls::TCheckBox* CheckBox5;
	Stdctrls::TCheckBox* CheckBox6;
	Teeopengl::TTeeOpenGL* TeeOpenGL1;
	Stdctrls::TCheckBox* CBOutlineColor;
	Teeseriestexted::TSeriesTextSource* SeriesTextSource1;
	Stdctrls::TCheckBox* CheckBox7;
	Chart::TChart* Chart1;
	Teeworldseries::TWorldSeries* Series1;
	Series::TPointSeries* Series2;
	Teetools::TCursorTool* ChartTool1;
	Teetools::TMarksTipTool* ChartTool2;
	Teetools::TAxisScrollTool* ChartTool3;
	Teetools::TGridBandTool* ChartTool4;
	Teelegendscrollbar::TLegendScrollBar* ChartTool5;
	Teelighting::TLightTool* ChartTool6;
	Teetools::TRotateTool* ChartTool7;
	Teetools::TMarksTipTool* ChartTool8;
	Extctrls::TSplitter* Splitter1;
	Comctrls::TTabSheet* TabSheet3;
	Stdctrls::TListBox* ListCities;
	Teetools::TAnnotationTool* ChartTool9;
	Stdctrls::TCheckBox* CheckBox8;
	Stdctrls::TButton* Button2;
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall CheckBox1Click(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall Chart1MouseMove(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	void __fastcall Chart1ClickSeries(Chart::TCustomChart* Sender, Teengine::TChartSeries* Series, int ValueIndex, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall ChartListBox1Click(System::TObject* Sender);
	void __fastcall CheckBox3Click(System::TObject* Sender);
	void __fastcall Chart1AfterDraw(System::TObject* Sender);
	void __fastcall Chart1Zoom(System::TObject* Sender);
	void __fastcall ComboFlat1Change(System::TObject* Sender);
	void __fastcall SBZoomClick(System::TObject* Sender);
	void __fastcall SpeedButton1Click(System::TObject* Sender);
	void __fastcall ChartListBox1DblClickSeries(Teelisb::TChartListBox* Sender, int Index);
	void __fastcall CBClipOutlineClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall CheckBox4Click(System::TObject* Sender);
	void __fastcall SpeedButton2Click(System::TObject* Sender);
	void __fastcall SpeedButton3Click(System::TObject* Sender);
	void __fastcall CheckBox5Click(System::TObject* Sender);
	void __fastcall CheckBox6Click(System::TObject* Sender);
	void __fastcall CBOutlineClick(System::TObject* Sender);
	void __fastcall Chart1UndoZoom(System::TObject* Sender);
	void __fastcall Chart1Resize(System::TObject* Sender);
	void __fastcall PageControl1Change(System::TObject* Sender);
	void __fastcall ListCitiesClick(System::TObject* Sender);
	void __fastcall Series2Click(Teengine::TChartSeries* Sender, int ValueIndex, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall CheckBox7Click(System::TObject* Sender);
	void __fastcall Chart1Scroll(System::TObject* Sender);
	void __fastcall CheckBox8Click(System::TObject* Sender);
	void __fastcall Button2Click(System::TObject* Sender);
	
private:
	int Old;
	Dbtables::TTable* Table1;
	Teeobjectinspector::TObjectInspector* TeeInspector1;
	void __fastcall CreateInspector(void);
	int __fastcall CurrentCity(void);
	void __fastcall DrawShapeOutline(int Index, bool XorMode = true);
	void __fastcall FillShapes(void);
	void __fastcall LoadCityList(void);
	void __fastcall OutlineShape(int Index);
	void __fastcall RefreshCityArrow(void);
	void __fastcall ResetCitySize(double Ratio);
	void __fastcall SetInspectorItem(int ValueIndex);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TForm1(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TForm1(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TForm1(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TForm1(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TForm1* Form1;

}	/* namespace Unittestshp */
using namespace Unittestshp;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UnitTestSHP
