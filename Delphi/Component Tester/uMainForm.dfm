object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 501
  ClientWidth = 1005
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 371
    Width = 139
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RedFoxContainer1: TRedFoxContainer
    Left = 64
    Top = 32
    Width = 521
    Height = 289
    Color = '$FFCCCCCC'
    object Knob1: TVamNumericKnob
      Left = 48
      Top = 56
      Width = 201
      Height = 25
      Opacity = 255
      Text = 'Knob1'
      HitTest = True
      TextAlign = AlignCenter
      TextVAlign = AlignCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KnobMin = 0
      KnobMax = 100
      NumericStyle = nsFloat
      DecimalPlaces = 2
      Visible = True
    end
    object Knob2: TVamNumericKnob
      Left = 48
      Top = 112
      Width = 201
      Height = 25
      Opacity = 255
      Text = 'VamNumericKnob1'
      HitTest = True
      TextAlign = AlignCenter
      TextVAlign = AlignCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KnobMin = 0
      KnobMax = 100
      NumericStyle = nsFloat
      DecimalPlaces = 2
      Visible = True
    end
    object VamShortMessageOverlay1: TVamShortMessageOverlay
      Left = 170
      Top = 168
      Width = 137
      Height = 49
      Opacity = 255
      Text = 'Short Message'
      HitTest = True
      AutoSizeBackground = True
      Color = '$FF000000'
      ColorBorder = '$FF00FF00'
      ColorText = '$FFFFFFFF'
      BorderWidth = 2
      ShowBorder = True
      CornerRadius1 = 6.000000000000000000
      CornerRadius2 = 6.000000000000000000
      CornerRadius3 = 6.000000000000000000
      CornerRadius4 = 6.000000000000000000
      TextAlign = AlignCenter
      TextVAlign = AlignCenter
      TextPadding.Left = 10
      TextPadding.Top = 6
      TextPadding.Right = 10
      TextPadding.Bottom = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Visible = True
    end
    object VamKnob1: TVamKnob
      Left = 360
      Top = 40
      Width = 100
      Height = 41
      Opacity = 255
      Text = 'VamKnob1'
      HitTest = True
      ModLineDist = 17.000000000000000000
      ModLineWidth = 3.000000000000000000
      ModLineColor = '$FFFF0000'
      ModLineOffColor = '$FFC0C0C0'
      IndicatorSize = 2.500000000000000000
      IndicatorDist = 9.000000000000000000
      IsBipolarKnob = False
      KnobMode = PositionEdit
      IsKnobEnabled = True
      VisibleSteps = 0
      ParameterIndex = 0
      OnKnobPosChanged = VamKnob1KnobPosChanged
      Visible = True
    end
    object VamKnob2: TVamKnob
      Left = 376
      Top = 128
      Width = 100
      Height = 41
      Opacity = 255
      Text = 'VamKnob1'
      HitTest = True
      ModLineDist = 17.000000000000000000
      ModLineWidth = 3.000000000000000000
      ModLineColor = '$FFFF0000'
      ModLineOffColor = '$FFC0C0C0'
      IndicatorSize = 2.500000000000000000
      IndicatorDist = 9.000000000000000000
      IsBipolarKnob = False
      KnobMode = PositionEdit
      IsKnobEnabled = True
      VisibleSteps = 0
      ParameterIndex = 0
      Visible = True
    end
    object VamModSelector1: TVamModSelector
      Left = 56
      Top = 184
      Width = 81
      Height = 65
      Opacity = 255
      Text = 'Bang'
      HitTest = True
      ColorBorder = '$00000000'
      Color = '$FF3E3E3E'
      ColorMouseOver = '$FF3E3E3E'
      TextAlign = AlignNear
      TextVAlign = AlignNear
      TextB = 'James'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Visible = True
    end
  end
  object Button2: TButton
    Left = 8
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 89
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 170
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 153
    Top = 371
    Width = 139
    Height = 25
    Caption = 'Button1'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Memo1: TMemo
    Left = 616
    Top = 88
    Width = 353
    Height = 265
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
