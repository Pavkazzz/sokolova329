object Form_main: TForm_main
  Left = 0
  Top = 0
  Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1073#1083#1086#1082'-'#1089#1093#1077#1084#1099
  ClientHeight = 224
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 13
    Width = 186
    Height = 16
    Caption = #1042#1099#1073#1080#1088#1077#1090#1077' '#1092#1072#1081#1083' '#1080#1089#1093#1086#1076#1085#1086#1075#1086' '#1082#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 97
    Width = 150
    Height = 16
    Caption = #1071#1079#1099#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 144
    Width = 116
    Height = 13
    Caption = #1050#1091#1076#1072' '#1101#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 41
    Width = 275
    Height = 19
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'C:\'
  end
  object Button1: TButton
    Left = 224
    Top = 10
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 208
    Top = 96
    Width = 75
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'Pascal'
  end
  object ComboBox2: TComboBox
    Left = 208
    Top = 141
    Width = 75
    Height = 21
    TabOrder = 3
    Text = 'jpg'
  end
  object Button2: TButton
    Left = 24
    Top = 191
    Width = 259
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 192
    object N1: TMenuItem
      Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1082#1086#1076
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
      end
      object N3: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        Enabled = False
      end
      object C1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
    end
    object N4: TMenuItem
      Caption = #1071#1079#1099#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103
      object N5: TMenuItem
        Caption = 'Pascal'
        Checked = True
      end
    end
    object J1: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    end
    object N6: TMenuItem
      Caption = #1042#1099#1093#1086#1076
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 352
    Top = 192
  end
end
