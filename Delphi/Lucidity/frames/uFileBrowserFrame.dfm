object FileBrowserFrame: TFileBrowserFrame
  Left = 0
  Top = 0
  Width = 301
  Height = 642
  TabOrder = 0
  object Panel: TRedFoxContainer
    Left = 0
    Top = 0
    Width = 301
    Height = 642
    Color = '$FFEEEEEE'
    Align = alClient
    object BackgroundPanel: TVamPanel
      AlignWithMargins = True
      Left = 2
      Top = 2
      Width = 297
      Height = 638
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Opacity = 255
      HitTest = True
      Color = '$FFCCCCCC'
      Transparent = False
      Align = alClient
      Visible = True
      object LowerPanel: TVamDiv
        Left = 0
        Top = 536
        Width = 297
        Height = 102
        Opacity = 255
        HitTest = True
        Align = alBottom
        Visible = True
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 2
        object TextInfoContainer: TVamDiv
          Left = 4
          Top = 4
          Width = 219
          Height = 96
          Opacity = 255
          HitTest = True
          Align = alClient
          Visible = True
          object PreviewInfo3: TVamLabel
            Left = 0
            Top = 40
            Width = 219
            Height = 20
            Opacity = 255
            Text = 'Awesome Drum.wav'
            HitTest = True
            AutoSize = False
            TextAlign = AlignNear
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alTop
            Visible = True
          end
          object PreviewInfo1: TVamLabel
            Left = 0
            Top = 0
            Width = 219
            Height = 20
            Opacity = 255
            Text = 'Awesome Drum.wav'
            HitTest = True
            AutoSize = False
            TextAlign = AlignNear
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alTop
            Visible = True
          end
          object PreviewInfo2: TVamLabel
            Left = 0
            Top = 20
            Width = 219
            Height = 20
            Opacity = 255
            Text = 'Awesome Drum.wav'
            HitTest = True
            AutoSize = False
            TextAlign = AlignNear
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alTop
            Visible = True
          end
        end
        object VamDiv1: TVamDiv
          Left = 223
          Top = 4
          Width = 70
          Height = 96
          Opacity = 255
          HitTest = True
          Align = alRight
          Visible = True
          object LfoShapeTextBox1: TVamLabel
            Left = 0
            Top = 40
            Width = 70
            Height = 20
            Opacity = 255
            Text = 'PREVIEW'
            HitTest = True
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alTop
            Visible = True
          end
          object PreviewVolumeKnob: TVamKnob
            AlignWithMargins = True
            Left = 27
            Top = 6
            Width = 40
            Height = 32
            Margins.Left = 27
            Margins.Top = 6
            Margins.Bottom = 2
            Opacity = 255
            DisplayClass = 'SmallUnipolarKnob'
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
            Align = alTop
            Visible = True
          end
          object PreviewOnOffButton: TVamButton
            Left = 7
            Top = 13
            Width = 20
            Height = 20
            Opacity = 255
            Text = 'A'
            HitTest = True
            ShowBorder = True
            Color_Border = '$FF242B39'
            ColorOnA = '$FF7AA3E9'
            ColorOnB = '$FF7AA3E9'
            ColorOffA = '$FFD4DCE8'
            ColorOffB = '$FFD4DCE8'
            ButtonState = bsOff
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            OnChanged = PreviewOnOffButtonChanged
            Visible = True
          end
        end
      end
      object ScrollBox: TVamScrollBox
        Left = 0
        Top = 0
        Width = 297
        Height = 473
        Opacity = 255
        HitTest = True
        Color_Border = '$FF000000'
        Color_Background = '$FF888888'
        Color_Foreground = '$FFCCCCCC'
        ScrollBars = ssVertical
        ScrollBarWidth = 16
        ScrollXIndexSize = 0.250000000000000000
        ScrollYIndexSize = 0.250000000000000000
        OnScroll = ScrollBoxScroll
        Align = alTop
        Visible = True
        object InsidePanel: TVamPanel
          Left = 0
          Top = 0
          Width = 281
          Height = 473
          Opacity = 255
          HitTest = True
          Color = '$FFC6CAD5'
          CornerRadius1 = 3.000000000000000000
          CornerRadius4 = 3.000000000000000000
          Transparent = False
          Align = alClient
          Visible = True
          Padding.Left = 4
          Padding.Top = 4
          Padding.Right = 4
          Padding.Bottom = 4
          object FileTreeView: TVamTreeView
            Left = 4
            Top = 4
            Width = 273
            Height = 465
            Opacity = 255
            HitTest = True
            SelectedNodeColor = clBlack
            SelectedNodeAlpha = 35
            ChildIndent = 12
            DefaultNodeHeight = 16
            Options = []
            RootIndent = 4
            OnScrollXChange = FileTreeViewScrollXChange
            OnScrollYChange = FileTreeViewScrollYChange
            OnNodeRightClicked = FileTreeViewNodeRightClicked
            OnTreeRightClicked = FileTreeViewTreeRightClicked
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Align = alClient
            Visible = True
          end
        end
      end
    end
  end
end
