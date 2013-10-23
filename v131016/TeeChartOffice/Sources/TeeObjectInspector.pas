{**********************************************}
{   Object Inspector.                          }
{   Copyright (c) 2010 by David Berneda        }
{**********************************************}
unit TeeObjectInspector;
{$I TeeDefs.inc}

interface

uses
  Classes,
  Graphics,
  TeeInspector;

type
  TClassEditor=class
  public
    ItemClass : TClass;
    Editor    : TNotifyEvent;
  end;

  TClassEditors=class(TList)
  private
    function Get(Index: Integer): TClassEditor;
    procedure Put(Index: Integer; const Value: TClassEditor);
  public
    procedure Add(AClass:TClass; AEditor:TNotifyEvent);
    procedure Clear; override;

    property Items[Index:Integer]:TClassEditor read Get write Put; default;
  end;

  TObjectInspector=class;

  TInspectorFilter=procedure(Sender:TObjectInspector; Instance:TObject;
                             const PropertyName:String; var Accept:Boolean) of object;

  TObjectInspector=class(TTeeInspector)
  private
    FOnFilter : TInspectorFilter;

    procedure ChangedInteger(Sender:TObject);
    procedure ChangedFloat(Sender:TObject);
    procedure ChangedSet(Sender:TObject);
    procedure ChangedString(Sender:TObject);
    procedure ExpandInspector(Sender: TObject);

    {
    Function CompareItems(a,b:Integer):Integer;
    Procedure SwapItems(a,b:Integer);
    }

    procedure EditBoolean(Sender:TObject);
    procedure EditStrings(Sender:TObject);
    procedure FillInspector(Inspector:TTeeInspector; O:TPersistent);
    procedure GetEnumItems(Sender:TInspectorItem; Proc:TGetItemProc);
    procedure GetEnumItemIndex(Sender:TInspectorItem; var Index:Integer);
    function GetReadableEnum(const S:String):String;
    procedure SetEnumItemIndex(Sender:TInspectorItem; Index:Integer);
  protected
    function ItemExpandable(ARow:Integer):Boolean; override;
  public
    ClassEditors : TClassEditors;
    ReadableEnums : Boolean;

    Constructor Create(AOwner:TComponent); override;
    Destructor Destroy; override;

    procedure Inspect(O:TPersistent);

  published
    property OnFilter:TInspectorFilter read FOnFilter write FOnFilter;
  end;

implementation

uses
  TypInfo,
  TeeStringsEditor, TeCanvas, TeePenDlg, TeeFilters;

{
function TObjectInspector.CompareItems(a, b: Integer): Integer;
begin
  with Items do
  if Item[a].Caption>Item[b].Caption then
     result:=1
  else
  if Item[a].Caption=Item[b].Caption then
     result:=0
  else
     result:=-1
end;

procedure TObjectInspector.SwapItems(a, b: Integer);
var tmpA, tmpB: TInspectorItem;
begin
  tmpA:=Items[a];
  tmpB:=Items[b];
  tmpA.Index:=b;
  tmpB.Index:=a;
end;
}

{ TClassEditors }

procedure TClassEditors.Add(AClass: TClass; AEditor: TNotifyEvent);
var tmp : TClassEditor;
begin
  tmp:=TClassEditor.Create;
  tmp.ItemClass:=AClass;
  tmp.Editor:=AEditor;
  inherited Add(tmp);
end;

procedure TClassEditors.Clear;
var t : Integer;
begin
  for t:=0 to Count-1 do
      Items[t].Free;

  inherited;
end;

function TClassEditors.Get(Index: Integer): TClassEditor;
begin
  result:=TClassEditor(inherited Items[Index]);
end;

procedure TClassEditors.Put(Index: Integer; const Value: TClassEditor);
begin
  inherited Items[Index]:=Value;
end;

{ TObjectInspector }

procedure TObjectInspector.ChangedFloat(Sender:TObject);
begin
  with Sender as TInspectorItem do
       SetFloatProp(Data,Caption,Value);
end;

procedure TObjectInspector.ChangedInteger(Sender: TObject);
begin
  with Sender as TInspectorItem do
       SetOrdProp(Data,Caption,Value);
end;

procedure TObjectInspector.ChangedSet(Sender: TObject);
begin
  with Sender as TInspectorItem do
       SetPropValue(Data,Caption,Value);
end;

procedure TObjectInspector.ChangedString(Sender: TObject);
begin
  with Sender as TInspectorItem do
       SetStrProp(Data,Caption,Value);
