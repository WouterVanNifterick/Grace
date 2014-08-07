object SampleMapFrame: TSampleMapFrame
  Left = 0
  Top = 0
  Width = 652
  Height = 397
  TabOrder = 0
  object Panel: TRedFoxContainer
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 652
    Height = 395
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 2
    Color = '$CCCCCCCC'
    Align = alClient
    object BackgroundPanel: TVamPanel
      Left = 0
      Top = 0
      Width = 652
      Height = 395
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
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      object ScrollBox: TVamScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 646
        Height = 300
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Opacity = 255
        HitTest = True
        Color_Border = '$FF000000'
        Color_Background = '$FF888888'
        Color_Foreground = '$FFCCCCCC'
        ScrollBars = ssBoth
        ScrollBarWidth = 16
        ScrollXIndexSize = 0.250000000000000000
        ScrollYIndexSize = 0.250000000000000000
        OnScroll = ScrollBoxScroll
        Align = alClient
        Visible = True
        object InsidePanel: TVamPanel
          Left = 0
          Top = 0
          Width = 630
          Height = 284
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Opacity = 255
          HitTest = True
          Color = '$FF000000'
          Transparent = False
          Align = alClient
          Visible = True
          Padding.Left = 2
          Padding.Top = 2
          Padding.Right = 2
          Padding.Bottom = 2
          object SampleMapKeys: TVamSamplerKeys
            Left = 2
            Top = 241
            Width = 626
            Height = 41
            Opacity = 255
            HitTest = True
            Align = alBottom
            Visible = True
            OnRootKeyChanging = SampleMapKeysRootKeyChanging
            OnRootKeyChanged = SampleMapKeysRootKeyChanged
            OnMidiKeyDown = SampleMapKeysMidiKeyDown
            OnMidiKeyUp = SampleMapKeysMidiKeyUp
          end
          object SampleMap: TVamSampleMap
            Left = 2
            Top = 2
            Width = 626
            Height = 239
            Margins.Top = 0
            Opacity = 255
            HitTest = True
            OnOleDragEnter = SampleMapOleDragEnter
            Color_Background = '$FF242B39'
            Color_BackgroundLines = '$FF64718D'
            Color_Region = '$707887A0'
            Color_RegionFocused = '$a0639DFF'
            Color_RegionMouseOver = '$ff639DFF'
            Color_ProposedRegions = '$a0EAEDD3'
            Color_SelectionRect = '$40639DFF'
            Color_RegionError = '$66FF0000'
            Color_OtherKeyGroup = '$55FFD455'
            Color_OtherKeyGroupSelected = '$bbFFD455'
            OnFocusRegion = SampleMapFocusRegion
            OnSelectRegion = SampleMapSelectRegion
            OnDeselectRegion = SampleMapDeselectRegion
            OnDeselectOtherRegions = SampleMapDeselectOtherRegions
            OnDeselectAllRegions = SampleMapDeselectAllRegions
            OnRegionMoved = SampleMapRegionMoved
            OnShowRegionContextMenu = SampleMapShowRegionContextMenu
            OnDragSelectStart = SampleMapDragSelectStart
            OnDragSelectEnd = SampleMapDragSelectEnd
            OnDragSelectionChanged = SampleMapDragSelectionChanged
            OnGetDragRegionCount = SampleMapGetDragRegionCount
            OnNewRegions = SampleMapNewRegions
            OnNewCopiedRegions = SampleMapNewCopiedRegions
            OnReplaceRegion = SampleMapReplaceRegion
            OnShowReplaceRegionMessage = SampleMapShowReplaceRegionMessage
            OnMouseOverRegionChanged = SampleMapMouseOverRegionChanged
            OnRegionInfoChanged = SampleMapRegionInfoChanged
            Align = alClient
            Visible = True
            OnDblClick = SampleMapDblClick
          end
        end
      end
      object UpperPanelArea: TVamPanel
        AlignWithMargins = True
        Left = 3
        Top = 307
        Width = 646
        Height = 85
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 0
        Opacity = 255
        HitTest = True
        Color = '$FF000000'
        CornerRadius1 = 3.000000000000000000
        CornerRadius2 = 3.000000000000000000
        CornerRadius3 = 3.000000000000000000
        CornerRadius4 = 3.000000000000000000
        Transparent = False
        Align = alBottom
        Visible = True
        object RegionInfoBox: TVamPanel
          Left = 25
          Top = 19
          Width = 496
          Height = 28
          Opacity = 255
          Text = 'RegionInfoBox'
          HitTest = True
          Color = '$FFCCCCCC'
          Transparent = False
          Visible = True
          object LowNoteKnob: TVamCompoundNumericKnob
            AlignWithMargins = True
            Left = 365
            Top = 3
            Width = 61
            Height = 22
            Opacity = 255
            Text = 'Low Note'
            HitTest = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Color_Background = '$00000000'
            Color_Label = clGray
            Color_Numeric = clBlack
            Color_Arrows1 = '$cc000000'
            Color_Arrows2 = '$FF000000'
            KnobMin = 0
            KnobMax = 127
            KnobNumericStyle = nsInteger
            KnobDecimalPlaces = 2
            KnobSensitivity = 0.300000011920929000
            Align = alRight
            Visible = True
            ExplicitLeft = 438
          end
          object HighNoteKnob: TVamCompoundNumericKnob
            AlignWithMargins = True
            Left = 231
            Top = 3
            Width = 61
            Height = 22
            Opacity = 255
            Text = 'High Note'
            HitTest = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Color_Background = '$00000000'
            Color_Label = clGray
            Color_Numeric = clBlack
            Color_Arrows1 = '$cc000000'
            Color_Arrows2 = '$FF000000'
            KnobMin = 0
            KnobMax = 127
            KnobNumericStyle = nsInteger
            KnobDecimalPlaces = 2
            KnobSensitivity = 0.300000011920929000
            Align = alRight
            Visible = True
            ExplicitLeft = 304
          end
          object LowVelKnob: TVamCompoundNumericKnob
            AlignWithMargins = True
            Left = 164
            Top = 3
            Width = 61
            Height = 22
            Opacity = 255
            Text = 'Low Vel'
            HitTest = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Color_Background = '$00000000'
            Color_Label = clGray
            Color_Numeric = clBlack
            Color_Arrows1 = '$cc000000'
            Color_Arrows2 = '$FF000000'
            KnobMin = 0
            KnobMax = 127
            KnobNumericStyle = nsInteger
            KnobDecimalPlaces = 2
            KnobSensitivity = 0.300000011920929000
            Align = alRight
            Visible = True
            ExplicitLeft = 237
          end
          object HighVelKnob: TVamCompoundNumericKnob
            AlignWithMargins = True
            Left = 298
            Top = 3
            Width = 61
            Height = 22
            Opacity = 255
            Text = 'High Vel'
            HitTest = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Color_Background = '$00000000'
            Color_Label = clGray
            Color_Numeric = clBlack
            Color_Arrows1 = '$cc000000'
            Color_Arrows2 = '$FF000000'
            KnobMin = 0
            KnobMax = 127
            KnobNumericStyle = nsInteger
            KnobDecimalPlaces = 2
            KnobSensitivity = 0.300000011920929000
            Align = alRight
            Visible = True
            ExplicitLeft = 371
          end
          object RootNoteKnob: TVamCompoundNumericKnob
            AlignWithMargins = True
            Left = 432
            Top = 3
            Width = 61
            Height = 22
            Opacity = 255
            Text = 'Root'
            HitTest = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Color_Background = '$00000000'
            Color_Label = clGray
            Color_Numeric = clBlack
            Color_Arrows1 = '$cc000000'
            Color_Arrows2 = '$FF000000'
            KnobMin = 0
            KnobMax = 127
            KnobNumericStyle = nsInteger
            KnobDecimalPlaces = 2
            KnobSensitivity = 0.300000011920929000
            Align = alRight
            Visible = True
            ExplicitLeft = 505
          end
        end
        object CloseSampleMapButton: TVamTextBox
          Tag = 10
          AlignWithMargins = True
          Left = 548
          Top = 16
          Width = 80
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Opacity = 255
          Text = 'Close'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
          OnClick = CloseSampleMapButtonClick
        end
      end
    end
  end
end
