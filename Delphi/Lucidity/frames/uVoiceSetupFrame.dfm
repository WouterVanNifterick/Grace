object VoiceSetupFrame: TVoiceSetupFrame
  Left = 0
  Top = 0
  Width = 1102
  Height = 708
  TabOrder = 0
  object Panel: TRedFoxContainer
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 1102
    Height = 706
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 2
    Color = '$FFEEEEEE'
    Align = alClient
    object BackgroundPanel: TVamPanel
      Left = 0
      Top = 0
      Width = 1102
      Height = 706
      Opacity = 255
      HitTest = True
      Color = '$FFCCCCCC'
      Transparent = False
      Align = alClient
      Visible = True
      OnResize = BackgroundPanelResize
      object MacroKnobDiv: TVamDiv
        AlignWithMargins = True
        Left = 112
        Top = 115
        Width = 817
        Height = 206
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Opacity = 255
        HitTest = True
        Visible = True
        object MacroDivLabel: TVamLabel
          Left = 0
          Top = 0
          Width = 817
          Height = 18
          Opacity = 255
          Text = 'MACRO CONTROLS'
          HitTest = True
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
        object XYPad1: TVamXYPad
          Tag = 1
          Left = 32
          Top = 32
          Width = 100
          Height = 100
          Opacity = 255
          Text = 'XYPad1'
          HitTest = True
          CornerRadius = 3.000000000000000000
          Color_Background = '$ff242B39'
          Color_Border = '$ff242B39'
          Color_Puck = '$ffA1BDED'
          PosX = 1.000000000000000000
          PosY = 1.000000000000000000
          PadX_VstParameterIndex = 0
          PadY_VstParameterIndex = 0
          Visible = True
          OnChanged = XYPadChanged
        end
        object XYPad2: TVamXYPad
          Tag = 2
          Left = 200
          Top = 32
          Width = 100
          Height = 100
          Opacity = 255
          Text = 'XYPad2'
          HitTest = True
          CornerRadius = 3.000000000000000000
          Color_Background = '$ff242B39'
          Color_Border = '$ff242B39'
          Color_Puck = '$ffA1BDED'
          PosX = 1.000000000000000000
          PosY = 1.000000000000000000
          PadX_VstParameterIndex = 0
          PadY_VstParameterIndex = 0
          Visible = True
          OnChanged = XYPadChanged
        end
        object XYPad3: TVamXYPad
          Tag = 3
          Left = 384
          Top = 32
          Width = 100
          Height = 100
          Opacity = 255
          Text = 'XYPad3'
          HitTest = True
          CornerRadius = 3.000000000000000000
          Color_Background = '$ff242B39'
          Color_Border = '$ff242B39'
          Color_Puck = '$ffA1BDED'
          PosX = 1.000000000000000000
          PosY = 1.000000000000000000
          PadX_VstParameterIndex = 0
          PadY_VstParameterIndex = 0
          Visible = True
          OnChanged = XYPadChanged
        end
        object XYPad4: TVamXYPad
          Tag = 4
          Left = 555
          Top = 32
          Width = 100
          Height = 100
          Opacity = 255
          Text = 'XYPad4'
          HitTest = True
          CornerRadius = 3.000000000000000000
          Color_Background = '$ff242B39'
          Color_Border = '$ff242B39'
          Color_Puck = '$ffA1BDED'
          PosX = 1.000000000000000000
          PosY = 1.000000000000000000
          PadX_VstParameterIndex = 0
          PadY_VstParameterIndex = 0
          Visible = True
          OnChanged = XYPadChanged
        end
        object PadLabel1: TVamLabel
          Left = 32
          Top = 138
          Width = 100
          Height = 16
          Opacity = 255
          Text = 'P4'
          HitTest = True
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
        object PadLabel2: TVamLabel
          Left = 200
          Top = 138
          Width = 100
          Height = 16
          Opacity = 255
          Text = 'P4'
          HitTest = True
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
        object PadLabel3: TVamLabel
          Left = 384
          Top = 138
          Width = 100
          Height = 16
          Opacity = 255
          Text = 'P4'
          HitTest = True
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
        object PadLabel4: TVamLabel
          Left = 555
          Top = 138
          Width = 100
          Height = 16
          Opacity = 255
          Text = 'P4'
          HitTest = True
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
      end
    end
  end
end
