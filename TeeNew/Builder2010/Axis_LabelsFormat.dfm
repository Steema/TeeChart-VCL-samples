inherited AxisLabelsFormat: TAxisLabelsFormat
  PixelsPerInch = 120
  TextHeight = 16
  inherited BaseSplitter1: TSplitter
    Top = 70
  end
  inherited Memo1: TMemo
    Height = 70
    Lines.Strings = (
      'Customizing axis labels format (font color, etc) can be done'
      'using the OnGetAxisLabel event.'
      'The left axis shows labels in different colors.')
  end
  inherited Chart1: TChart
    Top = 123
    Height = 203
    Legend.Visible = False
    Title.Visible = False
    View3D = False
    OnGetAxisLabel = Chart1GetAxisLabel
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlue
      LinePen.Color = clBlue
      LinePen.Width = 2
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      Data = {
        0019000000000000000070874000000000001887400000000000A08540000000
        0000288640000000000048854000000000004084400000000000508240000000
        00008080400000000000B07C4000000000000078400000000000F07440000000
        0000B07040000000000040734000000000002067400000000000606A40000000
        0000405D400000000000E062400000000000004B400000000000406440000000
        000080654000000000000062400000000000606F400000000000E07440000000
        00009072400000000000407540}
    end
  end
  inherited Panel1: TPanel
    Top = 72
  end
end
