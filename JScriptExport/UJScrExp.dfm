object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TeeChart HTML5 Javascript export formats'
  ClientHeight = 606
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object TeeCommander1: TTeeCommander
    Left = 0
    Top = 0
    Width = 1037
    Height = 33
    Panel = Chart1
    Align = alTop
    ParentShowHint = False
    TabOrder = 0
    ExplicitTop = -5
    object Button4: TButton
      Left = 553
      Top = 2
      Width = 143
      Height = 25
      Caption = 'Fill Chart Values'
      TabOrder = 0
      OnClick = Button4Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 529
    Height = 573
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 1
    object Chart1: TChart
      Left = 1
      Top = 1
      Width = 527
      Height = 571
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
      Title.Font.Name = 'Verdana'
      Title.Text.Strings = (
        'TChart')
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
      Align = alClient
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TBarSeries
        HoverElement = []
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
  end
  object Panel2: TPanel
    Left = 529
    Top = 33
    Width = 508
    Height = 573
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 506
      Height = 80
      Align = alTop
      TabOrder = 0
      object Button1: TButton
        Left = 183
        Top = 12
        Width = 143
        Height = 50
        Caption = 'Export to JScript '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 23
        Top = 12
        Width = 143
        Height = 50
        Caption = 'Export to HTML5 Canvas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        WordWrap = True
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 343
        Top = 12
        Width = 143
        Height = 50
        Caption = 'Open Output Folder'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        WordWrap = True
        OnClick = Button3Click
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 81
      Width = 506
      Height = 491
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 504
        Height = 489
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'As Canvas'
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 496
            Height = 458
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'As Simple JScript'
          ImageIndex = 1
          object Memo2: TMemo
            Left = 0
            Top = 0
            Width = 496
            Height = 458
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'As modified JScript'
          ImageIndex = 2
          object Memo3: TMemo
            Left = 0
            Top = 0
            Width = 496
            Height = 458
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
  end
end
