object VoiceControlFrame: TVoiceControlFrame
  Left = 0
  Top = 0
  Width = 873
  Height = 364
  TabOrder = 0
  object Panel: TRedFoxContainer
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 873
    Height = 362
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 2
    Color = '$FFEEEEEE'
    Align = alClient
    object BackgroundPanel: TVamPanel
      Left = 0
      Top = 0
      Width = 873
      Height = 362
      Opacity = 255
      HitTest = True
      Color = '$FFCCCCCC'
      Transparent = False
      Align = alClient
      Visible = True
      object VoiceControlsContainer: TVamDiv
        Left = 12
        Top = 15
        Width = 817
        Height = 362
        Opacity = 255
        HitTest = True
        Visible = True
        OnResize = VoiceControlsContainerResize
        object VoiceControlsLabel: TVamLabel
          Left = 0
          Top = 0
          Width = 817
          Height = 18
          Opacity = 255
          Text = 'VOICE CONTROLS'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Align = alTop
          Visible = True
        end
        object GrainStretchControls: TVamDiv
          AlignWithMargins = True
          Left = 62
          Top = 175
          Width = 211
          Height = 70
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 10
          Opacity = 255
          HitTest = True
          Visible = False
          object GrainStretchLabel: TVamLabel
            Left = 0
            Top = 52
            Width = 211
            Height = 18
            Opacity = 255
            Text = 'GRAIN STRETCH '
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alBottom
            Visible = True
          end
          object GrainSizeLabel: TVamLabel
            Left = 0
            Top = 31
            Width = 50
            Height = 16
            Opacity = 255
            Text = 'SIZE'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Visible = True
          end
          object GrainRateLabel: TVamLabel
            Left = 48
            Top = 31
            Width = 50
            Height = 16
            Opacity = 255
            Text = 'RATE'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Visible = True
          end
          object GrainPosLabel: TVamLabel
            Left = 96
            Top = 31
            Width = 50
            Height = 16
            Opacity = 255
            Text = 'POS'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Visible = True
          end
          object GrainLoopLabel: TVamLabel
            Left = 152
            Top = 31
            Width = 50
            Height = 16
            Opacity = 255
            Text = 'LOOP'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Visible = True
          end
          object GrainLoopTextBox: TVamTextBox
            Left = 152
            Top = 17
            Width = 50
            Height = 16
            Opacity = 255
            DisplayClass = 'MenuButton'
            Text = '---'
            HitTest = True
            AutoTrimText = False
            Color = '$FF3E3E3E'
            ColorMouseOver = '$FF3E3E3E'
            ColorBorder = '$00000000'
            ShowBorder = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageOverlayVertAlign = AlignCenter
            ImageOverlayHorzAlign = AlignCenter
            ImageOverlayOffsetX = 0
            ImageOverlayOffsetY = 0
            Visible = True
          end
          object GrainLengthKnob: TVamKnob
            Left = 0
            Top = 1
            Width = 50
            Height = 32
            Opacity = 255
            DisplayClass = 'UniPolarKnob'
            HitTest = True
            ModLineDist = 17.000000000000000000
            ModLineWidth = 3.000000000000000000
            ModLineColor = '$FFFF0000'
            ModLineOffColor = '$FFC0C0C0'
            IndicatorSize = 2.500000000000000000
            IndicatorDist = 9.000000000000000000
            IsBipolarKnob = False
            IsKnobEnabled = True
            KnobMode = PositionEdit
            ModEditRadius = 0.600000023841857900
            VisibleSteps = 0
            MinModDepth = -0.300000011920929000
            MaxModDepth = 0.500000000000000000
            ParameterIndex = 0
            Visible = True
          end
          object GrainRateKnob: TVamKnob
            Left = 48
            Top = 1
            Width = 50
            Height = 32
            Opacity = 255
            DisplayClass = 'BiPolarKnob'
            HitTest = True
            ModLineDist = 17.000000000000000000
            ModLineWidth = 3.000000000000000000
            ModLineColor = '$FFFF0000'
            ModLineOffColor = '$FFC0C0C0'
            IndicatorSize = 2.500000000000000000
            IndicatorDist = 9.000000000000000000
            IsBipolarKnob = False
            IsKnobEnabled = True
            KnobMode = PositionEdit
            ModEditRadius = 0.600000023841857900
            VisibleSteps = 0
            MinModDepth = -0.300000011920929000
            MaxModDepth = 0.500000000000000000
            ParameterIndex = 0
            Visible = True
          end
          object GrainPosKnob: TVamKnob
            Left = 96
            Top = 1
            Width = 50
            Height = 32
            Opacity = 255
            DisplayClass = 'UniPolarKnob'
            HitTest = True
            ModLineDist = 17.000000000000000000
            ModLineWidth = 3.000000000000000000
            ModLineColor = '$FFFF0000'
            ModLineOffColor = '$FFC0C0C0'
            IndicatorSize = 2.500000000000000000
            IndicatorDist = 9.000000000000000000
            IsBipolarKnob = False
            IsKnobEnabled = True
            KnobMode = PositionEdit
            ModEditRadius = 0.600000023841857900
            VisibleSteps = 0
            MinModDepth = -0.300000011920929000
            MaxModDepth = 0.500000000000000000
            ParameterIndex = 0
            Visible = True
          end
        end
        object OscillatorControls: TVamDiv
          AlignWithMargins = True
          Left = 45
          Top = 255
          Width = 211
          Height = 70
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 10
          Opacity = 255
          HitTest = True
          Visible = False
          object OscillatorLabel: TVamLabel
            Left = 0
            Top = 52
            Width = 211
            Height = 18
            Opacity = 255
            Text = 'OSCILLATOR'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alBottom
            Visible = True
          end
          object VamLabel1: TVamLabel
            Left = 0
            Top = 31
            Width = 40
            Height = 16
            Opacity = 255
            Text = 'SHAPE'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Visible = True
          end
          object VamLabel2: TVamLabel
            Left = 40
            Top = 31
            Width = 40
            Height = 16
            Opacity = 255
            Text = 'PW'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Visible = True
          end
          object OscShapeKnob: TVamKnob
            Left = 0
            Top = 1
            Width = 40
            Height = 32
            Opacity = 255
            DisplayClass = 'UniPolarKnob'
            HitTest = True
            ModLineDist = 17.000000000000000000
            ModLineWidth = 3.000000000000000000
            ModLineColor = '$FFFF0000'
            ModLineOffColor = '$FFC0C0C0'
            IndicatorSize = 2.500000000000000000
            IndicatorDist = 9.000000000000000000
            IsBipolarKnob = False
            IsKnobEnabled = True
            KnobMode = PositionEdit
            ModEditRadius = 0.600000023841857900
            VisibleSteps = 0
            MinModDepth = -0.300000011920929000
            MaxModDepth = 0.500000000000000000
            ParameterIndex = 0
            Visible = True
          end
          object OscPulseWidthKnob: TVamKnob
            Left = 40
            Top = 1
            Width = 40
            Height = 32
            Opacity = 255
            DisplayClass = 'UniPolarKnob'
            HitTest = True
            ModLineDist = 17.000000000000000000
            ModLineWidth = 3.000000000000000000
            ModLineColor = '$FFFF0000'
            ModLineOffColor = '$FFC0C0C0'
            IndicatorSize = 2.500000000000000000
            IndicatorDist = 9.000000000000000000
            IsBipolarKnob = False
            IsKnobEnabled = True
            KnobMode = PositionEdit
            ModEditRadius = 0.600000023841857900
            VisibleSteps = 0
            MinModDepth = -0.300000011920929000
            MaxModDepth = 0.500000000000000000
            ParameterIndex = 0
            Visible = True
          end
        end
        object OneShotSampleControls: TVamDiv
          AlignWithMargins = True
          Left = 292
          Top = 255
          Width = 211
          Height = 70
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 10
          Opacity = 255
          HitTest = True
          Visible = False
          object SampleOneShotLabel: TVamLabel
            Left = 0
            Top = 52
            Width = 211
            Height = 18
            Opacity = 255
            Text = 'SAMPLE ONE-SHOT'
            HitTest = True
            AutoTrimText = False
            AutoSize = False
            TextAlign = AlignCenter
            TextVAlign = AlignCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alBottom
            Visible = True
          end
        end
        object PlaybackTypeLabel: TVamLabel
          Left = 602
          Top = 269
          Width = 118
          Height = 16
          Opacity = 255
          Text = 'PLAYBACK'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object SamplePlaybackTypeTextbox: TVamTextBox
          Left = 602
          Top = 255
          Width = 118
          Height = 16
          Opacity = 255
          DisplayClass = 'MenuButton'
          Text = '---'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
        end
        object ResetLabel: TVamLabel
          Left = 455
          Top = 46
          Width = 70
          Height = 16
          Opacity = 255
          Text = 'RESET'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object ResetTextBox: TVamTextBox
          Left = 455
          Top = 32
          Width = 70
          Height = 16
          Opacity = 255
          DisplayClass = 'MenuButton'
          Text = '---'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
        end
        object VoicePitch1Knob: TVamKnob
          Left = 128
          Top = 41
          Width = 40
          Height = 32
          Opacity = 255
          DisplayClass = 'SmallBipolarKnob'
          HitTest = True
          ModLineDist = 17.000000000000000000
          ModLineWidth = 3.000000000000000000
          ModLineColor = '$FFFF0000'
          ModLineOffColor = '$FFC0C0C0'
          IndicatorSize = 2.500000000000000000
          IndicatorDist = 9.000000000000000000
          IsBipolarKnob = False
          IsKnobEnabled = True
          KnobMode = PositionEdit
          ModEditRadius = 0.600000023841857900
          VisibleSteps = 0
          MinModDepth = -0.300000011920929000
          MaxModDepth = 0.500000000000000000
          ParameterIndex = 0
          Visible = True
        end
        object VoicePitch1Label: TVamLabel
          Left = 128
          Top = 71
          Width = 40
          Height = 16
          Opacity = 255
          Text = 'TUNE'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object VoicePitch2Label: TVamLabel
          Left = 168
          Top = 71
          Width = 40
          Height = 16
          Opacity = 255
          Text = 'FINE'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object VoicePitch2Knob: TVamKnob
          Left = 168
          Top = 41
          Width = 40
          Height = 32
          Opacity = 255
          DisplayClass = 'SmallBipolarKnob'
          HitTest = True
          ModLineDist = 17.000000000000000000
          ModLineWidth = 3.000000000000000000
          ModLineColor = '$FFFF0000'
          ModLineOffColor = '$FFC0C0C0'
          IndicatorSize = 2.500000000000000000
          IndicatorDist = 9.000000000000000000
          IsBipolarKnob = False
          IsKnobEnabled = True
          KnobMode = PositionEdit
          ModEditRadius = 0.600000023841857900
          VisibleSteps = 0
          MinModDepth = -0.300000011920929000
          MaxModDepth = 0.500000000000000000
          ParameterIndex = 0
          Visible = True
        end
        object LoopBoundsTextBox: TVamTextBox
          Left = 399
          Top = 32
          Width = 50
          Height = 16
          Opacity = 255
          DisplayClass = 'MenuButton'
          Text = '---'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
        end
        object LoopBoundsLabel: TVamLabel
          Left = 399
          Top = 46
          Width = 50
          Height = 16
          Opacity = 255
          Text = 'BOUNDS'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object VoiceModeTextBox: TVamTextBox
          Left = 650
          Top = 32
          Width = 70
          Height = 16
          Opacity = 255
          DisplayClass = 'MenuButton'
          Text = '---'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
        end
        object VoiceModeLabel: TVamLabel
          Left = 650
          Top = 46
          Width = 70
          Height = 16
          Opacity = 255
          Text = 'MODE'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object GlideKnob: TVamKnob
          Left = 726
          Top = 20
          Width = 40
          Height = 32
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
          IsKnobEnabled = True
          KnobMode = PositionEdit
          ModEditRadius = 0.600000023841857900
          VisibleSteps = 0
          MinModDepth = -0.300000011920929000
          MaxModDepth = 0.500000000000000000
          ParameterIndex = 0
          Visible = True
        end
        object GlideLabel: TVamLabel
          Left = 726
          Top = 50
          Width = 40
          Height = 16
          Opacity = 255
          Text = 'GLIDE'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object TriggerModeLabel: TVamLabel
          Left = 337
          Top = 46
          Width = 50
          Height = 16
          Opacity = 255
          Text = 'TRIGGER'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object TriggerModeTextBox: TVamTextBox
          Left = 337
          Top = 32
          Width = 50
          Height = 16
          Opacity = 255
          DisplayClass = 'MenuButton'
          Text = '---'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
        end
        object PitchTrackTextBox: TVamTextBox
          Left = 256
          Top = 32
          Width = 70
          Height = 16
          Opacity = 255
          DisplayClass = 'MenuButton'
          Text = '---'
          HitTest = True
          AutoTrimText = False
          Color = '$FF3E3E3E'
          ColorMouseOver = '$FF3E3E3E'
          ColorBorder = '$00000000'
          ShowBorder = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageOverlayVertAlign = AlignCenter
          ImageOverlayHorzAlign = AlignCenter
          ImageOverlayOffsetX = 0
          ImageOverlayOffsetY = 0
          Visible = True
        end
        object PitchTrackLabel: TVamLabel
          Left = 256
          Top = 46
          Width = 70
          Height = 16
          Opacity = 255
          Text = 'TRACK'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object MainOutputKnob: TVamKnob
          Left = 22
          Top = 55
          Width = 40
          Height = 32
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
          IsKnobEnabled = True
          KnobMode = PositionEdit
          ModEditRadius = 0.600000023841857900
          VisibleSteps = 0
          MinModDepth = -0.300000011920929000
          MaxModDepth = 0.500000000000000000
          ParameterIndex = 0
          Visible = True
        end
        object MainOutputLabel: TVamLabel
          Left = 22
          Top = 86
          Width = 40
          Height = 16
          Opacity = 255
          Text = 'GAIN'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object MainPanKnob: TVamKnob
          Left = 65
          Top = 53
          Width = 40
          Height = 32
          Opacity = 255
          DisplayClass = 'SmallBipolarKnob'
          HitTest = True
          ModLineDist = 17.000000000000000000
          ModLineWidth = 3.000000000000000000
          ModLineColor = '$FFFF0000'
          ModLineOffColor = '$FFC0C0C0'
          IndicatorSize = 2.500000000000000000
          IndicatorDist = 9.000000000000000000
          IsBipolarKnob = False
          IsKnobEnabled = True
          KnobMode = PositionEdit
          ModEditRadius = 0.600000023841857900
          VisibleSteps = 0
          MinModDepth = -0.300000011920929000
          MaxModDepth = 0.500000000000000000
          ParameterIndex = 0
          Visible = True
        end
        object MainPanLabel: TVamLabel
          Left = 65
          Top = 85
          Width = 40
          Height = 16
          Opacity = 255
          Text = 'PAN'
          HitTest = True
          AutoTrimText = False
          AutoSize = False
          TextAlign = AlignCenter
          TextVAlign = AlignCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Visible = True
        end
        object VoiceLevelMeter: TVamMiniLevelMeter
          Left = 8
          Top = 37
          Width = 8
          Height = 65
          Opacity = 255
          Text = 'VoiceLevelMeter'
          HitTest = True
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 40
    OnTimer = Timer1Timer
    Left = 256
    Top = 112
  end
end
