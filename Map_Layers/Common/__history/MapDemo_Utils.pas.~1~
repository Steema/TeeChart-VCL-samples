unit MapDemo_Utils;
{$I TeeDefs.inc}

interface

uses
  {$IFDEF FMX}
  FMXTee.Engine, FMXTee.Tree, FMXTee.Series.Map, FMXTee.Series.World
  {$ELSE}
  TeEngine, TeeTree, TeeMapSeries, TeeWorldSeries
  {$ENDIF};

procedure DemoCheckedNode(const RootPath:String; const Node:TTreeNodeShape; const Series:TWorldSeries);
function FilePath(const RootPath:String; ANode:TTreeNodeShape):String;
procedure FillDemoTree(const Tree:TTree; const RootPath:String);
procedure ScaleCoordinates(const ASeries:TChartSeries; const XDivisor,YDivisor,XOffset,YOffset:Single);

implementation

{$IFNDEF CPUX64}
{$IFNDEF FMX}
{$DEFINE USEBDE}
{$ENDIF}
{$ENDIF}

uses
  Classes, SysUtils, Math, IniFiles,
  {$IFDEF FMX}
  FMXTee.Procs, FMXTee.Series.Bubble, FMXTee.Series, FMXTee.Import.ShapeFile
  {$ELSE}
  {$IFDEF USEBDE}
  DBTables,
  {$ENDIF}
  TeeProcs, BubbleCh, Series, TeeSHP
  {$ENDIF};

procedure ScaleCoordinates(const ASeries:TChartSeries; const XDivisor,YDivisor,XOffset,YOffset:Single);
var t, tt : Integer;
begin
  if (not Assigned(ASeries)) or (not (ASeries is TMapSeries)) then
     Exit;

  with TMapSeries(ASeries) do
  for t:=0 to Shapes.Count-1 do
  with Shapes[t].Points do
      for tt:=0 to Count-1 do
      begin
        XValues.Value[tt]:=(XValues.Value[tt]*XDivisor)-XOffset;
        YValues.Value[tt]:=(YValues.Value[tt]*YDivisor)-YOffset;
      end;

  ASeries.Repaint;
end;