end;

Constructor TObjectInspector.Create(AOwner: TComponent);
begin
  inherited;
  ReadableEnums:=True;

  ClassEditors:=TClassEditors.Create;
  ClassEditors.Add(TStrings,EditStrings);

  OnExpandCollapse:=ExpandInspector;
  DefaultRowHeight:=17;
  Header.Font.Style:=[fsBold];
  Color:=clWhite;
end;

Destructor TObjectInspector.Destroy;
begin
  ClassEditors.Free;
  inherited;
end;

procedure TObjectInspector.EditBoolean(Sender: TObject);
begin
  with Sender as TInspectorItem do
       SetOrdProp(Data,Caption,Value);
end;

procedure TObjectInspector.EditStrings(Sender: TObject);
begin
  TeeEditStrings(Self, TStrings((Sender as TInspectorItem).Data));
end;

procedure TObjectInspector.GetEnumItemIndex(Sender: TInspectorItem;
  var Index: Integer);
var P : PPropInfo;
begin
  P:=GetPropInfo(Sender.Data, Sender.Caption);
  Index:=GetEnumValue(P^.PropType^,Sender.Value);
end;

function TObjectInspector.GetReadableEnum(const S:String):String;
var i : Integer;
begin
  result:=S;

  if ReadableEnums then
  begin
    while Length(result)>0 do
    begin
      if result[1]=UpCase(result[1]) then
         break
      else
         Delete(result,1,1)
    end;

    i:=2;
    while i<Length(result) do
    begin
      if result[i]=UpCase(result[i]) then
      begin
        Insert(' ',result,i);
        Inc(i,2);
      end
      else
         Inc(i);
    end;

    if result='' then
       result:=S;
  end;
end;

procedure TObjectInspector.GetEnumItems(Sender:TInspectorItem; Proc:TGetItemProc);
var P : PPropInfo;
    D : PTypeData;
    t : Integer;
begin
  P:=GetPropInfo(Sender.Data, Sender.Caption);

  if Assigned(P) then
  begin
    D:=GetTypeData(GetTypeData(P^.PropType^)^.BaseType^);

    for t:=D^.MinValue to D^.MaxValue do
        Proc(GetReadableEnum(GetEnumName(P^.PropType^, t)));
  end;
end;

procedure TObjectInspector.Inspect(O:TPersistent);
begin
  Clear;
  FillInspector(Self,O);
end;

procedure TObjectInspector.FillInspector(Inspector:TTeeInspector; O:TPersistent);

  procedure GetPictureEditor(var Editor:TNotifyEvent);
  var t : Integer;
  begin
    Editor:=nil;

    for t:=0 to ClassEditors.Count-1 do
    if ClassEditors[t].ItemClass=TTeePicture then
    begin
      Editor:=ClassEditors[t].Editor;
      break;
    end;
  end;

  procedure AddProperty(L:PPropInfo);
  var v : Variant;
      i : TInspectorItem;
      OO : TObject;
      tmp : TNotifyEvent;
      Found : Integer;
      tt : Integer;
  begin
    if L.PropType^.Name='TColor' then
       Inspector.Items.Add(iiColor,L.Name,GetOrdProp(O,L.Name),O,ChangedInteger)
    else
    case L.PropType^.Kind of
      tkInt64,
      tkInteger : Inspector.Items.Add(iiInteger,L.Name,GetOrdProp(O,L.Name),O,ChangedInteger);

      tkWChar,
      tkLString,
      tkWString,
      tkString,
      tkChar    : Inspector.Items.Add(iiString,L.Name,GetStrProp(O,L.Name),O,ChangedString);

      tkFloat   : Inspector.Items.Add(iiDouble,L.Name,O,ChangedFloat);

      tkEnumeration :
        if L.PropType^.Name='Boolean' then
        begin
          v:=Boolean(GetOrdProp(O, L.Name));
          Inspector.Items.Add(iiBoolean,L.Name,v,O,EditBoolean);
        end
        else
        begin
          v:={GetReadableEnum}(GetEnumProp(O, L.Name));

          i:=Inspector.Items.Add(iiSelection,L.Name,v,O);
          i.OnGetItems:=GetEnumItems;
          i.OnGetItemIndex:=GetEnumItemIndex;
          i.OnSetItemIndex:=SetEnumItemIndex;
        end;

      tkClass:
      begin
        if Assigned(L^.GetProc) then
        begin
          OO:=GetObjectProp(O,L);

          if OO is TChartPen then
             Inspector.Items.Add(iiPen,L.Name,OO)
          else
          if OO is TCustomTeeGradient then
             Inspector.Items.Add(iiGradient,L.Name,OO)
          else
          if OO is TChartBrush then
             Inspector.Items.Add(iiBrush,L.Name,OO)
          else
          if OO is TTeeFont then
             Inspector.Items.Add(iiFont,L.Name,OO)
          else
          if OO is TTeePicture then
          begin
            tmp:=nil;
            GetPictureEditor(tmp);
            Inspector.Items.Add(iiImage,L.Name,OO,tmp)
          end
          else
          begin
            Found:=-1;

            for tt:=0 to ClassEditors.Count-1 do
                if OO is ClassEditors[tt].ItemClass then
                begin
                  Found:=tt;
                  break;
                end;

            if Found<>-1 then
               Inspector.Items.Add(iiButton,L.Name,OO,ClassEditors[Found].Editor).Owner:=O
            else
               Inspector.Items.Add(iiButton,L.Name,OO).Owner:=O;
          end;
        end;
      end;

      tkArray,
      tkRecord,
      tkSet :
          Inspector.Items.Add(iiString,L.Name,GetSetProp(O,L.Name),O,ChangedSet);

      tkVariant : Inspector.Items.Add(iiSelection,L.Name,O);

      tkMethod,
      tkUnknown,
      tkInterface,
      tkDynArray : ;
    end;
  end;

