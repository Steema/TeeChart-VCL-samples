inherited AxisItemsDemo: TAxisItemsDemo
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  inherited Memo1: TMemo
    Lines.Strings = (
      
        'Axis can be customized to display labels at specific positions w' +
        'ith'
      'custom text and formatting, without using any event:'
      ''
      'Chart1.Axes.Left.Items.Add( 123, '#39'Hello'#39' )')
  end
  inherited Chart1: TChart
    Title.Text.Strings = (
      'Custom axis labels')
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 154
      Top = 17
      Width = 37
      Height = 16
      Caption = '&Label:'
      FocusControl = Edit1
    end
    object CheckBox1: TCheckBox
      Left = 17
      Top = 16
      Width = 120
      Height = 21
      Caption = '&Custom labels'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object Edit1: TEdit
      Left = 193
      Top = 14
      Width = 37
      Height = 24
      TabOrder = 1
      Text = '0'
      OnChange = Edit1Change
    end
    object UpDown1: TUpDown
      Left = 230
      Top = 14
      Width = 19
      Height = 24
      Associate = Edit1
      Min = 0
      Position = 0
      TabOrder = 2
      Wrap = False
    end
    object Edit2: TEdit
      Left = 266
      Top = 14
      Width = 70
      Height = 24
      TabOrder = 3
      Text = '0'
      OnChange = Edit2Change
    end
    object Button1: TButton
      Left = 384
      Top = 10
      Width = 92
      Height = 31
      Caption = '&Edit...'
      TabOrder = 4
    end
    object UpDown2: TUpDown
      Left = 336
      Top = 14
      Width = 19
      Height = 24
      Associate = Edit2
      Min = -10000
      Max = 10000
      Increment = 5
      Position = 0
      TabOrder = 5
      Wrap = False
    end
  end
end
