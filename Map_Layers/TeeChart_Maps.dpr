program TeeChart_Maps;

uses
  {$IFDEF FASTMM}
  FastMM4,
  {$ENDIF }
  Forms,
  MapDemo_Utils in 'Common\MapDemo_Utils.pas',
  Unit_Maps in 'Unit_Maps.pas' {FormMaps};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMaps, FormMaps);
  Application.Run;
end.