procedure GetFiles(const Tree:TTree; const RootPath:String);

  procedure SearchPath(const AParent:TTreeNodeShape; const APath:String);
  var f : TSearchRec;
      tmp : String;
      tmpNode : TTreeNodeShape;
  begin
    AParent.ImageIndex:=tiUnChecked;

    if FindFirst(APath+'\*.*',faAnyFile,f)=0 then
    begin
      Repeat
        if (f.Attr and faDirectory)=faDirectory then
        begin
          if (f.Name<>'.') and (f.Name<>'..') and (f.Name<>'__history') and
             (Copy(f.Name,1,6)<>'AQtime') then
          begin
            tmpNode:=AParent.AddChild(f.Name);
            SearchPath(tmpNode,APath+'\'+f.Name);
            if tmpNode.Count=0 then
               tmpNode.Free;
          end;
        end
        else
        begin
          tmp:=UpperCase(ExtractFileExt(f.Name));

          if (tmp='.SHP') {$IFDEF D16}or (tmp='.KMZ'){$ENDIF} or (tmp='.KML')
           or (tmp='.TXT') or (tmp='.CSV') then

             if (tmp<>'.TXT') or (Pos('.VERSION.TXT',UpperCase(f.Name))=0) then

               {$IFDEF D16}
               // Do not add KMZ if same file KML exists
               if (tmp='.KMZ') and FileExists(APath+'\'+ChangeFileExt(f.Name,'.kml')) then
               else
               {$ENDIF}

                  AParent.AddChild(f.Name).ImageIndex:=tiUnChecked;
        end;

      Until FindNext(f)<>0;

      FindClose(f);
    end;
  end;

begin
  SearchPath(Tree.AddRoot('Layers'),RootPath);
end;

const
  TeeMsg_Cities='Cities';
  TeeMsg_Counties='Counties';
  TeeMsg_Entities='Entities';
  TeeMsg_America='America';
  TeeMsg_NorthAmerica='North America';
  TeeMsg_USA='USA';

procedure FillDemoTree(const Tree:TTree; const RootPath:String);
var tmp,
    tmpNorth,
    tmpUSA : TTreeNodeShape;
begin
  Tree.AutoRepaint:=False;
  GetFiles(Tree,RootPath);

  Tree.Roots[0].Expanded:=True;

  Tree.Roots[0].AddChild(TeeMsg_Cities).ImageIndex:=tiUnChecked;

  with Tree.Roots[0].AddChild(TeeMsg_Counties) do
  begin
    ImageIndex:=tiUnChecked;
    AddChild('China').ImageIndex:=tiUnchecked;
    AddChild('France').ImageIndex:=tiUnchecked;
    AddChild('Germany').ImageIndex:=tiUnchecked;
    AddChild('Spain').ImageIndex:=tiUnchecked;
    AddChild('UK').ImageIndex:=tiUnchecked;
    AddChild('USA').ImageIndex:=tiUnchecked;
    AddChild('USA States').ImageIndex:=tiUnchecked;
  end;

  Tree.Roots[0].AddChild('Flags').ImageIndex:=tiUnChecked;

  with Tree.Roots[0].AddChild(TeeMsg_Entities) do
  begin
    ImageIndex:=tiChecked;
    AddChild('Africa').ImageIndex:=tiChecked;

    tmp:=AddChild(TeeMsg_America);
    tmp.ImageIndex:=tiChecked;
      tmpNorth:=tmp.AddChild(TeeMsg_NorthAmerica);
      tmpNorth.ImageIndex:=tiChecked;
        tmpUSA:=tmpNorth.AddChild('USA');
        tmpUSA.ImageIndex:=tiChecked;

      tmp.AddChild('Central America').ImageIndex:=tiChecked;
      tmp.AddChild('South America').ImageIndex:=tiChecked;

    AddChild('Antarctica').ImageIndex:=tiChecked;
    AddChild('Asia').ImageIndex:=tiChecked;
    AddChild('Australia').ImageIndex:=tiChecked;
    AddChild('Europe').ImageIndex:=tiChecked;
    AddChild('Middle East').ImageIndex:=tiChecked;
  end;

  Tree.AutoRepaint:=True;
end;

function RemoveQuotes(const S:String):String;
begin
  result:=S;

  if Copy(result,1,1)='"' then
     Delete(result,1,1);

  if Copy(result,Length(result),1)='"' then
     Delete(result,Length(result),1);
end;

function FilePath(const RootPath:String; ANode:TTreeNodeShape):String;
begin
  result:=ANode.SimpleText;

  while Assigned(ANode.Parent) do
  begin
    ANode:=ANode.Parent;

    if Assigned(ANode.Parent) then
       result:=ANode.SimpleText+'\'+result;
  end;

  result:=RootPath+'\'+result;
end;

type
  TMapProject=record
    Scale : Boolean;
    xDiv,yDiv,
    xOff,yOff : Single;

    HasFields:Boolean;

    ValueTotal,
    ValueIndex : Integer;

    FieldLabel,
    FieldValue,
    FieldValues,
    FieldSize : String;

    HasCountries : Boolean;
    Bubbles,
    LogValue: Boolean;
    Divisor : Single;
    Header,
    Country,
    Value : Integer;
  end;

procedure DemoCheckedNode(const RootPath:String; const Node:TTreeNodeShape; const Series:TWorldSeries);

  function LoadCountryData(const P:TMapProject; const AFile:String):TChartSeries;
  var st : TStringList;
      s : String;
      tmpCountry: String;
      tmpIndex,
      t : Integer;
      tmpSeries : TBubbleSeries;
      tmpRealValue,
      tmpValue : Extended;
      tmpShape : TTeePolygon;
      tmpPoints : TPolygonSeries;
  begin
    st:=TStringList.Create;
    try
      st.LoadFromFile(AFile);

      if P.Bubbles then
      begin
        tmpSeries:=TBubbleSeries.Create(Node.Owner);
        tmpSeries.Pointer.InflateMargins:=False;
        tmpSeries.Transparency:=70;
      end
      else
      begin
        tmpSeries:=nil;
        
        Series.BeginUpdate;

        for t:=0 to Series.Count-1 do
            Series.ZValues.Value[t]:=0;
      end;

      for t:=P.Header to st.Count-1 do
      begin
        s:=st[t];

        tmpCountry:=RemoveQuotes(Trim(TeeExtractField(s,P.Country,',')));

        tmpIndex:=Series.Labels.IndexOfLabel(tmpCountry);

        if tmpIndex<>-1 then
        begin
          tmpRealValue:=StrToFloatDef(RemoveQuotes(Trim(TeeExtractField(s,P.Value,','))),0);

          tmpValue:=tmpRealValue;

          if P.LogValue then
             if tmpValue>0 then
                tmpValue:=Log10(tmpValue)
             else
                tmpValue:=0;

          if P.Divisor<>1 then
             tmpValue:=tmpValue/P.Divisor;

          if P.Bubbles then
          begin
            tmpShape:=Series.Shapes[tmpIndex];
            tmpPoints:=tmpShape.Points;
            tmpSeries.AddBubble((tmpPoints.MinXValue+tmpPoints.MaxXValue)*0.5,
                                (tmpPoints.MinYValue+tmpPoints.MaxYValue)*0.5,
                                tmpValue,
                                tmpCountry+#13+FormatFloat(tmpSeries.ValueFormat,tmpRealValue));
          end
          else
             Series.ZValues.Value[tmpIndex]:=tmpValue;
        end;
      end;

      if P.Bubbles then
         result:=tmpSeries
      else
      begin
        Series.EndUpdate;
        result:=nil;
      end;

    finally
      st.Free;
    end;
  end;

  function IniBoolean(const Ini:TIniFile; const Section,Key,Value:String):Boolean;
  var tmpSt : String;
  begin
    tmpSt:=UpperCase(Ini.ReadString(Section,Key,Value));
    result:=(tmpSt='TRUE') or (tmpSt='1');
  end;

  function LoadProject(const AFile:String):TMapProject;
  var s : String;
      st : TIniFile;
      i : Integer;
  begin
    s:=ChangeFileExt(AFile,'.pro');

    result.Scale:=False;
    result.HasFields:=False;
    result.FieldLabel:='';
    result.FieldSize:='';
    result.FieldValue:='';
    result.FieldValues:='';

    result.HasCountries:=False;
    result.Bubbles:=False;
    result.Header:=0;
    result.Divisor:=1;

    if FileExists(s) then
    begin
      st:=TIniFile.Create(s);
      try
        if st.SectionExists('Scale') then
        with result do
        begin
          xDiv:=1/StrToFloat(st.ReadString('Scale','XDIV','1'));
          xOff:=StrToFloat(st.ReadString('Scale','XOFF','0'));
          yDiv:=1/StrToFloat(st.ReadString('Scale','YDIV','1'));
          yOff:=StrToFloat(st.ReadString('Scale','YOFF','0'));
          Scale:=True;
        end;

        if st.SectionExists('DB') then
        begin
          result.HasFields:=True;
          result.FieldLabel:=st.ReadString('DB','LABEL','');
          result.FieldValues:=st.ReadString('DB','VALUE','');

          result.ValueIndex:=0;

          i:=Pos(',',result.FieldValues);

          if i=0 then
          begin
            result.FieldValue:=result.FieldValues;
            result.ValueTotal:=1;
          end
          else
          begin
            result.FieldValue:=Copy(result.FieldValues,1,i-1);
            result.ValueTotal:=TeeNumFields(result.FieldValues,',');
          end;

          result.FieldSize:=st.ReadString('DB','SIZE','');
        end;

        if st.SectionExists('COUNTRY') then
        begin
          result.HasCountries:=True;
          result.Country:=st.ReadInteger('COUNTRY','COUNTRY',0);
          result.Header:=st.ReadInteger('COUNTRY','HEADER',0);
          result.Value:=st.ReadInteger('COUNTRY','VALUE',0);

          result.LogValue:=IniBoolean(st,'COUNTRY','LOGVALUE','FALSE');
          result.Bubbles:=IniBoolean(st,'COUNTRY','BUBBLES','FALSE');
          result.Divisor:=st.ReadFloat('COUNTRY','DIVISOR',1);
        end;
      finally
        st.Free;
      end;
    end;
  end;

  function FinishAdding(const ASeries:TChartSeries; const ATitle:String):TChartSeries;
  begin
    ASeries.Title:=RemoveFileExtension(ATitle);
    ASeries.ManualData:=True;
    ASeries.ParentChart:=Series.ParentChart;
    result:=ASeries;
  end;

var tmp : TTreeNodeShape;
    tmpFile,
    tmpExt : String;
    tmpMap : TMapSeries;
    tmpPoint : TPointSeries;
    t: Integer;
    tmpSt : TStringList;
    tmpProject : TMapProject;

    {$IFDEF USEBDE}
    tmpTable : TTable;
    {$ENDIF}
begin
  tmp:=Node;

  if Assigned(tmp.Parent) and (tmp.Parent.SimpleText=TeeMsg_Entities) then
  begin
    if tmp.SimpleText='Africa' then
       Series.Entities.Africa.Visible:=tmp.Checked
    else
    if tmp.SimpleText=TeeMsg_America then
       Series.Entities.America.Visible:=tmp.Checked
    else
    if tmp.SimpleText='Antarctica' then
       Series.Entities.Antarctica.Visible:=tmp.Checked
    else
    if tmp.SimpleText='Asia' then
       Series.Entities.Asia.Visible:=tmp.Checked
    else
    if tmp.SimpleText='Australia' then
       Series.Entities.Australia.Visible:=tmp.Checked
    else
    if tmp.SimpleText='Europe' then
       Series.Entities.Europe.Visible:=tmp.Checked
    else
    if tmp.SimpleText='Middle East' then
       Series.Entities.MiddleEast.Visible:=tmp.Checked
  end
  else
  if Assigned(tmp.Parent) and (tmp.Parent.SimpleText=TeeMsg_America) then
  begin
    if tmp.SimpleText=TeeMsg_NorthAmerica then
       Series.Entities.America.North.Visible:=tmp.Checked
    else
    if tmp.SimpleText='South America' then
       Series.Entities.America.South.Visible:=tmp.Checked
    else
    if tmp.SimpleText='Central America' then
       Series.Entities.America.Central.Visible:=tmp.Checked
  end
  else
  if Assigned(tmp.Parent) and (tmp.Parent.SimpleText=TeeMsg_NorthAmerica) then
  begin
    if tmp.SimpleText=TeeMsg_USA then
       Series.Entities.America.North.USA.Visible:=tmp.Checked
  end
  else
  if tmp.Count>0 then
     for t:=0 to tmp.Count-1 do
         tmp.Children[t].Checked:=tmp.Checked
  else
  if tmp.Checked then
  begin
    if Assigned(tmp.Data) then
       TChartSeries(tmp.Data).Visible:=True
    else
    begin
      if tmp.SimpleText=TeeMsg_Cities then
      begin
        tmpPoint:=TPointSeries.Create(Node.Owner);
        tmpPoint.XValues.Order:=loNone;
        tmpPoint.Marks.Transparent:=True;
        tmpPoint.Marks.AutoPosition:=False;
        tmpPoint.Marks.Arrow.Hide;

        tmpPoint.Pointer.SizeFloat:=0.1;
        tmpPoint.Pointer.SizeUnits:=suAxis;

        TWorldSeries.AddCities(tmpPoint);

        tmp.Data:=FinishAdding(tmpPoint,tmp.SimpleText);
      end
      else
      if tmp.SimpleText='Flags' then
         Series.Flags.Visible:=tmp.Checked
      else
      if Assigned(tmp.Parent) and (tmp.Parent.SimpleText=TeeMsg_Counties) then
      begin
        tmpMap:=TWorldSeries.Create(Node.Owner);

        if tmp.SimpleText='China' then
           TWorldSeries(tmpMap).Map:=wmChina
        else
        if tmp.SimpleText='France' then
           TWorldSeries(tmpMap).Map:=wmFrance
        else
        if tmp.SimpleText='Spain' then
           TWorldSeries(tmpMap).Map:=wmSpain
        else
        if tmp.SimpleText='UK' then
           TWorldSeries(tmpMap).Map:=wmUK
        else
        if tmp.SimpleText='Germany' then
           TWorldSeries(tmpMap).Map:=wmGermany
        else
        if tmp.SimpleText='USA' then
           TWorldSeries(tmpMap).Map:=wmUSAAlaskaCounties
        else
        if tmp.SimpleText='USA States' then
           TWorldSeries(tmpMap).Map:=wmUSAHawaiiAlaska
        else
           raise Exception.Create('Map not valid: '+tmp.SimpleText);

        tmp.Data:=FinishAdding(tmpMap,tmp.SimpleText);
      end
      else
      begin
        tmpFile:=FilePath(RootPath,tmp);
        tmpExt:=UpperCase(ExtractFileExt(tmpFile));

        if tmpExt='.TXT' then
        begin
          tmpPoint:=TPointSeries.Create(Node.Owner);
          tmpPoint.XValues.Order:=loNone;

          tmpPoint.Pointer.SizeFloat:=0.1;
          tmpPoint.Pointer.SizeUnits:=suAxis;

          tmpSt:=TStringList.Create;
          try
            tmpSt.LoadFromFile(tmpFile);
            TWorldSeries.AddPlacemarks(tmpSt,tmpPoint);
          finally
            tmpSt.Free;
          end;

          tmp.Data:=FinishAdding(tmpPoint,tmp.SimpleText);
        end
        else
        if tmpExt='.CSV' then
        begin
          tmpProject:=LoadProject(tmpFile);

          if tmpProject.HasCountries then
             tmp.Data:=FinishAdding(LoadCountryData(tmpProject,tmpFile),tmp.SimpleText);
        end
        else
        begin
          tmpMap:=TMapSeries.Create(Node.Owner);

          if tmpExt='.SHP' then
          begin
            tmpProject:=LoadProject(tmpFile);

            {$IFDEF USEBDE}
            if tmpProject.HasFields then
            begin
              tmpTable:=TTable.Create(Node.Owner);
              try
                tmpTable.TableName:=ChangeFileExt(tmpFile,'.dbf');
                tmpTable.ReadOnly:=True;

                tmpTable.Open;

                LoadMap(tmpMap,tmpFile,tmpTable,tmpProject.FieldLabel,
                   tmpProject.FieldValue,True,tmpProject.FieldSize);
              finally
                tmpTable.Free;
              end;
            end
            else
            {$ENDIF}
               LoadMap(tmpMap,tmpFile);

            if tmpProject.Scale then
               with tmpProject do
                    ScaleCoordinates(tmpMap,xDiv,yDiv,xOff,yOff);
          end
          else
          begin
            TTeeKMLSource.Load(tmpMap,tmpFile);

            tmpMap.PointSize:=0.1;
            tmpMap.Pointer.SizeUnits:=suAxis;
            tmpMap.Pointer.Style:=psCircle;
            tmpMap.UseColorRange:=False;
          end;

          tmp.Data:=FinishAdding(tmpMap,tmp.SimpleText);
        end;
      end;
    end;
  end
  else
  if tmp.SimpleText='Flags' then
     Series.Flags.Visible:=tmp.Checked
  else
  if Assigned(tmp.Data) then
     TChartSeries(tmp.Data).Visible:=False;
end;

end.
