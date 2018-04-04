program TeeChart_Office_Mobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainMobile in 'MainMobile.pas' {Form174},
  Main in '..\Desktop\Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm174, Form174);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
