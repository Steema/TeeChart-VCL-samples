inherited AxesLabelsFormat: TAxesLabelsFormat
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  inherited Memo1: TMemo
    Lines.Strings = (
      'Axis labels now derive from TeeShape object.'
      'By default they are set to transparent.'
      ''
      'Chart1.Axes.Left.LabelsFormat.Color := clYellow ;')
  end
  inherited Chart1: TChart
    object Series1: TBarSeries
      HorizAxis = aBothHorizAxis
      Marks.ArrowLength = 20
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 20
      Marks.Visible = True
      SeriesColor = 4210816
      VertAxis = aBothVertAxis
      Dark3D = False
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
    end
  end
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 12
      Top = 15
      Width = 28
      Height = 16
      Caption = '&Axis:'
    end
    object ComboBox1: TComboBox
      Left = 47
      Top = 12
      Width = 178
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'Left'
        'Top'
        'Right'
        'Bottom')
    end
    object CheckBox1: TCheckBox
      Left = 246
      Top = 15
      Width = 120
      Height = 21
      Caption = 'Transparent'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button1: TButton
      Left = 383
      Top = 10
      Width = 92
      Height = 31
      Caption = '&Edit...'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
