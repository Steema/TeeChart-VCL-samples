{**********************************************}
{   TeeChart Office - Configuration            }
{   Copyright (c) 2010-2021 by Steema Software }
{**********************************************}
unit TeeConfig;
{$I TeeDefs.inc}

interface

uses Classes,
     {$IFDEF CLX}
     QForms,
     {$ELSE}
     Forms,
     {$ENDIF}
     TypInfo;

type
  { Program Configuration. Load and Save to Windows Registry }

  { Configuration Item }
  TTeeConfigItem=class(TCollectionItem)
  private
    Instance : TObject;
    PropName : String;
    Ident    : String;
  end;

  TTeeConfiguration=class
  private
    FForm: TForm;
    FIdent: String;
    FProps: TCollection;
  public
    Constructor Create;
    Destructor Destroy; override;

    Procedure Add(const AIdent,APropName:String; AInstance: TObject); overload;
    Procedure Add(AForm:TForm); overload;

    Procedure Load;
    Procedure Save;

    property Identifier:String read FIdent write FIdent;
  end;

implementation

{$IFNDEF LINUX}
uses Registry;
{$ENDIF}

{ TTeeConfiguration }

Constructor TTeeConfiguration.Create;
begin
  inherited;
  FProps:=TCollection.Create(TTeeConfigItem);
end;

Destructor TTeeConfiguration.Destroy;
begin
  FProps.Free;
  inherited;
end;

procedure TTeeConfiguration.Add(const AIdent,APropName: String; AInstance: TObject);
begin
  with FProps.Add as TTeeConfigItem do
  begin
    PropName:=APropName;
    Instance:=AInstance;
    Ident   :=AIdent;
  end;
end;

procedure TTeeConfiguration.Add(AForm: TForm);
begin
  FForm:=AForm;
end;

procedure TTeeConfiguration.Load;
{$IFNDEF LINUX}
var t: Integer;
    IsCustom : Boolean;
{$ENDIF}
begin
  {$IFNDEF LINUX}

  IsCustom:=False;

  With TRegistry.Create do
  try
    if OpenKeyReadOnly(Identifier) then
    begin
      for t:=0 to FProps.Count-1 do
         with TTeeConfigItem(FProps.Items[t]) do
              if ValueExists(Ident) then
                 SetOrdProp(Instance,PropName,ReadInteger(Ident));

      { read Form position and size }
      if Assigned(FForm) and ValueExists('FormState') then
      begin

        if ValueExists('FormLeft') then
        begin
          FForm.Left  :=ReadInteger('FormLeft');
          IsCustom:=True;
        end;

        if FForm.Left>Screen.Width then FForm.Left:=0;

        if ValueExists('FormTop') then
           FForm.Top   :=ReadInteger('FormTop');

        if FForm.Top>Screen.Height then FForm.Top:=0;

        if ValueExists('FormWidth') then
           FForm.Width :=ReadInteger('FormWidth');

        if ValueExists('FormHeight') then
           FForm.Height:=ReadInteger('FormHeight');

        if IsCustom then
           FForm.Position:=poDesigned;

        { read if Form is maximized }
        if ValueExists('FormState') then
           if ReadBool('FormState') then
              FForm.WindowState:=wsMaximized;

      end;
    end;
  finally
    Free;
  end;

  {$ENDIF}
end;

procedure TTeeConfiguration.Save;
var t: Integer;
begin
  {$IFNDEF LINUX}
  With TRegistry.Create do
  try
    if OpenKey(Identifier,True) then
    begin
      for t:=0 to FProps.Count-1 do
         with TTeeConfigItem(FProps.Items[t]) do
              WriteInteger(Ident,GetOrdProp(Instance,PropName));

      { write Form position }
      if Assigned(FForm) then
      begin
        WriteBool('FormState',FForm.WindowState=wsMaximized);

        { if not maximized, then save position }
        if FForm.WindowState<>wsMaximized then
        begin
          WriteInteger('FormLeft',  FForm.Left);
          WriteInteger('FormTop',   FForm.Top);
          WriteInteger('FormWidth', FForm.Width);
          WriteInteger('FormHeight',FForm.Height);
        end;
      end;
    end;
  finally
    Free;
  end;
  {$ENDIF}
end;

end.
