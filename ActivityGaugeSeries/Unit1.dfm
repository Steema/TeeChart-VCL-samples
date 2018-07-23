object Form1: TForm1
  Left = 192
  Top = 125
  Caption = 'Form1'
  ClientHeight = 440
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 33
    Width = 675
    Height = 407
    BackWall.Brush.Gradient.Direction = gdBottomTop
    BackWall.Brush.Gradient.EndColor = clWhite
    BackWall.Brush.Gradient.StartColor = 15395562
    BackWall.Brush.Gradient.Visible = True
    BackWall.Transparent = False
    Foot.Font.Color = clBlue
    Foot.Font.Name = 'Verdana'
    Gradient.Direction = gdBottomTop
    Gradient.EndColor = clWhite
    Gradient.MidColor = 15395562
    Gradient.StartColor = 15395562
    Gradient.Visible = True
    LeftWall.Color = 14745599
    Legend.Font.Name = 'Verdana'
    Legend.Shadow.Transparency = 0
    RightWall.Color = 14745599
    Title.Alignment = taLeftJustify
    Title.Font.Color = clGray
    Title.Font.Height = -16
    Title.Font.Name = 'Verdana'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Activity Gauge Series')
    BottomAxis.Axis.Color = 4210752
    BottomAxis.Grid.Color = 11119017
    BottomAxis.LabelsFormat.Font.Name = 'Verdana'
    BottomAxis.TicksInner.Color = 11119017
    BottomAxis.Title.Font.Name = 'Verdana'
    DepthAxis.Axis.Color = 4210752
    DepthAxis.Grid.Color = 11119017
    DepthAxis.LabelsFormat.Font.Name = 'Verdana'
    DepthAxis.TicksInner.Color = 11119017
    DepthAxis.Title.Font.Name = 'Verdana'
    DepthTopAxis.Axis.Color = 4210752
    DepthTopAxis.Grid.Color = 11119017
    DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
    DepthTopAxis.TicksInner.Color = 11119017
    DepthTopAxis.Title.Font.Name = 'Verdana'
    LeftAxis.Axis.Color = 4210752
    LeftAxis.Grid.Color = 11119017
    LeftAxis.LabelsFormat.Font.Name = 'Verdana'
    LeftAxis.TicksInner.Color = 11119017
    LeftAxis.Title.Font.Name = 'Verdana'
    RightAxis.Axis.Color = 4210752
    RightAxis.Grid.Color = 11119017
    RightAxis.LabelsFormat.Font.Name = 'Verdana'
    RightAxis.TicksInner.Color = 11119017
    RightAxis.Title.Font.Name = 'Verdana'
    TopAxis.Axis.Color = 4210752
    TopAxis.Grid.Color = 11119017
    TopAxis.LabelsFormat.Font.Name = 'Verdana'
    TopAxis.TicksInner.Color = 11119017
    TopAxis.Title.Font.Name = 'Verdana'
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    Enabled = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object TAnnotationTool
      ShowInEditor = False
      Position = ppCenter
      Shape.Font.Height = -27
      Shape.Transparent = True
    end
    object TAnnotationTool
      ShowInEditor = False
      Position = ppCenter
      Shape.Font.Height = -27
      Shape.Transparent = True
    end
    object TAnnotationTool
      ShowInEditor = False
      Position = ppCenter
      Shape.Font.Height = -27
      Shape.Transparent = True
    end
  end
  object TeeCommander1: TTeeCommander
    Left = 0
    Top = 0
    Width = 675
    Height = 33
    Panel = Chart1
    Align = alTop
    ParentShowHint = False
    TabOrder = 1
    object Label1: TLabel
      Left = 448
      Top = 10
      Width = 52
      Height = 13
      Caption = 'Back Color'
    end
    object CheckBox1: TCheckBox
      Left = 320
      Top = 10
      Width = 97
      Height = 17
      Caption = 'Center Text'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object ColorBox1: TColorBox
      Left = 516
      Top = 6
      Width = 145
      Height = 22
      TabOrder = 1
      OnChange = ColorBox1Change
    end
  end
end
