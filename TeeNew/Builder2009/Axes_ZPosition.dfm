inherited AxesZPosition: TAxesZPosition
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  inherited BaseSplitter1: TSplitter
    Top = 80
  end
  inherited Memo1: TMemo
    Height = 80
    Lines.Strings = (
      'Axes can be positioned along the Z (depth) direction.'
      'Chart1.Axes.Left.ZPosition := 100; '
      ''
      'Axes grid lines can be displayed to any Z position.')
  end
  inherited Chart1: TChart
    Top = 133
    Height = 193
    LeftWall.Visible = False
    Title.Text.Strings = (
      'Axes Z Position')
    Chart3DPercent = 100
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      VertAxis = aBothVertAxis
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  inherited Panel1: TPanel
    Top = 82
    object Label1: TLabel
      Left = 122
      Top = 20
      Width = 61
      Height = 16
      Alignment = taRightJustify
      Caption = '&Z position:'
      FocusControl = ScrollBar1
    end
    object Label2: TLabel
      Left = 375
      Top = 20
      Width = 19
      Height = 16
      Caption = '0%'
    end
    object ScrollBar1: TScrollBar
      Left = 188
      Top = 20
      Width = 179
      Height = 19
      PageSize = 0
      TabOrder = 0
      OnChange = ScrollBar1Change
    end
    object ComboBox1: TComboFlat
      Left = 10
      Top = 15
      Width = 100
      Height = 24
      ItemHeight = 16
      TabOrder = 1
      OnChange = ComboBox1Change
      Items.Strings = (
        'Left axis'
        'Right axis')
    end
  end
end