var n,
    t  : Integer;
    L : PPropList;
    tmpOk : Boolean;
begin
  if not Assigned(O) then
     Exit;

  n:=GetPropList(O,L);

  if n>0 then
     SortPropList(L,n);

  for t:=0 to n-1 do
    if Assigned(FOnFilter) then
    begin
      tmpOk:=True;

      FOnFilter(Self,O,L[t].Name,tmpOk);

      if tmpOk then
         AddProperty(L[t]);
    end
    else
      AddProperty(L[t]);

//  SortInspector:=Inspector;
//  TeeSort(0,Inspector.Items.Count-1,CompareItems,SwapItems);

  FreeMemory(L);

  Inspector.Rebuild;
end;

procedure TObjectInspector.ExpandInspector(Sender: TObject);

  procedure Expand;
  var tmp : TTeeInspector;
      tmpItem : TInspectorItem;
      tmpIndex : Integer;
  begin
    tmp:=TTeeInspector.Create(nil);
    try
      with Sender as TInspectorItem do
      begin
        FillInspector(tmp,Data as TPersistent);
        tmpIndex:=Index+1;
      end;

      Items.BeginUpdate;

      try
        while tmp.Items.Count>0 do
        begin
          tmpItem:=tmp.Items[tmp.Items.Count-1];
          tmpItem.Collection:=Items;
          tmpItem.Index:=tmpIndex;
          tmpItem.Parent:=Sender as TInspectorItem;
        end;
      finally
        Items.EndUpdate;
      end;

    finally
      tmp.Free;
    end;
  end;

  procedure Collapse;
  var t : Integer;
  begin
    t:=0;
    while t<Items.Count do
    begin
      if Items[t].Parent=Sender then
         Items.Delete(t)
      else
        Inc(t);
    end;
  end;

begin
  with Sender as TInspectorItem do
  begin
    if Expanded then
       Collapse
    else
       Expand;

    Expanded:=not Expanded;
  end;

  Invalidate;
end;

procedure TObjectInspector.SetEnumItemIndex(Sender: TInspectorItem;
  Index: Integer);
var P : PPropInfo;
begin
  SetOrdProp(Sender.Data,Sender.Caption,Index);
  P:=GetPropInfo(Sender.Data, Sender.Caption);
  Sender.Value:=GetEnumName(P^.PropType^, Index);
end;

function TObjectInspector.ItemExpandable(ARow: Integer): Boolean;
var tmp : TInspectorItem;
    P   : PPropInfo;
begin
  result:=inherited ItemExpandable(ARow);

  if (not result) and (Items.Count>0) then
  begin
    tmp:=Item(ARow);

    if Assigned(tmp) and Assigned(tmp.Owner) and Assigned(tmp.Data) then
    begin
      P:=GetPropInfo(tmp.Owner,tmp.Caption);

      if Assigned(P) then
         result:=GetTypeData(P^.PropType^).PropCount>0;
    end;
  end;
end;

end.
