unit TeeSmoothGrid3D;
{$I TeeDefs.inc}

interface

uses TeeSurfa;

// Inserts new grid 3D points in between existing grid cells,
// by doing a simple linear interpolation of values.
procedure SmoothGrid3D(Series:TCustom3DGridSeries);

implementation

procedure SmoothGrid3D(Series:TCustom3DGridSeries);
var x,z      : Integer;
    tmpX,
    tmpY,
    tmpZ     : Double;
    tmpNumX,
    tmpNumZ  : Integer;
begin
  with Series do
  begin
    BeginUpdate;
    try
      tmpNumX:=NumXValues;
      tmpNumZ:=NumZValues;

      for x:=1 to tmpNumX-1 do
      begin
        for z:=1 to tmpNumZ-1 do
        begin
          tmpX:=(XValues.Value[GridIndex[x,z]]+
                 XValues.Value[GridIndex[x+1,z]])*0.5;
          tmpZ:=(ZValues.Value[GridIndex[x,z]]+
                 ZValues.Value[GridIndex[x,z+1]])*0.5;

          with YValues do
            tmpY:=(Value[GridIndex[x,z]]+
                   Value[GridIndex[x+1,z]]+
                   Value[GridIndex[x,z]]+
                   Value[GridIndex[x,z+1]])*0.25;

          AddXYZ(tmpX,tmpY,tmpZ);

          AddXYZ(XValues.Value[GridIndex[x,z]],
                ( YValues.Value[GridIndex[x,z]]+ YValues.Value[GridIndex[x,z+1]] )*0.5,
                 tmpZ);

          AddXYZ( tmpX,
                ( YValues.Value[GridIndex[x,z]]+ YValues.Value[GridIndex[x+1,z]] )*0.5,
                 ZValues.Value[GridIndex[x,z]]);
        end;

        AddXYZ( (XValues.Value[GridIndex[x,tmpNumZ]]+XValues.Value[GridIndex[x+1,tmpNumZ]])*0.5,
                ( YValues.Value[GridIndex[x,tmpNumZ]]+ YValues.Value[GridIndex[x+1,tmpNumZ]] )*0.5,
                 ZValues.Value[GridIndex[x,tmpNumZ]]);
      end;

      for z:=1 to tmpNumZ-1 do
      begin
        AddXYZ(XValues.Value[GridIndex[tmpNumX,z]],
                ( YValues.Value[GridIndex[tmpNumX,z]]+ YValues.Value[GridIndex[tmpNumX,z+1]] )*0.5,
                ( ZValues.Value[GridIndex[tmpNumX,z]] + ZValues.Value[GridIndex[tmpNumX,z+1]] )*0.5
                );
      end;

      IrregularGrid:=True;
    finally
      EndUpdate;
      Repaint;
    end;
  end;
end;

end.
