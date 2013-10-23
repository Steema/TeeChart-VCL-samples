//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("TeeChartOfficeC4.res");
USEFORMNS("UnitChartOffice.pas", Unitchartoffice, MainForm);
USEFORMNS("TeeCommanderEditor.pas", Teecommandereditor, CommanderEditor);
USEFORMNS("TeeNewDataSet.pas", Teenewdataset, NewDataSet);
USEFORMNS("TeeUpdateVersion.pas", Teeupdateversion, UpdateVersion);
USEFORMNS("TeeWebGallery.pas", Teewebgallery, WebGallery);
USEFORMNS("TeeAxisDivider.pas", TeeAxisDivider, AxisDividerEditor);
USEFORMNS("TeeExcelSource.pas", TeeExcelSource, ExcelSourceForm);
USEFORMNS("TeeExpression.pas", TeeExpression, ExpressionSourceEdit);
USEUNIT("TeeChartOfficeConstants.pas");
USEUNIT("TeeOfficeConstants.pas");
USEUNIT("TeeConfig.pas");
USEUNIT("TeeHighLight.pas");
USEUNIT("TeeRecentFiles.pas");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->Title = "TeeChartOffice";
                 Application->CreateForm(__classid(TMainForm), &MainForm);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
