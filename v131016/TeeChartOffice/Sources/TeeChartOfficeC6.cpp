//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORMNS("UnitChartOffice.pas", Unitchartoffice, MainForm);
USEFORMNS("TeeCommanderEditor.pas", Teecommandereditor, CommanderEditor);
USEFORMNS("TeeNewDataSet.pas", Teenewdataset, NewDataSet);
USEFORMNS("TeeUpdateVersion.pas", Teeupdateversion, UpdateVersion);
USEFORMNS("TeeWebGallery.pas", Teewebgallery, WebGallery);
USERES("TeeChartOfficeC6.res");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->Title = "TeeChart Office";
                 Application->CreateForm(__classid(TMainForm), &MainForm);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        catch (...)
        {
                 try
                 {
                         throw Exception("");
                 }
                 catch (Exception &exception)
                 {
                         Application->ShowException(&exception);
                 }
        }
        return 0;
}
//---------------------------------------------------------------------------
