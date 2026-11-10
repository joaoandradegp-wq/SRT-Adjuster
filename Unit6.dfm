object Form6_substituir: TForm6_substituir
  Left = 613
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Substituir'
  ClientHeight = 168
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 17
    Width = 47
    Height = 13
    Caption = 'L&ocalizar:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 74
    Height = 13
    Caption = 'Su&bstituir por:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btn_localizar: TSpeedButton
    Left = 288
    Top = 8
    Width = 105
    Height = 23
    Caption = '&Localizar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btn_localizarClick
  end
  object btn_substituir: TSpeedButton
    Left = 288
    Top = 34
    Width = 105
    Height = 23
    Caption = '&Substituir'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btn_substituirClick
  end
  object btn_substituir_tudo: TSpeedButton
    Left = 288
    Top = 60
    Width = 105
    Height = 23
    Caption = 'Subs&tituir Tudo'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btn_substituir_tudoClick
  end
  object btn_cancelar: TSpeedButton
    Left = 288
    Top = 88
    Width = 105
    Height = 23
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btn_cancelarClick
  end
  object Edit1: TEdit
    Left = 88
    Top = 16
    Width = 180
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 88
    Top = 43
    Width = 180
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = Edit2Change
    OnKeyDown = Edit2KeyDown
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 112
    Width = 198
    Height = 17
    Caption = 'Diferenciar &mai'#250'sculas de min'#250'sculas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 136
    Width = 169
    Height = 17
    Caption = 'Marcar &senten'#231'as encontradas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 8
    Top = 88
    Width = 129
    Height = 17
    Caption = 'Coincidir &palavra inteira'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = CheckBox3Click
  end
end
