inherited AxesOffsets: TAxesOffsets
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  inherited Memo1: TMemo
    Lines.Strings = (
      
        'Axes can have Offsets (in pixels) for both Minimum and Maximum s' +
        'cales.'
      ''
      'Chart1.Axes.Left.MaximumOffset := 4 ;'
      'Chart1.Axes.Left.MinimumOffset := 4 ;')
  end
  inherited Chart1: TChart
    Legend.Visible = False
    Title.Visible = False
    BottomAxis.Grid.SmallDots = True
    BottomAxis.MaximumOffset = 4
    BottomAxis.MinimumOffset = 4
    LeftAxis.Grid.SmallDots = True
    LeftAxis.MaximumOffset = 4
    LeftAxis.MinimumOffset = 4
    View3D = False
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
      LinePen.Width = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 28
      Height = 16
      Caption = '&Axis:'
      FocusControl = ComboBox1
    end
    object Label2: TLabel
      Left = 158
      Top = 16
      Width = 61
      Height = 16
      Caption = '&Min Offset:'
      FocusControl = Edit1
    end
    object Label3: TLabel
      Left = 315
      Top = 16
      Width = 65
      Height = 16
      Caption = '&Max Offset:'
      FocusControl = Edit2
    end
    object ComboBox1: TComboBox
      Left = 46
      Top = 12
      Width = 89
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'Left'
        'Bottom')
    end
    object Edit1: TEdit
      Left = 226
      Top = 14
      Width = 51
      Height = 24
      TabOrder = 1
      Text = '4'
      OnChange = Edit1Change
    end
    object UpDown1: TUpDown
      Left = 277
      Top = 14
      Width = 19
      Height = 24
      Associate = Edit1
      Min = -400
      Max = 400
      Position = 4
      TabOrder = 2
      Wrap = False
    end
    object Edit2: TEdit
      Left = 384
      Top = 14
      Width = 50
      Height = 24
      TabOrder = 3
      Text = '4'
      OnChange = Edit2Change
    end
    object UpDown2: TUpDown
      Left = 434
      Top = 14
      Width = 19
      Height = 24
      Associate = Edit2
      Min = -400
      Max = 400
      Position = 4
      TabOrder = 4
      Wrap = False
    end
  end
end
