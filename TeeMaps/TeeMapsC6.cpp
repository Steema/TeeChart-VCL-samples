//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("TeeMapsC6.res");
USEFORMNS("UnitTestSHP.pas", Unittestshp, Form1);
USEUNIT("TeeSHP.pas");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->Title = "TeeChart Pro GIS Mapping";
                 Application->CreateForm(__classid(TForm1), &Form1);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
