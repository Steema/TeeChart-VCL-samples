unit TeeHighLight;
{$I TeeDefs.inc}

interface

Uses 
  {$IFDEF CLX}
  QComCtrls, StdCtrls
  {$ELSE}
  ComCtrls
  {$ENDIF};

{$IFDEF CLX}
type
  TCustomRichEdit=TMemo;
  TRichEdit=TCustomRichEdit;
{$ENDIF}

{ parses the RichEdit text and tags keywords }
Procedure TeeHighLightRichEdit(RichEdit:TCustomRichEdit);

implementation

Uses SysUtils, {$IFDEF CLX}QGraphics{$ELSE}Graphics{$ENDIF};

Procedure TeeHighLightRichEdit(RichEdit:TCustomRichEdit);
var p   : Integer;
    tmp : String;

  Function IsKeyword(Const S:String):Boolean;
  Const Keywords:Array[0..33] of String=
         ('UNIT','INTERFACE','BEGIN','IMPLEMENTATION','PROCEDURE','INHERITED',
          'INITIALIZATION','END','CLASS','TYPE','VAR','PRIVATE','PUBLIC',
          'IF','ELSE','WHILE','FOR','REPEAT','RECORD','OBJECT','FUNCTION',
          'STRING','CONST','AND','NOT','IN','DO','THEN','WITH','USES',
          'TRY','FINALLY','EXCEPT','PACKED');

  var t:Integer;
  begin
    result:=False;
    for t:=0 to High(Keywords) do
    if Keywords[t]=S then
    begin
      result:=True;
      break;
    end;
  end;

  Function NextWordIsKeyword:Boolean;
  Const Valid = ['A'..'Z','a'..'z','_'];
  var p2  : Integer;
      Key : String;
  begin
    While p<=Length(tmp) do
    begin

      if {$IFDEF D12}CharInSet(tmp[p],Valid){$ELSE}tmp[p] in Valid{$ENDIF} then
         break
      else
      if tmp[p]='{' then
      begin
        RichEdit.SelStart:=p-1;

        Inc(p);

        While tmp[p]<>'}' do Inc(p);

        {$IFNDEF CLX}
        With RichEdit do
        begin
          SelLength:=p-SelStart;

          With SelAttributes do
          begin
            Style:=[fsItalic];
            Color:=clNavy;
          end;

          SelStart:=0;
          SelLength:=0;
        end;
        {$ENDIF}

      end
      else Inc(p);
    end;

    p2:=p;
    While (p<=Length(tmp)) and
          {$IFDEF D12}CharInSet(tmp[p],Valid){$ELSE}(tmp[p] in Valid){$ENDIF} do
             Inc(p);

    if p=Length(tmp) then Inc(p);

    if p>p2 then
    begin
      key:=Copy(tmp,p2,p-p2);
      result:=IsKeyword(UpperCase(Key));

      RichEdit.SelStart:=p2-1;
      RichEdit.SelLength:=p-p2;
      Inc(p);
    end
    else result:=False;
  end;

begin
  p:=1;
  tmp:=RichEdit.Lines.Text;

  {$IFNDEF CLX}
  RichEdit.SelStart:=0;
  RichEdit.SelLength:=Length(tmp);
  RichEdit.SelAttributes.Style:=[];

  While p<Length(tmp) do
     if NextWordIsKeyword then
        RichEdit.SelAttributes.Style:=[fsBold];

  {$ENDIF}

  RichEdit.SelStart:=0;
  RichEdit.SelLength:=0;
end;

end.
