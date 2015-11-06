inherited IsometricAxis: TIsometricAxis
  Caption = 'IsometricAxis'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Memo1: TMemo
    Lines.Strings = (
      'A small function lets you make two axis "isometric".'
      
        'That is, for same number of pixels, same scales according to you' +
        'r screen size,'
      'so grid lines form perfect "squares" instead of rectangle.'
      ''
      'MakeIsoAxis(Series1);'
      ''
      
        'Note: Must be called after axes have recalculated min and max va' +
        'lues. See code.')
  end
  inherited Chart1: TChart
    Title.Text.Strings = (
      'Ismoetric axes')
    OnUndoZoom = Chart1UndoZoom
    OnZoom = Chart1Zoom
    View3D = False
    object Series1: TLineSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  inherited Panel1: TPanel
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Make isometric'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
